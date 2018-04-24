within TransiEnt.Components.Turbogroups;
model Gasturbine "Model of a gasturbine with three states (halt / startup / running), pyhsical constraints (Pmin,Pmax,Pgradmax) and first order dynamics"

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

  extends Base.PartialTurbine;
  extends TransiEnt.Basics.Icons.GasTurbine;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  outer SimCenter simCenter;

  parameter SI.Power P_nom "Nominal power of plant";
  parameter SI.Power P_turb_init=0 "Initital power of plant";
  parameter SI.Time T_plant=10 "Time constant of first order dynamic model";

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.BooleanOutput isGeneratorRunning annotation (
      Placement(transformation(rotation=0, extent={{100,10},{120,30}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Math.Gain normalize(k=1/P_nom)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-40,12})));

  Modelica.Blocks.Math.Gain deNormalize(k=P_nom)
    annotation (Placement(transformation(extent={{50,6},{62,18}})));
  Boundaries.Mechanical.Power MechanicalBoundary annotation (Placement(transformation(extent={{62,-12},{80,6}})));

  // _____________________________________________
  //
  //           Diagnostic Variables
  // _____________________________________________

  Real P_set_star = -normalize.y "Normalized, always positive";
  Real P_is_star = -deNormalize.u "Normalized, always positive";
  Modelica.Blocks.Continuous.FirstOrder plantDynamic(                           T=T_plant,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=-P_turb_init/P_nom)                                                 annotation (Placement(transformation(extent={{18,2},{38,22}})));
  replaceable TransiEnt.Components.Turbogroups.OperatingStates.ThreeStateDynamic operationStatus(
    t_startup=360,
    P_min_operating=0.3,
    P_grad_operating=0.1/60,
    P_star_init=P_turb_init/P_nom,
    T_thresh=simCenter.Td) constrainedby TransiEnt.Components.Turbogroups.OperatingStates.PartialStateDynamic "Operating State Model" annotation (choicesAllMatching=true, Placement(transformation(extent={{-14,2},{6,22}})));

  Modelica.Blocks.Sources.BooleanExpression booleanExpression(y=operationStatus.operating.active) annotation (Placement(transformation(extent={{64,34},{84,54}})));
  Modelica.Blocks.Interfaces.RealInput P_spinning_set "Setpoint for spinning reserve power"
                                                      annotation (Placement(transformation(
        rotation=270,
        extent={{-12,-12},{12,12}},
        origin={40,92})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(MechanicalBoundary.mpp, mpp) annotation (Line(
      points={{80,-3},{80,-2},{100,-2}},
      color={95,95,95},
      smooth=Smooth.None));
  connect(P_target, normalize.u) annotation (Line(
      points={{0,98},{0,56},{-64,56},{-64,12},{-52,12}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(deNormalize.y, MechanicalBoundary.P_mech_set) annotation (
      Line(
      points={{62.6,12},{71,12},{71,7.62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(plantDynamic.y, deNormalize.u) annotation (Line(points={{39,12},{48.8,12}}, color={0,0,127}));
  connect(booleanExpression.y, isGeneratorRunning) annotation (Line(points={{85,44},{88,44},{88,42},{88,20},{110,20}}, color={255,0,255}));
  connect(normalize.y, operationStatus.P_set_star) annotation (Line(points={{-29,12},{-22,12},{-14,12}},
                                                                                                color={0,0,127}));
  connect(operationStatus.P_set_star_lim, plantDynamic.u) annotation (Line(points={{7.2,12},{7.2,12},{16,12}},  color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Turbine model modeled by </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- minimum / maximum power ouput</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- maximum power gradient</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- on / off status dependent on schedule value without time delay. Turbine shuts down if scheduled value is below minimum power</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">- sends on/off status to momentum of inertia statistics </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Note, that no statistics are involved!</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarsk for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The input P_spinning_set is supposed to be gradient limited by limtations of the primary balancing offer mechanism which has normally a higher gradient limit than the rest of the plant.</span></p>
<p><br><span style=\"font-family: MS Shell Dlg 2;\">The input P_target is the sum of secondary balancing setpoint and scheduled set point</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end Gasturbine;
