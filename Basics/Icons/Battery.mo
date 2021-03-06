within TransiEnt.Basics.Icons;
model Battery
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

  annotation (Icon(graphics={      Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Rectangle(
          extent={{-72,16},{56,-54}},
          lineColor={95,95,95},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{56,-54},{56,16},{68,32},{68,-40},{56,-54}},
          lineColor={95,95,95},
          smooth=Smooth.None,
          fillColor={177,177,177},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{56,16},{56,30},{68,46},{68,32},{56,16}},
          lineColor={95,95,95},
          smooth=Smooth.None,
          fillColor={57,57,57},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-72,16},{56,30}},
          lineColor={95,95,95},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-72,30},{-40,46},{68,46},{56,30},{-72,30}},
          lineColor={95,95,95},
          smooth=Smooth.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,36},{32,42},{46,42},{36,36},{20,36}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,143,7},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-46,36},{-34,42},{-20,42},{-30,36},{-46,36}},
          lineColor={255,0,0},
          smooth=Smooth.None,
          fillColor={255,143,7},
          fillPattern=FillPattern.Solid)}));
end Battery;
