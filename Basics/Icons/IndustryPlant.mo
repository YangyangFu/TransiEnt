within TransiEnt.Basics.Icons;
partial model IndustryPlant "Icon for runnable examples"
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                         graphics={
        Rectangle(
          extent={{-44,36},{-30,-42}},
          lineColor={95,95,95},
          fillColor={0,134,134},
          fillPattern=FillPattern.VerticalCylinder),
        Rectangle(
          extent={{8,-2},{58,-72}},
          lineColor={95,95,95},
          fillColor={0,134,134},
          fillPattern=FillPattern.VerticalCylinder),
        Rectangle(
          extent={{-52,-22},{22,-72}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-46,-26},{-38,-32}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Rectangle(
          extent={{-34,-26},{-26,-32}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Rectangle(
          extent={{-22,-26},{-14,-32}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Rectangle(
          extent={{2,-26},{10,-32}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Rectangle(
          extent={{-10,-26},{-2,-32}},
          lineColor={95,95,95},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215}),
        Polygon(
          points={{12,4},{18,4},{38,2},{50,2},{54,2},{72,14},{72,22},{70,30},{70,32},{72,40},{72,42},{68,42},{58,40},{58,38},{54,36},{52,34},{42,28},{40,26},{38,26},{36,22},{32,18},{30,18},{26,14},{22,12},{16,10},{16,8},{12,8},{12,4}},
          lineColor={95,95,95},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,40},{-36,40},{-34,40},{-28,40},{-26,42},{-16,48},{-14,48},{-2,56},{2,58},{6,60},{8,62},{12,64},{14,66},{20,70},{22,70},{24,72},{26,76},{24,76},{18,78},{14,78},{8,80},{6,78},{4,76},{4,72},{2,68},{-2,66},{-10,62},{-16,60},{-18,56},{-22,54},{-24,52},{-28,50},{-30,48},{-32,46},{-34,44},{-36,44},{-40,44},{-40,40}},
          lineColor={95,95,95},
          smooth=Smooth.None,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end IndustryPlant;
