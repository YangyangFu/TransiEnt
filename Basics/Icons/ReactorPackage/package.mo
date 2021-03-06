within TransiEnt.Basics.Icons;
partial package ReactorPackage
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

extends TransiEnt.Basics.Icons.Package;

annotation (Icon(graphics={
        Rectangle(
          extent={{-100,30},{100,-30}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,0},
          fillColor={127,190,190},
          fillPattern=FillPattern.HorizontalCylinder),
        Rectangle(
          extent={{-70,20},{70,-20}},
          lineColor={0,0,255},
          fillColor={170,255,255},
          fillPattern=FillPattern.CrossDiag),
        Line(points={{-23,20},{-23,-20}}, color={28,108,200}),
        Line(points={{23,20},{23,-20}}, color={28,108,200})}));
end ReactorPackage;
