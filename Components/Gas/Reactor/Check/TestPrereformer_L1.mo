within TransiEnt.Components.Gas.Reactor.Check;
model TestPrereformer_L1
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
  extends TransiEnt.Basics.Icons.Checkmodel;

  parameter TransiEnt.Basics.Media.Gases.VLE_VDIWA_NG7_SG_var vle_ng7_sg;

  TransiEnt.Components.Gas.Reactor.Prereformer_L1 prereformer annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_Txim_flow source(
    medium=vle_ng7_sg,
    variable_m_flow=true,
    variable_T=true,
    variable_xi=true) annotation (Placement(transformation(extent={{-88,-10},{-68,10}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryRealGas_pTxi sink(medium=vle_ng7_sg, variable_p=true) annotation (Placement(transformation(extent={{88,-10},{68,10}})));
  TransiEnt.Components.Sensors.RealGas.CompositionSensor moleComp_In(medium=vle_ng7_sg, compositionDefinedBy=2) annotation (Placement(transformation(extent={{-36,0},{-16,20}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-1,
    offset=-1,
    duration=1000,
    startTime=1000)
                  annotation (Placement(transformation(extent={{-120,44},{-100,64}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=500,
    offset=373.15,
    duration=1000,
    startTime=3000)
                   annotation (Placement(transformation(extent={{-120,14},{-100,34}})));
  TransiEnt.Components.Sensors.RealGas.TemperatureSensor temperature_In(medium=vle_ng7_sg) annotation (Placement(transformation(extent={{-62,0},{-42,20}})));
  TransiEnt.Components.Sensors.RealGas.TemperatureSensor temperature_Out(medium=vle_ng7_sg) annotation (Placement(transformation(extent={{16,0},{36,20}})));
  Modelica.Blocks.Sources.Ramp ramp2(
    duration=1000,
    height=-29e5,
    offset=30e5,
    startTime=9000)
                   annotation (Placement(transformation(extent={{120,-4},{100,16}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0.14,0.03,0.02,0.01,0.01,0.01,0.76,0.01; 5000,0.14,0.03,0.02,0.01,0.01,0.01,0.76,0.01; 6000,0.10,0.05,0.04,0.03,0.05,0.00,0.69,0.00; 11000,0.10,0.05,0.04,0.03,0.05,0.00,0.69,0.00; 12000,0.40,0.20,0.10,0.05,0.10,0.12,0.00,0.03; 14000,0.40,0.20,0.10,0.05,0.10,0.12,0.00,0.03])
                                                                                              annotation (Placement(transformation(extent={{-120,-16},{-100,4}})));
  TransiEnt.Components.Sensors.RealGas.CompositionSensor moleComp_Out(medium=vle_ng7_sg, compositionDefinedBy=2) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={52,10})));
protected
  Modelica.SIunits.MolarFlowRate n_flow_In;
public
  Modelica.SIunits.MolarFlowRate n_flow_C_In;
  Modelica.SIunits.MolarFlowRate n_flow_H_In;
  Modelica.SIunits.MolarFlowRate n_flow_O_In;
  Modelica.SIunits.MolarFlowRate n_flow_N_In;
protected
  Modelica.SIunits.MolarFlowRate n_flow_Out;
public
  Modelica.SIunits.MolarFlowRate n_flow_C_Out;
  Modelica.SIunits.MolarFlowRate n_flow_H_Out;
  Modelica.SIunits.MolarFlowRate n_flow_O_Out;
  Modelica.SIunits.MolarFlowRate n_flow_N_Out;

  Modelica.SIunits.MolarFlowRate Delta_n_flow_C=n_flow_C_In-n_flow_C_Out;
  Modelica.SIunits.MolarFlowRate Delta_n_flow_H=n_flow_H_In-n_flow_H_Out;
  Modelica.SIunits.MolarFlowRate Delta_n_flow_O=n_flow_O_In-n_flow_O_Out;
  Modelica.SIunits.MolarFlowRate Delta_n_flow_N=n_flow_N_In-n_flow_N_Out;

  Real rel_Delta_n_flow_C=Delta_n_flow_C/n_flow_C_In;
  Real rel_Delta_n_flow_H=Delta_n_flow_H/n_flow_H_In;
  Real rel_Delta_n_flow_O=Delta_n_flow_O/n_flow_O_In;
  Real rel_Delta_n_flow_N=Delta_n_flow_N/n_flow_N_In;

equation
  n_flow_In=moleComp_In.gasPortIn.m_flow/moleComp_In.fluid.M;
  n_flow_Out=moleComp_Out.gasPortIn.m_flow/moleComp_Out.fluid.M;

  n_flow_C_In=n_flow_In*(1*moleComp_In.fraction[1]+2*moleComp_In.fraction[2]+3*moleComp_In.fraction[3]+4*moleComp_In.fraction[4]+1*moleComp_In.fraction[6]+1*moleComp_In.fraction[8]);
  n_flow_C_Out=n_flow_Out*(1*moleComp_Out.fraction[1]+2*moleComp_Out.fraction[2]+3*moleComp_Out.fraction[3]+4*moleComp_Out.fraction[4]+1*moleComp_Out.fraction[6]+1*moleComp_Out.fraction[8]);

  n_flow_H_In=n_flow_In*(4*moleComp_In.fraction[1]+6*moleComp_In.fraction[2]+8*moleComp_In.fraction[3]+10*moleComp_In.fraction[4]+2*moleComp_In.fraction[7]+2*moleComp_In.fraction[9]);
  n_flow_H_Out=n_flow_Out*(4*moleComp_Out.fraction[1]+6*moleComp_Out.fraction[2]+8*moleComp_Out.fraction[3]+10*moleComp_Out.fraction[4]+2*moleComp_Out.fraction[7]+2*moleComp_Out.fraction[9]);

  n_flow_O_In=n_flow_In*(2*moleComp_In.fraction[6]+1*moleComp_In.fraction[7]+1*moleComp_In.fraction[8]);
  n_flow_O_Out=n_flow_Out*(2*moleComp_Out.fraction[6]+1*moleComp_Out.fraction[7]+1*moleComp_Out.fraction[8]);

  n_flow_N_In=n_flow_In*2*moleComp_In.fraction[5];
  n_flow_N_Out=n_flow_Out*2*moleComp_Out.fraction[5];

  connect(ramp.y, source.m_flow) annotation (Line(points={{-99,54},{-94,54},{-94,6},{-90,6}}, color={0,0,127}));
  connect(ramp2.y, sink.p) annotation (Line(points={{99,6},{90,6}}, color={0,0,127}));
  connect(combiTimeTable.y, source.xi) annotation (Line(points={{-99,-6},{-96,-6},{-90,-6}}, color={0,0,127}));
  connect(source.gasPort, temperature_In.gasPortIn) annotation (Line(
      points={{-68,0},{-65,0},{-62,0}},
      color={255,255,0},
      thickness=1.5));
  connect(temperature_In.gasPortOut, moleComp_In.gasPortIn) annotation (Line(
      points={{-42,0},{-39,0},{-36,0}},
      color={255,255,0},
      thickness=1.5));
  connect(moleComp_In.gasPortOut, prereformer.gasPortIn) annotation (Line(
      points={{-16,0},{-10,0}},
      color={255,255,0},
      thickness=1.5));
  connect(prereformer.gasPortOut, temperature_Out.gasPortIn) annotation (Line(
      points={{10,0},{16,0}},
      color={255,255,0},
      thickness=1.5));
  connect(temperature_Out.gasPortOut, moleComp_Out.gasPortIn) annotation (Line(
      points={{36,0},{42,0}},
      color={255,255,0},
      thickness=1.5));
  connect(moleComp_Out.gasPortOut, sink.gasPort) annotation (Line(
      points={{62,0},{65,0},{68,0}},
      color={255,255,0},
      thickness=1.5));
  connect(ramp1.y, source.T) annotation (Line(points={{-99,24},{-96,24},{-96,0},{-90,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-20},{120,100}}),  graphics={Text(
          extent={{-58,94},{58,76}},
          lineColor={0,140,72},
          textString="1000-2000 s mass flow from 1 to 2 kg/s
3000-4000 s temperature from 100 to 600 C
5000-6000 s composition changes
9000-10000 s pressure at output from 30 to 1 bar
11000-12000 s lowering steam supply until zero"),
                                 Text(
          extent={{-80,60},{76,44}},
          lineColor={0,140,72},
          textString="check molar components C, H, O, N
check that temperature sinks because of endothermic process (for insufficient steam supply the composition at the outlet changes and the temperature is invalid)
check mass flows
check pressure loss in right direction
check that C2+ are still decomposed and H2O at outlet is zero and not negative; H and O molar flows are not equal anymore")}),
    Icon(coordinateSystem(extent={{-120,-20},{120,100}})),
    experiment(StopTime=14000, __Dymola_NumberOfIntervals=700),
    __Dymola_experimentSetupOutput);
end TestPrereformer_L1;