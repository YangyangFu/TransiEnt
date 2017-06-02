within TransiEnt.Producer.Electrical.Others.Check;
model TestIdealContinuousBiomassPlant
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

  IdealContinuousBiomassPlant IdealContinuousBiomass_Plant(P_el_n=80e6) annotation (Placement(transformation(extent={{-10,-39},{10,-19}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency Grid(useInputConnector=false) annotation (Placement(transformation(extent={{40,-33},{60,-13}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},
            {-70,100}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60,80},
            {-40,100}})));
  Modelica.Blocks.Sources.TimeTable sched(table=[0,0; 350,0; 350,0.5; 720,0.5; 720,0.5; 3e3,0.5; 3000,0.5; 3001,0.5; 3002,0.5; 4e3,0.5; 4e3,0.2; 4500,0.2; 4500,0.2; 6000,0.2; 6000,0.7; 10e3,0.7; 10e3,0; 1.2e4,0])                                                 annotation (Placement(transformation(extent={{-100,20},{-80,40}})));
  Modelica.Blocks.Math.Gain P_set_plant_1(k=-IdealContinuousBiomass_Plant.P_el_n) annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
equation

  connect(IdealContinuousBiomass_Plant.epp, Grid.epp) annotation (Line(
      points={{9.5,-23.4},{20,-23.4},{20,-23.1},{39.9,-23.1}},
      color={0,135,135},
      thickness=0.5));
  connect(sched.y, P_set_plant_1.u) annotation (Line(points={{-79,30},{-52,30}},          color={0,0,127}));
  connect(P_set_plant_1.y, IdealContinuousBiomass_Plant.P_el_set) annotation (Line(points={{-29,30},{-24,30},{-1.5,30},{-1.5,-19.1}}, color={0,0,127}));
public
    function plotResult

    constant String resultFileName = "TestIdealContinuousBiomassPlant.mat";

    output String resultFile;

    algorithm
    clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
    resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
    removePlots();
    createPlot(id=3, position={809, 0, 791, 695}, y={"P_set_plant_1.y", "IdealContinuousBiomass_Plant.epp.P"}, range={0.0, 12000.0, -60000000.0, 5000000.0}, grid=true, colors={{28,108,200}, {238,46,47}},filename=resultFile);
    resultFile := "Successfully plotted results for file: " + resultFile;

    end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Text(
          extent={{20,84},{90,22}},
          lineColor={0,0,0},
          textString="Look at:

P_set_plant_1.y
IdealContinuousBiomassPlant.epp.P
")}),
    experiment(StopTime=12000, Interval=60),
    __Dymola_experimentSetupOutput,
              __Dymola_Commands(executeCall = TransiEnt.Producer.Electrical.Others.Check.TestPumpedStoragePlant.plotResult() "Plot example results"));
end TestIdealContinuousBiomassPlant;
