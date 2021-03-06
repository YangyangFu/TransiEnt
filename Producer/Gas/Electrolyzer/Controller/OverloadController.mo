within TransiEnt.Producer.Gas.Electrolyzer.Controller;
model OverloadController "Control overload operation of electrolyzer"

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

  import TransiEnt;
  extends TransiEnt.Basics.Icons.Controller;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.ActivePower P_el_n=1e6 "Nominal power of electrolyzer";
  //parameter SI.ActivePower P_el_max=3*P_el_n "Maximum power of electrolyzer";
  //parameter SI.ActivePower P_el_min=0.02*P_el_n "Minimum power of electrolyzer";
  parameter SI.ActivePower P_el_overload=1.5*P_el_n "Power at which the overload region begins";
  parameter SI.ActivePower P_el_cooldown=P_el_n "Power below which cooldown starts";
  parameter SI.Time t_overload=8*3600 "Seconds the electrolyzer can operate in overload region";
  parameter Real coolingToHeatingRatio=2 "Ratio of how much faster the electrolyser cools down than it heats up";
  parameter Integer startState=1 "Initial state of the electrolyzer (1: ready to overheat, 2: working in overload, 3: cooling down)";

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  Integer state(start=startState) "Defines the state the electrolyser is in (1: ready to overheat, 2: working in overload, 3: cooling down)";
  Real overloadLevel(start=0) "Level of overheating";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput P_el_set annotation (Placement(transformation(extent={{-130,-20},{-90,20}}), iconTransformation(extent={{-130,-20},{-90,20}})));
  Modelica.Blocks.Interfaces.RealOutput P_el_ely annotation (Placement(transformation(extent={{98,-10},{118,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

// initial algorithm
//    if P_el_set>P_el_overload then
//      state:=2;
//    else
//      state:=1;
//    end if;

  Modelica.Blocks.Logical.Hysteresis hysteresis_coolingDown(
    uLow=0,
    pre_y_start=false,
    uHigh=t_overload)
               annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.RealExpression Input_overload_hysteresis(y=overloadLevel) annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

//state = 1; Overheat possible: electrolyzer is cooled down, and ready to overheat. overloadLevel=0
//state = 2; Overheating: electrolyzer is working in overload, and the overloadLevel is rising.
//state = 3; Cooling: Either electrolyzer was too long in Overload and it has to cool down or P_el_set<P_el_n so it can cool down and reduce overloadLevel
//state = 4; Intermediate: state between cooling and heating up where electrolyzer is neither heated up nor cooled down

algorithm
  //when (P_el_set>P_el_overload and state==1) or (overloadLevel<=t_overload and P_el_set>P_el_overload and state==3) then
  when (P_el_set>P_el_overload and (state==1 or state==4)) or (overloadLevel<=t_overload and P_el_set>P_el_overload and state==3 and hysteresis_coolingDown.y==false) then
    state :=2;
  end when;

  when P_el_set<P_el_overload and P_el_set>P_el_cooldown and (state==2 or state==1 or (state==3 and hysteresis_coolingDown.y==false)) then
    state:=4;
  end when;

  when (overloadLevel>=t_overload or P_el_set<=P_el_cooldown) and (state==2 or state==4) then
    state:=3;
  end when;

  when overloadLevel<=0 and state==3 then
    state:=1;
  end when;

equation
  der(overloadLevel) = if state==2 then +1 elseif state==3 then -coolingToHeatingRatio else 0;

  if state==1 or state==2 or state==4 then
    P_el_ely=P_el_set;
  elseif state==3 then
    P_el_ely=min(P_el_set, P_el_cooldown);
  else
    P_el_ely=1e99; // if-statement must have "else" so it acts like an error state. Normally it should always have state 1-3
  end if;

  connect(Input_overload_hysteresis.y,hysteresis_coolingDown. u) annotation (Line(points={{-15,0},{-15,0},{8,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
  Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This is a controller to control the electric power of the electrolyzer. It has to be combined with another controller to control minimum and maximum power. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>The electrolyzer can be operated at higher electric power than nominal power. If the power rises over a defined P_el_overload, the electrolyzer will be heated up so this operation is time limited. If the maximum overload time is reached, the electrolyzer has to be operated below or at P_el_cooldown to cool down again. In general the electrolyzer heats up at P_el&gt;P_el_overload and cools down at P_el_cooldown&gt;=P_el. </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>This model is only valid for constant overheating and cooling down. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>P_el_set: input for the set value for the electric power </p>
<p>P_el_ely: output for the limited electric power for the electrolyzer </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>It has to be combined with another controller to control minimum and maximum power. </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Tom Lindemann in April 2016</p>
<p>Model modified by Lisa Andresen (andresen@tuhh.de), May 2016</p>
<p>Model modified by Oliver Sch&uuml;lting (oliver.schuelting@tuhh.de), April 2018</p>
</html>"));
end OverloadController;
