within TransiEnt.Producer.Electrical.Wind;
model IdealWindpark "Ideal Windpark - neglecting correlation of Turbines"

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Windparkmodel;
  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Modelica.SIunits.Length z_0=0.3 "Roughness length";
  parameter Modelica.SIunits.Length h=120 "Hub height of turbines in park";
  parameter Modelica.SIunits.Length d=100 "Average distance between turbines in park";
  parameter Modelica.SIunits.Velocity v_mean=10 "Mean wind velocity of park site";

  parameter Modelica.SIunits.Velocity v_wind_start=0 "Wind speed start value";
  parameter Real P_nom = 3.3e6 "Nominated power of single wind turbine";
  parameter Real n_Turbines=10 "Number of wind turbines";

  replaceable TransiEnt.Producer.Electrical.Wind.Base.PartialWindTurbine WTG(redeclare model ProducerCosts = ProducerCosts, P_el_n=3.3e6) "Wind turbine model" annotation (choicesAllMatching=true, Placement(transformation(extent={{-70,-38},{-26,6}})));

  parameter TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.WindOnshore "Type of primary energy carrier for co2 emissions global statistics" annotation (Dialog(group="Statistics"), HideResult=not simCenter.isExpertMode);

  replaceable model ProducerCosts =
      TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.WindOnshore
                                                                                      constrainedby TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.PartialPowerPlantCostSpecs
                                              "Wind turbine model" annotation (Dialog(group="Statistics"),
      __Dymola_choicesAllMatching=true);

  parameter TransiEnt.Basics.Types.TypeOfResource typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Renewable "Type of energy resource for global model statistics" annotation (
    Dialog(group="Statistics"),
    HideResult=not simCenter.isExpertMode,
    Placement(transformation(extent=100)));

  // _____________________________________________
  //
  //           Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ActivePowerPort epp annotation (Placement(transformation(extent={{94,-10},{114,10}})));
  Modelica.Blocks.Interfaces.RealInput v_wind annotation (Placement(transformation(extent={{-124,-22},{-84,18}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Sources.RealExpression Power_Windpark(y=WTG.epp.P*n_Turbines)
    annotation (Placement(transformation(extent={{-10,50},{18,68}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency TurbineTerminal(useInputConnector=true) annotation (Placement(transformation(extent={{8,-12},{28,8}})));
  Modelica.Blocks.Sources.RealExpression f_grid(y=epp.f) annotation (Placement(transformation(extent={{-22,14},
            {0,32}})));
  TransiEnt.Components.Boundaries.Electrical.Power Power(change_sign=false) annotation (Placement(transformation(extent={{54,32},{74,52}})));

  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectElectricPower collectElectricPower annotation (Placement(transformation(extent={{30,-100},{50,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectGwpEmissionsElectric collectGwpEmissions(typeOfEnergyCarrier=typeOfPrimaryEnergyCarrier) annotation (Placement(transformation(extent={{-8,-100},{12,-80}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.PowerPlantCost collectCosts(
    P_n=P_nom*(n_Turbines - 1) "N-1 because the wind turbine model instance adds to statistics itself",
    redeclare model PowerPlantCostModel = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.WindOnshore,
    P_el_is=P_el_is,
    Q_flow_fuel_is=0) annotation (HideResult=false, Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,-90})));

  // _____________________________________________
  //
  //           Variables
  // _____________________________________________

  Modelica.SIunits.ActivePower P_el_is=-epp.P;

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

   collectElectricPower.powerCollector.P=epp.P-WTG.epp.P;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________
    connect(modelStatistics.powerCollector[typeOfResource],collectElectricPower.powerCollector);
  connect(modelStatistics.costsCollector, collectCosts.costsCollector);
  connect(f_grid.y,TurbineTerminal. f_set) annotation (Line(points={{1.1,23},
          {12.6,23},{12.6,10}},                                                                                        color={0,0,127}));
  connect(v_wind, WTG.v_wind) annotation (Line(points={{-104,-2},{-67.58,-2},{-67.58,-2.58}},
                   color={0,0,127}));
  connect(WTG.epp, TurbineTerminal.epp) annotation (Line(
      points={{-27.1,-3.68},{-4,-3.68},{-4,-2.1},{7.9,-2.1}},
      color={0,135,135},
      thickness=0.5));
  connect(Power.P_el_set, Power_Windpark.y) annotation (Line(points={{58,54},{58,54},{58,59},{19.4,59}}, color={0,0,127}));
  connect(Power.epp, epp) annotation (Line(
      points={{53.9,41.9},{46,41.9},{46,0},{104,0}},
      color={0,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),                                                                     Documentation(info="<html>
<p><span style=\"font-family: MS Shell Dlg 2;\">1<b><span style=\"color: #008000;\">. Purpose of model</span></b></p>
<p>Simple Windparkmodel neglecting coherence and smoothing effect of distributed wind turbines. Use of Synthtic Inertia possible.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarsk for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Rebekka Denninger on June 21 2016</span></p>
</html>"));
end IdealWindpark;
