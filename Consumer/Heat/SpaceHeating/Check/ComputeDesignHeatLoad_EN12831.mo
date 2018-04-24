within TransiEnt.Consumer.Heat.SpaceHeating.Check;
model ComputeDesignHeatLoad_EN12831
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
  extends TransiEnt.Basics.Icons.Example;
  RoomFloorHeating roomFloorHeating(
    redeclare Base.RoomGeometry geometry,
    T_start=normSetpointRoomTemperature.T,
    use_T_amb_input=true,
    redeclare Characteristics.HouseType100 thermodynamics,
    redeclare Base.FloorHeatingSystem heatingsystem(T_spreading=10)) annotation (Placement(transformation(extent={{40,-50},{-2,-10}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi sink(
    T_const=273.15 + 25,
    variable_T=false,
    p_const=1e5) annotation (Placement(transformation(extent={{-60,-70},{-40,-50}})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow source(
    m_flow_const=0.75,
    variable_m_flow=true,
    variable_T=false,
    T_const=273.15 + 45)
                      annotation (Placement(transformation(extent={{-42,-8},{-22,12}})));
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-130,60},{-110,80}})));
  inner TransiEnt.Components.Boundaries.Ambient.AmbientConditions ambientConditions(redeclare TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_900s_2012 temperature) annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  TransiEnt.Components.Sensors.TemperatureSensor temperatureSensor annotation (Placement(transformation(extent={{-20,-56},{-40,-36}})));
  Modelica.Blocks.Continuous.LimPID       ctrl(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=180,
    k=5e4/4.2e3,
    yMax=10,
    yMin=0.01)                                                                annotation (Placement(transformation(extent={{38,40},{18,60}})));
  NormSetpointRoomTemperature normSetpointRoomTemperature(roomType=Base.RoomType_EN12831.appartment) annotation (Placement(transformation(extent={{110,46},{90,66}})));
  Modelica.Blocks.Sources.Constant normAmbientTemperatur(k=273.15 - 12) "EN 12831 value of Hamburg" annotation (Placement(transformation(extent={{56,-6},{36,14}})));
  TransiEnt.Components.Sensors.TemperatureSensor temperatureSensor1 annotation (Placement(transformation(extent={{-8,-28},{-28,-8}})));
  Modelica.Blocks.Sources.RealExpression Q_flow_demand(y=ctrl.y*(source.steam_a.h_outflow - roomFloorHeating.waterOut.h_outflow)) annotation (Placement(transformation(extent={{80,-24},{100,-4}})));
equation
  connect(sink.steam_a, roomFloorHeating.waterOut) annotation (Line(
      points={{-40,-60},{-18,-60},{-18,-48},{0.1,-48}},
      color={0,131,169},
      thickness=0.5));
  connect(temperatureSensor.port, sink.steam_a) annotation (Line(
      points={{-30,-56},{-30,-56},{-30,-60},{-40,-60}},
      color={0,131,169},
      thickness=0.5));
  connect(ctrl.u_s, normSetpointRoomTemperature.y) annotation (Line(points={{40,50},{89,50},{89,56}}, color={0,0,127}));
  connect(ctrl.u_m, roomFloorHeating.T_room_act) annotation (Line(points={{28,38},{30,38},{30,24},{64,24},{64,-38},{40,-38}}, color={0,0,127}));
  connect(normAmbientTemperatur.y, roomFloorHeating.T_Amb) annotation (Line(points={{35,4},{18.37,4},{18.37,-10.2}}, color={0,0,127}));
  connect(roomFloorHeating.waterIn, temperatureSensor1.port) annotation (Line(
      points={{0.1,-12},{-6,-12},{-6,-28},{-18,-28}},
      color={175,0,0},
      thickness=0.5));
  connect(source.steam_a, roomFloorHeating.waterIn) annotation (Line(
      points={{-22,2},{0.1,2},{0.1,-12}},
      color={0,131,169},
      thickness=0.5));
  connect(ctrl.y, source.m_flow) annotation (Line(points={{17,50},{-58,50},{-58,8},{-44,8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-140,-80},{140,80}})),
    Icon(coordinateSystem(extent={{-140,-80},{140,80}})),
    experiment(
      StopTime=604800,
      Interval=900,
      __Dymola_fixedstepsize=5,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput);
end ComputeDesignHeatLoad_EN12831;
