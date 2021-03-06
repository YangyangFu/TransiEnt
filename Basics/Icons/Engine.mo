within TransiEnt.Basics.Icons;
model Engine
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
annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}),  graphics={
      Rectangle(
        extent={{100,-81},{66-73}},
        lineColor={0,0,0},
        fillColor={175,175,175},
        fillPattern=FillPattern.VerticalCylinder),
      Rectangle(
        extent={{-26,13},{-56,63}},
        lineColor={0,0,0},
        fillPattern=FillPattern.VerticalCylinder,
        fillColor={192,192,192}),
      Ellipse(extent={{-36,-82},{-46,-72}}, lineColor={0,0,0}),
      Line(
        points={{-41,-77},{-14,-44}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(extent={{-9,-49},{-19,-39}},  lineColor={0,0,0}),
      Line(
        points={{-14,-44},{-41,27}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(
        extent={{-36,22},{-46,32}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid),
      Line(points={{-20,-2},{-20,80},{-62,80},{-62,-2}},   color={0,0,0}),
      Rectangle(
        extent={{24,3},{-6,53}},
        lineColor={0,0,0},
        fillPattern=FillPattern.VerticalCylinder,
        fillColor={192,192,192}),
      Ellipse(extent={{14,-82},{4,-72}},    lineColor={0,0,0}),
      Line(
        points={{9,-77},{43,-52}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(extent={{48,-57},{38,-47}},   lineColor={0,0,0}),
      Line(
        points={{43,-52},{9,17}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(
        extent={{14,12},{4,22}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid),
      Line(points={{30,-2},{30,80},{-12,80},{-12,-2}},     color={0,0,0}),
      Rectangle(
        extent={{76,23},{46,73}},
        lineColor={0,0,0},
        fillPattern=FillPattern.VerticalCylinder,
        fillColor={192,192,192}),
      Ellipse(extent={{66,-82},{56,-72}},   lineColor={0,0,0}),
      Line(
        points={{61,-77},{72,-40}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(extent={{77,-45},{67,-35}},   lineColor={0,0,0}),
      Line(
        points={{72,-40},{61,37}},
        color={0,0,0},
        thickness=0.5),
      Ellipse(
        extent={{66,32},{56,42}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid),
      Line(points={{82,-2},{82,80},{40,80},{40,-2}},       color={0,0,0}),
      Rectangle(
        extent={{-4,21},{4,-21}},
        lineColor={0,0,0},
        fillColor={175,175,175},
        fillPattern=FillPattern.VerticalCylinder,
        origin={35,-77},
        rotation=-90),
      Rectangle(
        extent={{-4,20},{4,-20}},
        lineColor={0,0,0},
        fillColor={175,175,175},
        fillPattern=FillPattern.VerticalCylinder,
        origin={-16,-77},
        rotation=-90),
      Rectangle(
        extent={{-4,27},{4,-27}},
        lineColor={0,0,0},
        fillColor={175,175,175},
        fillPattern=FillPattern.VerticalCylinder,
        origin={-73,-77},
        rotation=-90),
      Rectangle(
        extent={{-4,21},{4,-13}},
        lineColor={0,0,0},
        fillColor={175,175,175},
        fillPattern=FillPattern.VerticalCylinder,
        origin={79,-77},
        rotation=-90)}));
end Engine;
