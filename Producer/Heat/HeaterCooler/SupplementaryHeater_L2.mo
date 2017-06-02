within TransiEnt.Producer.Heat.HeaterCooler;
model SupplementaryHeater_L2 "Model of a boiler that holds temperature in a grid"

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

  import TransiEnt;
  extends TransiEnt.Basics.Icons.Model;
  outer TransiEnt.SimCenter simCenter;
  outer TransiEnt.ModelStatistics modelStatistics;

  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.fluid1 "Medium in the component";
  parameter TILMedia.VLEFluidTypes.BaseVLEFluid fuelMedium=simCenter.gasModel1 "Fuel of the component";
  parameter TransiEnt.Basics.Types.TypeOfResource typeOfResource=EnergyResource.Conventional;
  parameter SI.TemperatureDifference dT_allowed=2 "Turn on threshold";
  parameter SI.Efficiency eta=0.94 "Efficiency of burner";
  parameter SI.Pressure p_nom=simCenter.p_n[2] "Nominal and initial pressure";
  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________
  replaceable function CalorificValue =
      TransiEnt.Basics.Functions.GasProperties.getRealGasNCV_xi "Function to calculate specific heating value";

  ClaRa.Components.HeatExchangers.TubeBundle_L2 heatExchanger(
    medium=medium,
    m_flow_nom=20,
    h_start=70*4200,
    p_start=p_nom,
    p_nom=p_nom) annotation (Placement(transformation(
      extent={{10,-10},{-10,10}},
      rotation=180,
      origin={0,0})));
  TransiEnt.Components.Sensors.TemperatureSensor temperatureOut annotation (Placement(transformation(extent={{94,24},{74,44}})));
  TransiEnt.Components.Sensors.TemperatureSensor temperatureIn annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-74,26})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow boilerHeat(Q_flow(start=0)) annotation (Placement(transformation(
      extent={{-10,-10},{10,10}},
      rotation=90,
      origin={0,-48})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectHeatingPower collectHeatingPower(typeOfResource=EnergyResource.Conventional) annotation (Placement(transformation(extent={{-80,80},{-60,100}})));

  // _____________________________________________
  //
  //                   Variables
  // _____________________________________________
  Boolean switch(start=false);
  SI.MassFlowRate m_flow_fuel;

  // _____________________________________________
  //
  //                   Interfaces
  // _____________________________________________
  TransiEnt.Basics.Interfaces.Thermal.FluidPortIn waterPortIn(Medium=medium) annotation (Placement(transformation(extent={{-110,-10},{-90,10}}), iconTransformation(extent={{90,-10},{110,10}})));
  TransiEnt.Basics.Interfaces.Thermal.FluidPortOut waterPortOut(Medium=medium) annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Gas.RealGasPortIn gasPortIn(Medium=fuelMedium) annotation (Placement(transformation(extent={{-10,88},{10,108}})));

equation
  assert(gasPortIn.m_flow >= 0, "Your boiler is a gas source.");

  // _____________________________________________
  //
  //            Characteristic equations
  // _____________________________________________

  //switch on when inlet temperature is dT_allowed below heatingCurve.T_supply
  if pre(switch) == false and (simCenter.heatingCurve.T_supply -
      temperatureIn.T_celsius) > dT_allowed then
    switch = true;
  //switch off as soon as supply temperature is reached
  elseif pre(switch) == true and (simCenter.heatingCurve.T_supply -
      temperatureIn.T_celsius) < 0 then
    switch = false;
  else
    switch = pre(switch);
  end if;

  if switch then
    boilerHeat.Q_flow =waterPortIn.m_flow*4200*(simCenter.heatingCurve.T_supply - temperatureIn.T_celsius);
  else
    boilerHeat.Q_flow = 0;
  end if;
  boilerHeat.Q_flow = -collectHeatingPower.heatFlowCollector.Q_flow;

  //Calculation of heating values not yet implemented
  m_flow_fuel = -boilerHeat.Q_flow/CalorificValue(fuelMedium,inStream(gasPortIn.xi_outflow), 4.5e6)/eta;

  //Connector equations
  gasPortIn.m_flow = m_flow_fuel;
  gasPortIn.h_outflow = 0;
  gasPortIn.xi_outflow = zeros(fuelMedium.nc - 1);

  // _____________________________________________
  //
  //            Connect statements
  // _____________________________________________

  connect(collectHeatingPower.heatFlowCollector, modelStatistics.heatFlowCollector[
    typeOfResource]);
  connect(temperatureOut.port, waterPortOut) annotation (Line(
      points={{84,24},{100,24},{100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(temperatureIn.port, waterPortIn) annotation (Line(
      points={{-74,36},{-100,36},{-100,0}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(boilerHeat.port, heatExchanger.heat) annotation (Line(
      points={{0,-38},{0,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(waterPortIn, heatExchanger.inlet) annotation (Line(
      points={{-100,0},{-10,0}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(waterPortOut, heatExchanger.outlet) annotation (Line(
      points={{100,0},{10,0}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
    annotation (choices(
      choice=2 "Conventional",
      choice=3 "Cogeneration",
      choice=4 "Renewable",
      choice=5 "Generic"),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
          Polygon(
          points={{-68,-28},{-56,22},{-52,4},{-38,40},{-30,14},{-22,38},{-12,12},
              {-12,14},{-6,70},{8,32},{14,48},{14,46},{20,26},{42,44},{36,20},{64,
              26},{56,6},{58,-28},{-68,-28}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,128,0},
          fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Peak load heater to reach specified supply temperature defined by heating curve with specified deviation dT_allowed.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Arne Koeppen (arne.koeppen@tuhh.de), Jun 2013</p>
<p>Revised by Lisa Andresen (andresen@tuhh.de), Aug 2013</p>
</html>"));
end SupplementaryHeater_L2;
