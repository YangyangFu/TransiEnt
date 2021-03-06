within TransiEnt.Consumer.DemandSideManagement.PVBatteryPoolControl.Base.Check;
model CheckPoolControlBus
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
extends TransiEnt.Basics.Icons.Checkmodel;

model Unit "Unit model just for this tester"
  extends TransiEnt.Basics.Icons.Model;
  Base.PoolControlBus bus;
  Modelica.Blocks.Interfaces.RealInput value=0;

  Modelica.Blocks.Interfaces.RealOutput state;
equation
  connect(bus.P_potential_pbp[1], value);
  connect(state, bus.definedOnTheFly);
end Unit;

model Controller "Controller model just for this tester"
  extends TransiEnt.Basics.Icons.Controller;
  Modelica.Blocks.Interfaces.RealInput setpoint=1;
  Base.PoolControlBus bus;
equation
  connect(bus.P_el_set_pbp[1], setpoint);
  connect(bus.definedOnTheFly, setpoint);

end Controller;

Unit unit annotation (Placement(transformation(extent={{-52,-18},{-12,18}})));
Controller ctrl annotation (Placement(transformation(extent={{6,-16},{46,20}})));
  inner PoolParameter param(nSystems=1);

equation
  connect(unit.bus, ctrl.bus) annotation (Line(points={{-12,0},{-2,0},{-2,-0.98},{6.6,-0.98}}, color={0,0,127}));

annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                       Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
  experiment(
    StopTime=3.1536e+007,
    Interval=900,
    __Dymola_Algorithm="Lsodar"),
  __Dymola_experimentSetupOutput(
    textual=false,
    derivatives=false,
    events=false));
end CheckPoolControlBus;
