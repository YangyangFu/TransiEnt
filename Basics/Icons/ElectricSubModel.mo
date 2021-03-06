within TransiEnt.Basics.Icons;
partial model ElectricSubModel "Icon for runnable examples"
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

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics={Ellipse(
          lineColor={0,125,125},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}}),
        Line(origin={1,52}, points={{-61.0,-45.0},{-61.0,-10.0},{-26.0,-10.0}}),
        Rectangle(origin={20.3125,84.857}, extent={{-45.3125,-57.8571},{4.6875,
              -27.8571}}),
        Line(origin={7,52}, points={{18.0,-10.0},{53.0,-10.0},{53.0,-45.0}}),
        Line(origin={9,56},  points={{31.0,-49.0},{71.0,-49.0}}),
        Line(origin={8,50},  points={{32.0,-58.0},{72.0,-58.0}}),
        Line(origin={6.2593,50}, points={{53.7407,-58.0},{53.7407,-93.0},{-66.2593,
              -93.0},{-66.2593,-58.0}}),
        Line(origin={-3,47}, points={{-72.0,-55.0},{-42.0,-55.0}}),
        Line(origin={-2,57},points={{-83.0,-50.0},{-33.0,-50.0}})}),
                                            Documentation(info="<html>
<p>This icon indicates an example. The play button suggests that the example can be executed.</p>
</html>"));
end ElectricSubModel;
