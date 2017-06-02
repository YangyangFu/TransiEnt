within TransiEnt.Producer.Electrical.Wind.Check;
model TestPowerCurveWindPlant
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
  extends TransiEnt.Basics.Icons.Checkmodel;
  TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_Fuhlsbuettel_3600s_2012 wind_Hamburg_3600s_175m annotation (Placement(transformation(extent={{-76,-14},{-56,6}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency constantFrequency_L1_1(useInputConnector=false) annotation (Placement(transformation(extent={{70,-16},{90,4}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-104,80},{-84,100}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  PowerCurveWindPlant windTurbine_L0_scale_SenvionM104(
    PowerCurveChar=Characteristics.SenvionM104_3400kW(),
    P_el_n=51e6,
    height_data=175,
    height_hub=125) annotation (Placement(transformation(extent={{-8,26},{12,46}})));
  PowerCurveWindPlant windTurbine_L0_scale_EnerconE82(
    PowerCurveChar=Characteristics.EnerconE82_2000kW(),
    height_data=175,
    height_hub=125) annotation (Placement(transformation(extent={{-8,-22},{12,-2}})));
  PowerCurveWindPlant windTurbine_L0_scale_VestasV164_Offshore(
    redeclare model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.WindOffshore,
    height_data=100,
    P_el_n=68e6,
    height_hub=100) annotation (Placement(transformation(extent={{-6,-70},{14,-50}})));
  inner TransiEnt.Components.Boundaries.Ambient.AmbientConditions ambientConditions annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
equation
  connect(constantFrequency_L1_1.epp, windTurbine_L0_scale_SenvionM104.epp) annotation (Line(
      points={{69.9,-6.1},{36,-6.1},{36,41.6},{11.5,41.6}},
      color={0,135,135},
      thickness=0.5));
  connect(constantFrequency_L1_1.epp, windTurbine_L0_scale_EnerconE82.epp) annotation (Line(
      points={{69.9,-6.1},{36,-6.1},{36,-6.4},{11.5,-6.4}},
      color={0,135,135},
      thickness=0.5));
  connect(windTurbine_L0_scale_VestasV164_Offshore.epp, constantFrequency_L1_1.epp) annotation (Line(
      points={{13.5,-54.4},{35.65,-54.4},{35.65,-6.1},{69.9,-6.1}},
      color={0,135,135},
      thickness=0.5));
public
function plotResult

  constant String resultFileName = "TestPowerCurveWindPlant.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={0, 0, 793, 681}, y={"wind_Hamburg_3600s_175m.value"}, range={0.0, 30000.0, 2.0, 6.0}, grid=true, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=1, position={0, 0, 793, 338}, y={"windTurbine_L0_scale_SenvionM104.P_el_is", "windTurbine_L0_scale_EnerconE82.P_el_is",
 "windTurbine_L0_scale_VestasV164_Offshore.P_el_is"}, range={0.0, 30000.0, -10000000.0, 6000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}, {0,140,72}}, filename=resultFileName);
   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(wind_Hamburg_3600s_175m.y1, windTurbine_L0_scale_SenvionM104.v_wind) annotation (Line(points={{-55,-4},{-32,-4},{-32,-6},{-32,42.1},{-6.9,42.1}},          color={0,0,127}));
  connect(wind_Hamburg_3600s_175m.y1, windTurbine_L0_scale_EnerconE82.v_wind) annotation (Line(points={{-55,-4},{-40,-4},{-6.9,-4},{-6.9,-5.9}},          color={0,0,127}));
  connect(wind_Hamburg_3600s_175m.y1, windTurbine_L0_scale_VestasV164_Offshore.v_wind) annotation (Line(points={{-55,-4},{-32,-4},{-32,-54},{-4.9,-54},{-4.9,-53.9}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
                                     Text(
          extent={{-16,26},{22,12}},
          lineColor={0,0,255},
          textString="Senvion M104: 3.4 MW
20 x 3.4= 68"),   Text(
          extent={{-96,78},{-56,48}},
          lineColor={0,128,0},
          textString="Plot: 
* windpark.value 
* windproduction wind hh 900s , value
",        horizontalAlignment=TextAlignment.Left),
                                     Text(
          extent={{-16,-22},{22,-36}},
          lineColor={0,0,255},
          textString="Enercon E82: 2 MW
34 x 2=68"),                         Text(
          extent={{-16,-70},{22,-84}},
          lineColor={0,0,255},
          textString="Vestas V164: 8MW
scaled up to 68MW
Test for Offshore Conditions
(cut out+cut backin velocity, LCOE)")}),                                                                      experiment(StopTime=604800, Interval=900));
end TestPowerCurveWindPlant;