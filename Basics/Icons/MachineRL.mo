within TransiEnt.Basics.Icons;
partial model MachineRL "Icon for runnable examples"
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
            {100,100}}), graphics={
        Polygon(
          origin={8.835,30},
          fillPattern=FillPattern.Solid,
          points={{-70,-90},{-60,-90},{-26.835,-66},{9.165,-66},{35.165,-90},{
              49.165,-90},{49.165,-100},{-70,-100},{-70,-90}}),
        Rectangle(
          origin={107,-3},
          fillColor={128,128,128},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-68,-43},{-51,43}}),
        Rectangle(
          origin={-10.0825,-3},
          fillColor={0,135,135},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-50.0825,-43},{50.0825,43}},
          lineColor={0,0,0}),
        Rectangle(
          origin={-140.165,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{60,-10},{80,10}})}), Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end MachineRL;
