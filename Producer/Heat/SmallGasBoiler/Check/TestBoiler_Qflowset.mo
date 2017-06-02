within TransiEnt.Producer.Heat.SmallGasBoiler.Check;
model TestBoiler_Qflowset
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

  inner TransiEnt.SimCenter simCenter(
    redeclare TransiEnt.Basics.Media.Gases.Gas_VDIWA_NG7_H2_var gasModel2,
    redeclare TransiEnt.Basics.Media.Gases.VLE_VDIWA_NG7_H2_var gasModel1,
    redeclare TransiEnt.Basics.Tables.HeatGrid.HeatingCurves.HeatingCurveEONHanse heatingCurve)
    annotation (Placement(transformation(extent={{-110,80},{-90,100}})));

  ClaRa.Components.BoundaryConditions.BoundaryVLE_Txim_flow boundaryVLE_In(
    T_const=273.15 + 50,
    m_flow_const=5,
    variable_m_flow=true,
    variable_T=false)
                     annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,-60})));
  ClaRa.Components.BoundaryConditions.BoundaryVLE_pTxi boundaryVLE_Out(p_const=
        simCenter.p_n[2]) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,-60})));
  TransiEnt.Components.Boundaries.Gas.IdealGasCompositionByWtFractions gasCompositionByWtFractions(xi_in=simCenter.gasModel2.xi_default) annotation (Placement(transformation(extent={{-108,-14},{-92,2}})));
  Modelica.Blocks.Sources.Ramp  ramp(
    duration=0,
    offset=0,
    startTime=100,
    height=0.2*Boiler.Q_flow_n)
    annotation (Placement(transformation(extent={{-74,44},{-54,64}})));
  Modelica.Blocks.Sources.RealExpression T_supply_set(y=90 + 273.15)
    annotation (Placement(transformation(extent={{-110,22},{-84,44}})));
  Gasboiler_dynamic_L1 Boiler(
    referenceNCV=true,
    condensing=true,
    Q_flow_n=1e6,
    dimension=3) annotation (Placement(transformation(extent={{-18,-18},{18,18}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  TransiEnt.Components.Boundaries.Gas.BoundaryIdealGas_pTxi gasSink(gasModel=simCenter.exhaustGasModel) annotation (Placement(transformation(extent={{40,-10},{60,10}})));
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
  connect(Boiler.gasPortOut, gasSink.gasPort) annotation (Line(
      points={{18,0},{60,0}},
      color={255,213,170},
      thickness=0.5,
      smooth=Smooth.None));
  connect(gasSource.gasPort, Boiler.gasPortIn) annotation (Line(
      points={{-40,0},{-18,0}},
      color={255,213,170},
      thickness=0.5,
      smooth=Smooth.None));
  connect(gasCompositionByWtFractions.xi, gasSource.xi) annotation (Line(
      points={{-92,-6},{-62,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ramp.y, Boiler.Q_flow_set) annotation (Line(
      points={{-53,54},{-34,54},{-34,15.84},{-16.92,15.84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_supply_set.y, Boiler.T_supply_set) annotation (Line(
      points={{-82.7,33},{-38,33},{-38,9},{-16.92,9}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Boiler.m_flow_HC_req, boundaryVLE_In.m_flow) annotation (Line(
      points={{-15.84,-14.76},{-15.84,-34},{-34,-34},{-34,-82},{-26,-82},{-26,
          -72}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -100},{100,100}}), graphics), Icon(coordinateSystem(extent={{-120,
            -100},{100,100}})),
    experiment(StopTime=1500));
end TestBoiler_Qflowset;
