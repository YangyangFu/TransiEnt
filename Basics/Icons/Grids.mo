within TransiEnt.Basics.Icons;
model Grids "General icon for all three grids"
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},{200,100}}),
        graphics={
        Rectangle(
          extent={{-200,100},{200,-100}},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-98,98},{98,-98}},
          lineColor={0,127,127},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),                                    Text(
          extent={{-96,-98},{104,-64}},
          lineColor={62,62,62},
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
          textString="%name"),       Polygon(
          points={{-52,16},{-33,16},{-23,14},{-15,12},{-4,8},{10,0},{18,-6},{30,-12},{37,-12},{51,-12},{56,-12},{56,8},{34,10},{26,14},{-2,30},{-40,40},{-52,40},{-52,16}},
          lineThickness=0.5,
          smooth=Smooth.Bezier,
          fillColor={0,134,134},
          fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
          Rectangle(
          extent={{-52,-12},{56,-24}},
          lineThickness=0.5,
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
        radius=3,
        pattern=LinePattern.None)}), Diagram(coordinateSystem(extent={{-100,-100},{0,100}})));
end Grids;
