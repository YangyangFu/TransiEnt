within TransiEnt.Components.Boundaries.Electrical.ApparentPower;
model ApparentPower "L2 Active and reactive power by parameter or inputs"

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.ElectricSink;

  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________

  parameter Boolean useInputConnectorP = true "Gets parameter from input connector"
  annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="Boundary"));

  parameter SI.Power P_el_set_const=0 "Constant boundary"
  annotation (Dialog(group="Boundary", enable = not useInputConnectorP));

  parameter Boolean useInputConnectorQ = true "Gets parameter from input connector"
   annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="Boundary"));

  parameter SI.ReactivePower Q_el_set_const=0 annotation (Dialog(group="Boundary", enable =  not useInputConnectorQ and not useCosPhi));

   parameter Boolean useCosPhi = true
   annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="Boundary", enable = not useInputConnectorQ));

   parameter SI.PowerFactor cosphi_boundary=1 annotation (Dialog(group="Boundary", enable = useCosPhi and not useInputConnectorQ));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput P_el_set if              useInputConnectorP "active power input"
                                                                 annotation (Placement(transformation(extent={{-140,60},{-100,100}},
          rotation=0), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-60,120})));

  Modelica.Blocks.Interfaces.RealInput Q_el_set if              useInputConnectorQ "reactive power input"
                                                                 annotation (Placement(transformation(extent={{-140,22},
            {-100,62}},
          rotation=0), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,120})));
  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp annotation (Placement(transformation(extent={{-102,-10},{-82,10}}), iconTransformation(extent={{-118,-16},{-84,14}})));
  // _____________________________________________
  //
  //                    Variables
  // _____________________________________________

     Modelica.SIunits.ActivePower Q = epp.Q;
     Modelica.SIunits.ApparentPower S;

  // _____________________________________________
  //
  //                Complex Components
  // _____________________________________________
protected
  Modelica.Blocks.Interfaces.RealInput P_internal "Needed to connect to conditional connector for active power";
  Modelica.Blocks.Interfaces.RealInput Q_internal "Needed to connect to conditional connector for reactive power";

equation
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  if not useInputConnectorP then
    P_internal = P_el_set_const;
  end if;

  epp.P = P_internal;

  if not useInputConnectorQ then
    Q_internal = Q_el_set_const;
  end if;

  S = sqrt(P_internal^2 + Q_internal^2);

  if useCosPhi and not useInputConnectorQ then
    epp.Q = S * sin(acos(cosphi_boundary));
  else
    epp.Q = Q_internal;
  end if;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(P_internal, P_el_set);
  connect(Q_internal, Q_el_set);

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics), Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Text(
          visible=useInputConnectorP,
          extent={{-96,128},{-74,108}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="P"),
        Text(
          visible=useInputConnectorQ,
          extent={{24,130},{46,110}},
          lineColor={0,0,255},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString=DynamicSelect("Q", if useInputConnectorQ then "Q" else ""))}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Electric boundary condition with interface type L2 (real and apparent power, voltage and frequency).</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarsk for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end ApparentPower;