within TransiEnt.Basics.Icons;
model RadiationModel
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
        Ellipse(
          extent={{-38,68},{-84,22}},
          lineColor={255,128,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Sphere),
        Polygon(
          points={{0,52},{-34,-28},{2,-50},{36,36},{0,52}},
          lineColor={28,108,200},
          fillPattern=FillPattern.Sphere,
          fillColor={28,108,200}),
        Line(points={{2,-50},{36,-22}}, color={28,108,200}),
        Line(points={{-44,28},{-6,6}},   color={255,0,0}),
        Line(
          points={{2,-50},{64,-32}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled}),
        Text(
          extent={{66,-12},{94,-50}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillPattern=FillPattern.Sphere,
          fillColor={28,108,200},
          textString="N"),
        Line(points={{36,36},{36,-22}}, color={28,108,200}),
        Line(
          points={{36,-8},{30,-14},{28,-20},{28,-26},{28,-28}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(points={{32,-20},{32,-20},{32,-20},{32,-18},{32,-20}}, color={28,108,200}),
                                   Ellipse(lineColor={0,125,125}, extent={{-100,-100},{100,100}})}));
end RadiationModel;
