within TransiEnt.Basics.Icons;
partial model ElectricSink "Icon for runnable examples"
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={
        Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Rectangle(
          extent={{-100,2},{-50,-4}},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-50,8},{-50,-12},{-30,-2},{-50,8}},
          smooth=Smooth.None,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Polygon(
          points={{-10,10},{-10,-10},{10,0},{-10,10}},
          smooth=Smooth.None,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={40,0},
          rotation=180,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-25,3},{25,-3}},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={75,-1},
          rotation=180,
          pattern=LinePattern.None),
        Polygon(
          points={{-10,10},{-10,-10},{10,0},{-10,10}},
          smooth=Smooth.None,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={0,40},
          rotation=270,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-25,3},{25,-3}},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={0,75},
          rotation=270,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Polygon(
          points={{-10,10},{-10,-10},{10,0},{-10,10}},
          smooth=Smooth.None,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={0,-40},
          rotation=90,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-25,3},{25,-3}},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          origin={0,-75},
          rotation=90,
          pattern=LinePattern.None)}),
                          Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end ElectricSink;