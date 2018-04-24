within TransiEnt.Basics.Icons;
package Grid
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


  annotation (Icon(graphics={
    Rectangle(
      lineColor={200,200,200},
      fillColor={248,248,248},
      fillPattern=FillPattern.HorizontalCylinder,
      extent={{-100,-100},{100,100}},
      radius=25.0),
    Rectangle(
      lineColor={128,128,128},
      fillPattern=FillPattern.None,
      extent={{-100,-100},{100,100}},
      radius=25.0),
    Rectangle(
      fillColor={95,95,95},
      fillPattern=FillPattern.Solid,
      extent={{-100,-100},{100,-72}},
      radius=25,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-100,-72},{100,-86}},
      fillColor={0,122,122},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Line(
      points={{-40,68},{-40,-40}},
      color={0,0,0},
      smooth=Smooth.None),
    Line(
      points={{0,68},{0,-40}},
      color={0,0,0},
      smooth=Smooth.None),
    Line(
      points={{42,68},{42,-40}},
      color={0,0,0},
      smooth=Smooth.None),
    Line(
      points={{0,54},{0,-54}},
      color={0,0,0},
      smooth=Smooth.None,
      origin={0,48},
      rotation=90),
    Line(
      points={{0,54},{0,-54}},
      color={0,0,0},
      smooth=Smooth.None,
      origin={0,12},
      rotation=90),
    Line(
      points={{0,54},{0,-54}},
      color={0,0,0},
      smooth=Smooth.None,
      origin={2,-22},
      rotation=90)}));
end Grid;
