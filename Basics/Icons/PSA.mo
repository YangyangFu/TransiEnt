within TransiEnt.Basics.Icons;
partial model PSA
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
  extends Model;
  annotation (Icon(graphics={
        Rectangle(
          extent={{-70,-10},{40,-50}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-60,-10},{30,-50}},
          lineColor={0,0,0},
          fillColor={127,190,190},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-60,-14},{30,-46}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.CrossDiag),
        Rectangle(
          extent={{-70,50},{40,10}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-60,50},{30,10}},
          lineColor={0,0,0},
          fillColor={127,190,190},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-60,46},{30,14}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.CrossDiag),
        Line(
          points={{40,30},{50,30},{50,0},{100,0},{50,0},{50,-30},{40,-30}},
          color={255,255,0},
          thickness=1.5),
        Line(
          points={{-70,30},{-80,30},{-80,0},{-100,0},{-80,0},{-80,-30},{-70,-30}},
          color={255,255,0},
          thickness=1.5),
        Line(
          points={{60,70},{60,40},{40,40},{60,40},{60,5},{65,5},{65,-5},{60,-5},{60,-40},{40,-40}},
          color={255,255,0},
          thickness=1.5)}));
end PSA;
