within TransiEnt.Basics.Blocks.Check;
model TestSplineLim
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

  Modelica.Blocks.Sources.Ramp ramp(
    duration=3,
    offset=-1,
    startTime=0,
    height=3)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  TransiEnt.Basics.Blocks.SplineLim splineLim annotation (Placement(transformation(extent={{0,0},{20,20}})));
equation
  connect(ramp.y, splineLim.u) annotation (Line(
      points={{-19,10},{-2,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                    graphics),
    experiment(StopTime=3),
    __Dymola_experimentSetupOutput);
end TestSplineLim;
