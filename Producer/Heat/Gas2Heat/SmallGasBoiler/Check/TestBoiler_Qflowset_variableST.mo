within TransiEnt.Producer.Heat.Gas2Heat.SmallGasBoiler.Check;
model TestBoiler_Qflowset_variableST
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

  inner TransiEnt.SimCenter simCenter(
    redeclare TransiEnt.Basics.Media.Gases.Gas_VDIWA_NG7_H2_var gasModel2,
    redeclare TransiEnt.Basics.Media.Gases.VLE_VDIWA_NG7_H2_var gasModel1,
    redeclare TransiEnt.Basics.Tables.HeatGrid.HeatingCurves.HeatingCurveEONHanse heatingCurve)
    annotation (Placement(transformation(extent={{-110,80},{-90,100}})));

  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_In(
    T_const=273.15 + 50,
    variable_T=false,
    m_flow_const=10,
    variable_m_flow=true)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,-60})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_Out(p_const=
        simCenter.p_n[2]) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-60})));
  TransiEnt.Components.Boundaries.Gas.IdealGasCompositionByWtFractions gasCompositionByWtFractions(xi_in=simCenter.gasModel2.xi_default) annotation (Placement(transformation(extent={{-98,-14},{-82,2}})));
  Modelica.Blocks.Sources.Ramp  ramp(
    offset=0,
    height=Boiler.Q_flow_n,
    startTime=0,
    duration=0)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Gasboiler_dynamic_L1 Boiler(
    condensing=false,
    fixedSupplyTemperature=false,
    Q_flow_n=2e6,
    dimension=3) annotation (Placement(transformation(extent={{-18,-18},{18,18}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=1/10000,
    amplitude=0.25*Boiler.Q_flow_n/Boiler.cp_water/(90 - 50),
    offset=Boiler.Q_flow_n/Boiler.cp_water/(90 - 50))
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryIdealGas_pTxi gasSink(gasModel=simCenter.exhaustGasModel) annotation (Placement(transformation(extent={{60,-10},{40,10}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryIdealGas_pTxi gasSource(gasModel=simCenter.gasModel2, variable_xi=true) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation

  connect(Boiler.waterPortIn, boundaryVLE_In.steam_a) annotation (Line(
      points={{-10.08,-14.76},{-10.08,-40},{-20,-40},{-20,-50}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Boiler.waterPortOut, boundaryVLE_Out.steam_a) annotation (Line(
      points={{10.08,-14.76},{10.08,-40},{20,-40},{20,-50}},
      color={175,0,0},
      thickness=0.5,
      smooth=Smooth.None));
  connect(ramp.y, Boiler.Q_flow_set) annotation (Line(
      points={{-39,50},{-34,50},{-34,15.84},{-16.92,15.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sine.y, boundaryVLE_In.m_flow) annotation (Line(
      points={{-59,-80},{-26,-80},{-26,-72}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(gasSource.gasPort, Boiler.gasPortIn) annotation (Line(
      points={{-40,0},{-18,0}},
      color={255,213,170},
      thickness=0.5,
      smooth=Smooth.None));
  connect(Boiler.gasPortOut, gasSink.gasPort) annotation (Line(
      points={{18,0},{40,0}},
      color={255,213,170},
      thickness=0.5,
      smooth=Smooth.None));
  connect(gasCompositionByWtFractions.xi, gasSource.xi) annotation (Line(
      points={{-82,-6},{-62,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{100,100}}), graphics), Icon(coordinateSystem(extent={{-120,
            -100},{100,100}})),
    experiment(StopTime=10000));
end TestBoiler_Qflowset_variableST;
