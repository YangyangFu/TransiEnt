within TransiEnt.Basics.Icons;
model Hydroturbine
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
extends Model;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={
        Polygon(
          points={{-72,52},{-54,64},{-44,30},{-14,16},{-6,-10},{-4,-12},{44,-2},{84,-32},{78,-38},{42,-12},{-10,-22},{-14,-18},{-22,12},{-52,26},{-58,50},{-66,46},{-72,52}},
          lineColor={0,0,255},
          fillPattern=FillPattern.VerticalCylinder,
          smooth=Smooth.Bezier,
          fillColor={0,0,255}),
        Ellipse(
          extent={{-14,-8},{2,-24}},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Ellipse(extent={{-10,-12},{-2,-20}},lineColor={0,0,0})}));
end Hydroturbine;