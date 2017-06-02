within TransiEnt.Components.Boundaries.Electrical.ApparentPower;
model FrequencyVoltage "Sets frequency and voltage without definition of flow variables"

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

  parameter Boolean Use_input_connector_f = true "Gets parameter from input connector"
   annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="Boundary"));

  parameter SI.Frequency f_boundary=50 annotation (Dialog(group="Boundary", enable =  not Use_input_connector_f));

 parameter Boolean Use_input_connector_v = true "Gets parameter from input connector"
   annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true),Dialog(group="Boundary"));

   parameter SI.Voltage v_boundary=110e3 annotation (Dialog(group="Boundary", enable = not Use_input_connector_v));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput f_set if                 Use_input_connector_f "frequency input"
                           annotation (Placement(transformation(extent={{-20,-20},
            {20,20}},
          rotation=270,
        origin={-60,120}),
                       iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-54,120})));

  Modelica.Blocks.Interfaces.RealInput v_set if                 Use_input_connector_v "voltage input"
                              annotation (Placement(transformation(extent={{-20,-20},
            {20,20}},
          rotation=270,
        origin={60,120}),
                       iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={60,120})));
  TransiEnt.Basics.Interfaces.Electrical.ApparentPowerPort epp annotation (Placement(transformation(extent={{-102,-10},{-82,10}}), iconTransformation(extent={{-118,-16},{-84,14}})));

    // _____________________________________________
  //
  //                    Variables
  // _____________________________________________

   //  Modelica.SIunits.ActivePower Q = epp.Q;
   //  Modelica.SIunits.ApparentPower S;

  // _____________________________________________
  //
  //                Complex Components
  // _____________________________________________
protected
  Modelica.Blocks.Interfaces.RealInput f_internal "Needed to connect to conditional connector for frequency";
  Modelica.Blocks.Interfaces.RealInput v_internal "Needed to connect to conditional connector for voltage";

 // Modelica.Blocks.Interfaces.RealInput f_set
 //   "active power input"                                         annotation (Placement(transformation(extent={{-140,60},{-100,100}},
 //         rotation=0), iconTransformation(
 //       extent={{20,-20},{-20,20}},
 //       rotation=270,
 //       origin={-52,-120})));
 // Modelica.Blocks.Interfaces.RealInput v_set
 //   "reactive power input"                                       annotation (Placement(transformation(extent={{-140,22},
 //           {-100,62}},
 //         rotation=0), iconTransformation(
 //       extent={{20,-20},{-20,20}},
 //       rotation=270,
 //       origin={68,-120})));
equation
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

    if not Use_input_connector_f then
    f_internal = f_boundary;
  end if;

  if not Use_input_connector_v then
    v_internal = v_boundary;

  end if;
  epp.f = f_internal;
  epp.v = v_internal;
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(f_internal, f_set);
  connect(v_internal, v_set);

  annotation (defaultComponentName="ElectricGrid", Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),           Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Time-dependent frequency and voltage boundary condition with interface type L2 (real and apparent power, voltage and frequency).</span></p>
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
end FrequencyVoltage;