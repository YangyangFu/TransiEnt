within TransiEnt.Producer.Gas.Electrolyzer.Controller;
model TotalFeedInStorageController "Controller to control the electrolyzer and storage system for feeding into a natural gas grid"

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  import SI = Modelica.SIunits;
  extends TransiEnt.Basics.Icons.Controller;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.ActivePower P_el_n=1e6 "Nominal power of the electrolyzer" annotation(Dialog(group="Fundamental Definitions"));
  parameter SI.ActivePower P_el_min=0.02*P_el_n "Maximum power of the electrolyzer" annotation(Dialog(group="Fundamental Definitions"));
  parameter SI.ActivePower P_el_max=3*P_el_n "Maximum power of the electrolyzer" annotation(Dialog(group="Fundamental Definitions"));
  parameter SI.ActivePower P_el_overload=1.5*P_el_n "Power at which the overload region of the electrolyzer begins" annotation(Dialog(group="Fundamental Definitions"));
  parameter SI.ActivePower P_el_cooldown=P_el_n "Power below which cooldown starts" annotation(Dialog(group="Fundamental Definitions"));
  parameter Modelica.SIunits.Efficiency eta_n(
    min=0,
    max=1)=0.75 "Nominal efficiency coefficient (min = 0, max = 1)" annotation(Dialog(group="Fundamental Definitions"));

  parameter Modelica.SIunits.Efficiency eta_scale(
    min=0,
    max=1)=0 "Sets a with increasing input power linear degrading efficiency coefficient (min = 0, max = 1)"
                                                                                                    annotation(Dialog(group="Fundamental Definitions"));
  parameter SI.Time t_overload=5*3600 "Maximum time in seconds that the electrolyzer can work in overload" annotation(Dialog(group="Fundamental Definitions"));
  parameter Real coolingToHeatingRatio=2 "Ratio of how much faster the electrolyzer cools down than it heats up" annotation(Dialog(group="Fundamental Definitions"));
  parameter Integer startState=1 "Initial state of the electrolyzer (1: ready to overheat, 2: working in overload, 3: cooling down)" annotation(Dialog(group="Fundamental Definitions"));

  parameter Modelica.Blocks.Types.SimpleController controllerType=Modelica.Blocks.Types.SimpleController.P "|Controller|Type of controller for feed-in control";
  parameter Real k=1 "|Controller|Gain for feed-in control";
  parameter Real Ti=0.1 "|Controller|Integrator time constant for feed-in control";
  parameter Real Td=0.1 "|Controller|Derivative time constant for feed-in control";

  parameter SI.Pressure p_maxLow=29e5 "|Controller|Lower limit of the maximum pressure in storage";
  parameter SI.Pressure p_maxHigh=30e5 "|Controller|Upper limit of the maximum pressure in storage";

  parameter Boolean StoreAllHydrogen=false "|Controller|All Hydrogen is stored before beeing fed in";

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput P_el_set "Set power"    annotation (Placement(transformation(extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-100,40}),iconTransformation(extent={{-120,20},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput p_storage "Pressure in storage" annotation (Placement(transformation(
        extent={{20,-20},{-20,20}},
        rotation=0,
        origin={100,0}), iconTransformation(extent={{120,-20},{80,20}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_ely "Hydrogen mass flow out of the electrolyser" annotation (Placement(transformation(extent={{-120,-60},{-80,-20}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_feedIn "Maximum mass flow that can be fed into the natural gas system" annotation (Placement(transformation(extent={{120,40},{80,80}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_bypass "Mass flow through bypass of storage" annotation (Placement(transformation(extent={{120,-80},{80,-40}})));
  Modelica.Blocks.Interfaces.RealOutput P_el_ely "Controlled power of the electrolyser" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,-110})));
  Modelica.Blocks.Interfaces.RealOutput splitRatio "Split ratio of the three way valve" annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-110})));
  Modelica.Blocks.Interfaces.RealOutput m_flowDes_valve "Desired mass flow through the valve after the storage" annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,-110})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  TransiEnt.Producer.Gas.Electrolyzer.Controller.FeedInStorageController feedInStorageController(
    k=k,
    p_maxLow=p_maxLow,
    p_maxHigh=p_maxHigh,
    P_el_n=P_el_n,
    P_el_max=P_el_max,
    P_el_min=P_el_min,
    eta_n=eta_n,
    eta_scale=eta_scale,
    controllerType=controllerType,
    Ti=Ti,
    Td=Td,
    startState=startState,
    redeclare model Charline = Charline) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,26})));
protected
  TransiEnt.Producer.Gas.Electrolyzer.Controller.FeedInStorageTWVController feedInStorageTWVController(StoreAllHydrogen=StoreAllHydrogen) annotation (Placement(transformation(extent={{-10,-46},{10,-26}})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=270,
        origin={60,-60})));
  TransiEnt.Producer.Gas.Electrolyzer.Controller.OverloadController overloadController(
    P_el_n=P_el_n,
    P_el_overload=P_el_overload,
    t_overload=t_overload,
    coolingToHeatingRatio=coolingToHeatingRatio,
    startState=startState,
    P_el_cooldown=P_el_cooldown)
                           annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-60,-12})));

public
  replaceable model Charline = TransiEnt.Producer.Gas.Electrolyzer.Base.ElectrolyzerEfficiencyCharlineSilyzer200        constrainedby TransiEnt.Producer.Gas.Electrolyzer.Base.PartialElectrolyzerEfficiencyCharline        "Calculate the efficiency" annotation (__Dymola_choicesAllMatching=true);

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(feedInStorageController.p, p_storage) annotation (Line(points={{-49,26},{-49,26},{72,26},{72,0},{100,0}}, color={0,0,127}));
  connect(feedInStorageTWVController.splitRatio, splitRatio) annotation (Line(points={{0,-47},{0,-110}}, color={0,0,127}));
  connect(feedInStorageTWVController.m_flow_ely, m_flow_ely) annotation (Line(points={{-10,-40},{-100,-40}}, color={0,0,127}));
  connect(feedback.y, m_flowDes_valve) annotation (Line(points={{60,-69},{60,-110},{60,-110}}, color={0,0,127}));
  connect(feedback.u2, m_flow_bypass) annotation (Line(points={{68,-60},{100,-60},{100,-60}}, color={0,0,127}));
  connect(feedInStorageController.m_flow_bypass, m_flow_bypass) annotation (Line(points={{-49,18},{32,18},{32,-10},{76,-10},{76,-60},{100,-60}}, color={0,0,127}));
  connect(m_flow_feedIn, feedback.u1) annotation (Line(points={{100,60},{60,60},{60,-52}}, color={0,0,127}));
  connect(feedInStorageController.m_flow_feedIn, m_flow_feedIn) annotation (Line(points={{-49,34},{-49,34.4},{60,34.4},{60,60},{100,60}}, color={0,0,127}));
  connect(feedInStorageTWVController.m_flow_feedIn, m_flow_feedIn) annotation (Line(points={{-10,-32},{-14,-32},{-14,-16},{60,-16},{60,60},{100,60}}, color={0,0,127}));
  connect(P_el_set, feedInStorageController.P_el_set) annotation (Line(points={{-100,40},{-60,40},{-60,37}}, color={0,0,127}));
  connect(feedInStorageController.P_el_ely, overloadController.P_el_set) annotation (Line(points={{-60,15},{-60,15},{-60,-1}}, color={0,0,127}));
  connect(overloadController.P_el_ely, P_el_ely) annotation (Line(points={{-60,-22.8},{-60,-110}},            color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
  Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>This is a controller to control for a system with storage the electric power of the electrolyzer, the three way valve and outlet valve of the storage. it combines the FeedInStorageTWVController, FeedInStorageController and OverloadController. </p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>see sub models </p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>see sub models </p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>P_el_set: input for the set value for the electric power </p>
<p>m_flow_feedIn: input for the possible feed-in mass flow into the natural grid etc. </p>
<p>m_flow_ely: input for the mass flow coming from the electrolyzer </p>
<p>p_storage: input for the storage pressure </p>
<p>P_el_ely: output for the limited electric power for the electrolyzer </p>
<p>splitRatio: output for the split ratio of the three way valve </p>
<p>m_flowDes_valve: output for the mass flow through the valve after the storage </p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>The desired mass flow through valve after the storage is simply the difference between feed-in mass flow and bypass mass flow. </p>
<h4><span style=\"color:#008000\">7. Remarks for Usage</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Carsten Bode (c.bode@tuhh.de) in April 2016<br> </p>
</html>"));
end TotalFeedInStorageController;
