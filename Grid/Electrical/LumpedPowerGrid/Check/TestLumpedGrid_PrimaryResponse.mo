within TransiEnt.Grid.Electrical.LumpedPowerGrid.Check;
model TestLumpedGrid_PrimaryResponse
  import TransiEnt;
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

  LumpedGrid lumpedGrid annotation (Placement(transformation(extent={{-30,-2},{-10,18}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency constantFrequency_L1_1(useInputConnector=true) annotation (Placement(transformation(extent={{22,-2},{42,18}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=5,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=50) annotation (Placement(transformation(extent={{22,34},{42,54}})));
  Modelica.Blocks.Sources.TimeTable timeTable1(table=[0,50; 3600,50; 43000,50.2; 53000,50.2; 100000,49.8; 110000,49.8])
    annotation (Placement(transformation(extent={{-8,34},{12,54}})));
  inner SimCenter            simCenter(         thres=1e-9,
    useThresh=true,
    Td=450,
    tableInterpolationSmoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    P_n_ref_1=4e9)
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  inner ModelStatistics           modelStatistics
    annotation (Placement(transformation(extent={{-80,100},{-60,80}})));
equation
  connect(firstOrder.y,constantFrequency_L1_1. f_set) annotation (Line(points={{43,44},{50,44},{50,28},{26.6,28},{26.6,20}},color={0,0,127}));
  connect(timeTable1.y,firstOrder. u) annotation (Line(points={{13,44},{16.5,44},{20,44}}, color={0,0,127}));
  connect(lumpedGrid.epp, constantFrequency_L1_1.epp) annotation (Line(
      points={{-10,8},{8,8},{8,7.9},{21.9,7.9}},
      color={0,135,135},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=1),
    __Dymola_experimentFlags(
      Advanced(
        EvaluateAlsoTop=false,
        GenerateVariableDependencies=false,
        OutputModelicaCode=false),
      Evaluate=true,
      OutputCPUtime=true,
      OutputFlatModelica=false));
end TestLumpedGrid_PrimaryResponse;
