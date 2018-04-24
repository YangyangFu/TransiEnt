within TransiEnt.Producer.Electrical.Controllers.Check;
model TestSimpleTwoBlockCoordination "Example how to calculate the demand of primary balancing power"
//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 1.1.0                             //
//                                                                                //
// Licensed by Hamburg University of Technology under Modelica License 2.         //
// Copyright 2018, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE and ResiliEntEE are research projects supported by the German     //
// Federal Ministry of Economics and Energy (FKZ 03ET4003 and 03ET4048).          //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Institute of Electrical Power Systems and Automation                           //
// (Hamburg University of Technology)                                             //
// and is supported by                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//
  extends TransiEnt.Basics.Icons.Checkmodel;
  inner TransiEnt.SimCenter simCenter(
    n_consumers=1,
    P_consumer={300e9},
    T_grid=7.5) annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  inner TransiEnt.ModelStatistics                    modelStatistics
    annotation (Placement(transformation(extent={{-80,80},{-60,100}})));
  Modelica.Blocks.Sources.TimeTable DiscontiniousTestSchedule(table=[0,0; 3600,0; 43000,-5e8; 53000,-5e8; 100000,-1e9; 110000,-1e9])
    annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
public
function plotResult

  constant String resultFileName = "TestSimpleTwoBlockCoordination.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={55, 50, 1051, 572}, y={"simpleTwoBlockCoordination.P_set_Block_1", "simpleTwoBlockCoordination.P_set_Block_2",
 "simpleTwoBlockCoordination.P_set"}, range={0.0, 120000.0, -1200000000.0, 200000000.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}},filename=resultFile);

  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  SimpleTwoBlockCoordination simpleTwoBlockCoordination(P_max_Block_1=600e6, P_max_Block_2=800e6) annotation (Placement(transformation(extent={{4,-10},{24,10}})));
equation
  connect(DiscontiniousTestSchedule.y, simpleTwoBlockCoordination.P_set) annotation (Line(points={{-17,0},{4,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})), experiment(StopTime=120000));
end TestSimpleTwoBlockCoordination;
