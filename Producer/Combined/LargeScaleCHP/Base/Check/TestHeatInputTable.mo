within TransiEnt.Producer.Combined.LargeScaleCHP.Base.Check;
model TestHeatInputTable
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

  Modelica.Blocks.Sources.Ramp Q_flow_set(
    height=pQBoundaries.PQCharacteristics.PQboundaries[4, 1],
    duration=5*3600,
    offset=0,
    startTime=0) annotation (Placement(transformation(extent={{-70,22},{-50,42}})));
public
function plotResult

  constant String resultFileName = "TestHeatInputTable.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=2, position={809, 0, 791, 817}, y={"Q_flow_set.y"}, range={0.0, 22000.0, -50000000.0, 250000000.0}, grid=true, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=2, position={809, 0, 791, 269}, y={"P_el_set.y"}, range={0.0, 22000.0, 40000000.0, 140000000.0}, grid=true, subPlot=2, colors={{28,108,200}}, filename=resultFileName);
createPlot(id=2, position={809, 0, 791, 269}, y={"heatInputTable.Q_flow_input"}, range={0.0, 22000.0, 100000000.0, 400000000.0}, grid=true, subPlot=3, colors={{28,108,200}}, filename=resultFileName);

  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  PQBoundaries pQBoundaries annotation (Placement(transformation(extent={{-28,20},{-4,44}})));
  HeatInputTable heatInputTable annotation (Placement(transformation(extent={{8,-28},{28,-8}})));
  Modelica.Blocks.Logical.Switch P_el_set annotation (Placement(transformation(extent={{38,20},{58,40}})));
  Modelica.Blocks.Sources.BooleanExpression switchToElectricFullLoad(y=time > 7200) annotation (Placement(transformation(extent={{8,20},{28,40}})));
equation
  connect(pQBoundaries.Q_flow, Q_flow_set.y) annotation (Line(points={{-30.4,32},{-49,32}}, color={0,0,127}));
  connect(Q_flow_set.y, heatInputTable.Q) annotation (Line(points={{-49,32},{-38,32},{-38,10},{25,10},{25,-6}}, color={0,0,127}));
  connect(switchToElectricFullLoad.y, P_el_set.u2) annotation (Line(points={{29,30},{32,30},{36,30}}, color={255,0,255}));
  connect(P_el_set.y, heatInputTable.P) annotation (Line(points={{59,30},{59,30},{70,30},{70,4},{11,4},{11,-6}}, color={0,0,127}));
  connect(pQBoundaries.P_max, P_el_set.u1) annotation (Line(points={{-2.8,37.28},{2,37.28},{2,50},{32,50},{32,38},{36,38}}, color={0,0,127}));
  connect(pQBoundaries.P_min, P_el_set.u3) annotation (Line(points={{-2.8,28.4},{0,28.4},{0,16},{32,16},{32,22},{36,22}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=21600));
end TestHeatInputTable;