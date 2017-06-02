within TransiEnt;
model ModelStatistics
//___________________________________________________________________________//
// Component of the TransiEnt Library, version: 1.0.1                        //
//                                                                           //
// Licensed by Hamburg University of Technology under Modelica License 2.    //
// Copyright 2017, Hamburg University of Technology.                         //
//___________________________________________________________________________//
//                                                                           //
// TransiEnt.EE is a research project supported by the German Federal        //
// Ministry of Economics and Energy (FKZ 03ET4003).                          //
// The TransiEnt.EE research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology)//
// Institute of Energy Systems (Hamburg University of Technology),           //
// Institute of Electrical Power Systems and Automation                      //
// (Hamburg University of Technology),                                       //
// and is supported by                                                       //
// XRG Simulation GmbH (Hamburg, Germany).                                   //
//___________________________________________________________________________//
  extends TransiEnt.Basics.Icons.OuterElement;

  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //              Final parameters
  // _____________________________________________

  final parameter Integer nTypesOfResource=TransiEnt.Basics.Types.nTypeOfResource annotation (HideResult=true);

  final parameter Integer nSubgrids=2 "For calculation of statistics in subgrids (=1 local grid, e.g. hamburg, =2 surrounding grid, e.g. UCTE grid"
                                                                                              annotation(HideResult=true);
  final parameter Integer nTypes=TransiEnt.Basics.Types.nTypeOfPrimaryEnergyCarrier annotation (HideResult=true);

  final parameter Integer nTypesHeat=TransiEnt.Basics.Types.nTypeOfPrimaryEnergyCarrierHeat annotation (HideResult=true);
  // _____________________________________________
  //
  //                  Variables
  // _____________________________________________


  Components.Statistics.Collectors.GlobalCollectors.GwpEmissionsStatistics gwpEmissions(final nTypesHeat=nTypesHeat, final nTypes=nTypes) annotation (Placement(transformation(extent={{28,-78},{80,-28}})));
  Components.Statistics.Collectors.GlobalCollectors.ElectricPowerStatistics electricPower(final nSubgrids=nSubgrids, final nTypes=nTypesOfResource) annotation (Placement(transformation(extent={{-76,18},{-24,66}})));
  Components.Statistics.Collectors.GlobalCollectors.HeatingPowerStatistics heatingPower(final nTypes=nTypesOfResource) annotation (Placement(transformation(extent={{30,18},{82,66}})));

  Components.Statistics.Collectors.GlobalCollectors.EconomicStatistics totalIncurredCosts annotation (Placement(transformation(extent={{-74,-78},{-22,-28}})));

  TransiEnt.Basics.Units.MassOfCDEperEnergy m_CDE_electricity_per_Energy=gwpEmissions.m_flow_CDE_total_electricity/(electricPower.P_gen_total + simCenter.P_el_small) "x 3.6e9 = g/kWh";
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_CDE_electricity_per_ConsumedEnergy=gwpEmissions.m_flow_CDE_total_electricity/(electricPower.P_demand + simCenter.P_el_small) "x 3.6e9 = g/kWh";
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_CDE_districtheating_per_Energy=gwpEmissions.m_flow_CDE_total_heat/(heatingPower.Q_flow_gen_cogeneration + simCenter.P_el_small) "x 3.6e9 = g/kWh";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  // Note that these can not be moved to a subclass (e.g. in order to group them) because that leads to a
  // Dymola warning for each connector.

  // ------- Electric power statistics -------
  Basics.Interfaces.General.PowerCollector powerCollector[nTypesOfResource] annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector primBalPowerCollector[nTypesOfResource] annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector primBalPowerOfferCollector[2] annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector secBalPowerCollector[nTypesOfResource] annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector secBalPowerOfferCollector[2] annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector surroundingGridLoad annotation (HideResult=true);

  Basics.Interfaces.General.PowerCollector tielinePowerCollector "Power on tieline to subsystem" annotation (HideResult=true);
  Basics.Interfaces.General.PowerCollector tielineSetPowerCollector "Scheduled imports to subsystem" annotation (HideResult=true);

  TransiEnt.Basics.Interfaces.General.KineticEnergyCollector kineticEnergyCollector[nSubgrids];

  // -------- Carbon dioxide emissions -------
  Basics.Interfaces.General.GwpEmissionCollector gwpCollector[nTypes] annotation (HideResult=true);

  Basics.Interfaces.General.GwpEmissionCollector gwpCollectorHeat[nTypesHeat] annotation (HideResult=true);

  // -------- Heating power statistics -------
  Basics.Interfaces.General.HeatFlowCollector heatFlowCollector[nTypesOfResource];
  // ---------- Cost statistics ------
  Basics.Interfaces.General.CostsCollector costsCollector annotation (HideResult=True);

equation
  //
  // Pass collector values to statistic components
  //
  for i in 1:nTypesOfResource loop
    powerCollector[i].P = electricPower.powerCollector[i];
    primBalPowerCollector[i].P = electricPower.primBalPowerCollector[i];
    secBalPowerCollector[i].P = electricPower.secBalPowerCollector[i];
    heatFlowCollector[i].Q_flow = heatingPower.heatFlowCollector[i];
  end for;

  for i in 1:nTypes loop
    gwpCollector[i].m_flow_cde = gwpEmissions.gwpCollector[i];
  end for;

  for i in 1:nTypesHeat loop
    gwpCollectorHeat[i].m_flow_cde = gwpEmissions.gwpCollectorHeat[i];
  end for;
  primBalPowerOfferCollector[1].P=electricPower.primBalPowerOfferCollector[1];
  primBalPowerOfferCollector[2].P=electricPower.primBalPowerOfferCollector[2];
  secBalPowerOfferCollector[1].P=electricPower.secBalPowerOfferCollector[1];
  secBalPowerOfferCollector[2].P=electricPower.secBalPowerOfferCollector[2];
  tielinePowerCollector.P=electricPower.tielinePowerCollector;
  tielineSetPowerCollector.P=electricPower.tielineSetPowerCollector;

  for i in 1:nSubgrids loop
  kineticEnergyCollector[i].E_kin = electricPower.kineticEnergyCollector[i];
  end for;
  surroundingGridLoad.P = -electricPower.surroundingGridLoad;

  costsCollector.Costs=totalIncurredCosts.costsCollector[1];
  costsCollector.InvestCosts=totalIncurredCosts.costsCollector[2];
  costsCollector.DemandCosts=totalIncurredCosts.costsCollector[3];
  costsCollector.OMCosts=totalIncurredCosts.costsCollector[4];
  costsCollector.OtherCosts=totalIncurredCosts.costsCollector[5];
  costsCollector.Revenues=totalIncurredCosts.costsCollector[6];

  annotation (
    defaultComponentName="modelStatistics",
    defaultComponentPrefixes="inner",
        missingInnerMessage=
        "Your model is using an outer \"modelStatistics\" but it does not contain an inner \"modelStatistics\" component. Drag model TransiEnt.ModelStatistics into your model to make it work.",
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{96,96}}, fileName="modelica://TransiEnt/Images/ModelStatistics.png"),
                                                                             Text(
          extent={{-96,-98},{104,-64}},
          lineColor={62,62,62},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,134,134},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Line(
          points={{0,100},{0,-100}},
          color={95,95,95},
          smooth=Smooth.None),
        Line(
          points={{-100,0},{102,0}},
          color={95,95,95},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>Global parameters for all models depending only on TransiEnt core library.</p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color:#008000\">7. Remarsk for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) on Mon Aug 18 2014</p>
</html>"));
end ModelStatistics;