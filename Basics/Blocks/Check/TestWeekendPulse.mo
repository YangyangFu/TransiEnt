within TransiEnt.Basics.Blocks.Check;
model TestWeekendPulse
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
extends Icons.Checkmodel;
  TransiEnt.Basics.Blocks.Sources.WeekendPulse weekDayPulse(k_weekend=0.7, BeginningWeekday=5) annotation (Placement(transformation(extent={{-16,-16},{12,14}})));
  Sources.WeekendPulse_Trapezoid weekDayPulse1(
    k_weekend=0.7,
    BeginningWeekday=5,
    TransitionDuration=6) annotation (Placement(transformation(extent={{-16,-62},{12,-32}})));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-48,48},{40,16}},
          lineColor={0,0,255},
          textString="This concept should be used to emulate the reduced district heating demand during the weekends.
1. Choose week day (don't worry about the displayed numbers
2. Type a scaling factor for the weekends.")}), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    experiment(StopTime=3.1536e+007, Interval=900),
    __Dymola_experimentSetupOutput);
end TestWeekendPulse;
