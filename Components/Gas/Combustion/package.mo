within TransiEnt.Components.Gas;
package Combustion
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





















  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
            -100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{-100,-60},{-10,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{10,-60},{100,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-60},{-12,-58},{-24,-48},{-28,-34},{-26,-18},{-20,0},
              {-10,20},{-2,42},{-6,54},{-8,60},{4,38},{8,30},{20,20},{22,
              8},{22,-6},{20,-12},{22,-22},{26,-30},{30,-42},{28,-50},{12,
              -58},{0,-60}},
          lineColor={255,0,0},
          smooth=Smooth.Bezier,
          fillColor={255,0,0},
          fillPattern=FillPattern.Solid)}));
end Combustion;
