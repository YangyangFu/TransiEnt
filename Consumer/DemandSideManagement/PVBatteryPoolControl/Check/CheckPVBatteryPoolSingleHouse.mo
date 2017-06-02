within TransiEnt.Consumer.DemandSideManagement.PVBatteryPoolControl.Check;
model CheckPVBatteryPoolSingleHouse
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

  inner parameter Real startTime = 0;

  PVBatteryPool PBBatteryPool(nSystems=param.nSystems)
                              annotation (Placement(transformation(extent={{34,-72},{76,-34}})));

  inner Base.PoolParameter param(
    P_el_PV_peak=5,
    P_pbp_increment=0.1,
    SOC_cond=0,
    P_el_cond=1760,
    eta_max=0.8,
    useBatteryConditioning=true,
    SOC_min=0.30,
    P_el_pbp_total=30,
    t_trading_intraday=900,
    nSystems=1)           annotation (Placement(transformation(extent={{-22,80},{4,104}})));
  Basics.Tables.GenericDataTable loadProfiles(
    relativepath="electricity/ElectricDemandSingleHouseTypicalProfiles.txt",
    columns=2:6,
    multiple_outputs=false) annotation (Placement(transformation(extent={{-34,26},{-14,46}})));
  Basics.Tables.GenericDataTable pvProfiles(
    relativepath="electricity/PhotovoltaicSingleHouseTypicalProfiles.txt",
    columns=2:5,
    multiple_outputs=false) annotation (Placement(transformation(extent={{-34,-12},{-14,8}})));
  Modelica.Blocks.Math.Gain P_Load(k=2500*3.6e6) annotation (Placement(transformation(extent={{-4,30},{8,42}})));
  Modelica.Blocks.Math.Gain P_PV(k=2.5*1e3) annotation (Placement(transformation(extent={{-2,-8},{10,4}})));
  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  Components.Boundaries.Electrical.Frequency lumpedGrid annotation (Placement(transformation(extent={{2,-62},{-18,-42}})));
equation

  connect(PBBatteryPool.P_el_load[1], P_Load.y) annotation (Line(points={{33.16,-38.18},{18,-38.18},{18,36},{8.6,36}}, color={0,0,127}));
  connect(PBBatteryPool.P_el_PV[1], P_PV.y) annotation (Line(points={{33.16,-45.78},{14,-45.78},{14,-2},{10.6,-2}},
                                                                                                              color={0,0,127}));
  connect(lumpedGrid.epp, PBBatteryPool.epp) annotation (Line(
      points={{2.1,-52.1},{34.21,-52.1},{34.21,-52.905}},
      color={0,135,135},
      thickness=0.5));
  connect(loadProfiles.y1, P_Load.u) annotation (Line(points={{-13,36},{-5.2,36},{-5.2,36}}, color={0,0,127}));
  connect(pvProfiles.y1, P_PV.u) annotation (Line(points={{-13,-2},{-3.2,-2},{-3.2,-2}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "CheckPVBatteryPoolSingleHouse.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=1, position={809, 0, 791, 695}, y={"P_PV.y"}, range={0.0, 90000.0, -20.0, 140.0}, grid=true, colors={{28,108,200}},filename=resultFile);
createPlot(id=1, position={809, 0, 791, 345}, y={"P_Load.y"}, range={0.0, 90000.0, 50.0, 600.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);

  resultFile := "Successfully plotted results for file: " + resultFile;

    annotation (experiment(StopTime=7200, __Dymola_Algorithm="Dassl"), __Dymola_experimentSetupOutput(events=false));
end plotResult;
annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                                       Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
  experiment(
      StopTime=86400,
      Interval=900,
      __Dymola_Algorithm="Dassl"),
  __Dymola_experimentSetupOutput(
    textual=false,
    derivatives=false,
    events=false));
end CheckPVBatteryPoolSingleHouse;