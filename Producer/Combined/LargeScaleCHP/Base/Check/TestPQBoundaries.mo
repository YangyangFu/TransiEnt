within TransiEnt.Producer.Combined.LargeScaleCHP.Base.Check;
model TestPQBoundaries
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
    startTime=0) annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  PQBoundaries pQBoundaries annotation (Placement(transformation(extent={{-28,-24},{18,22}})));
equation
  connect(Q_flow_set.y, pQBoundaries.Q_flow) annotation (Line(points={{-55,0},{-32.6,0},{-32.6,-1}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestPQBoundaries.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

  createPlot(id=2, position={0, 0, 1490, 670}, y={"Q_flow_set.y"}, range={0.0, 22000.0, -50000000.0, 250000000.0}, grid=true, colors={{28,108,200}}, filename=resultFileName);
  createPlot(id=2, position={0, 0, 1490, 332}, y={"pQBoundaries.P_max", "pQBoundaries.P_min"}, range={0.0, 6.0, 20000000.0, 160000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}}, filename=resultFileName);

  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=21600));
end TestPQBoundaries;
