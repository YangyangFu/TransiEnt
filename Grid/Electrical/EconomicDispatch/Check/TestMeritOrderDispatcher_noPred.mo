within TransiEnt.Grid.Electrical.EconomicDispatch.Check;
model TestMeritOrderDispatcher_noPred
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

  MeritOrderDispatcher mod(
    startTime=60,
    P_init(displayUnit="W") = {0.2e9,2.3e9},
    ntime=1,
    samplePeriod=60)                                          annotation (Placement(transformation(extent={{4,-12},{28,14}})));
  Basics.Blocks.Sources.BooleanArrayConstant operatingStatus(nout=mod.nout) annotation (Placement(transformation(extent={{-22,-48},{-2,-28}})));
  inner ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-78,100},{-58,80}})));
  Modelica.Blocks.Sources.Cosine P_load_is(
    freqHz=1/86400,
    amplitude=2e8,
    offset=2.3e9) annotation (Placement(transformation(extent={{-52,-10},{-32,10}})));
  Basics.Blocks.Sources.ConstantVectorSource P_sec_pos(nout=simCenter.generationPark.nDispPlants, k=fill(0, P_sec_pos.nout)) annotation (Placement(transformation(extent={{-18,34},{2,54}})));
  Modelica.Blocks.Sources.Constant P_min_total(k=sum(simCenter.generationPark.P_min)) annotation (Placement(transformation(extent={{68,54},{88,74}})));
  Modelica.Blocks.Sources.Constant P_max_total(k=sum(simCenter.generationPark.P_max)) annotation (Placement(transformation(extent={{66,18},{86,38}})));
  inner SimCenter simCenter(redeclare Base.EmptyGenerationPark generationPark(
      nPlants=2,
      nDispPlants=2,
      nMODPlants=2,
      P_grad_max_star={0.1/60,0.05/60},
      C_var={10,5},
      index={"Small expensive unit","Large cheap unit"},
      P_max={0.5e9,2.3e9},
      P_min=0.2 .* {0.5e9,2.3e9}))
                            annotation (Placement(transformation(extent={{-108,80},{-88,100}})));
equation
  connect(operatingStatus.y,mod. z) annotation (Line(points={{-1,-38},{16,-38},{16,-14.6}}, color={255,0,255}));
  connect(P_sec_pos.y,mod. P_R_pos) annotation (Line(points={{3,44},{10,44},{10,16.6},{11.2,16.6}}, color={0,0,127}));
  connect(P_sec_pos.y,mod. P_R_neg) annotation (Line(points={{3,44},{20.8,44},{20.8,16.6}}, color={0,0,127}));
  connect(mod.u[1], P_load_is.y) annotation (Line(points={{1.6,1},{-14.2,1},{-14.2,0},{-31,0}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestMeritOrderDispatcher_noPred.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

  createPlot(id=1, position={0, 0, 1524, 682}, y={"mod.P_set_total", "P_load_is.y", "mod.y[2]", "mod.P_max[2]"}, range={0.0, 88000.0, 1900000000.0, 2600000000.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}, {217,67,180}}, patterns={LinePattern.Solid, LinePattern.Solid, LinePattern.Solid, LinePattern.Dash}, filename=resultFile);
  createPlot(id=1, position={0, 0, 1524, 224}, y={"mod.y[1]", "mod.P_min[1]"}, range={0.0, 88000.0, 80000000.0, 220000000.0}, grid=true, subPlot=2, colors={{28,108,200}, {238,46,47}}, patterns={LinePattern.Solid, LinePattern.Dash}, filename=resultFile);
  createPlot(id=1, position={0, 0, 1524, 223}, y={"mod.der(C_var_total)"}, range={0.0, 88000.0, 10000000000.0, 14000000000.0}, grid=true, subPlot=3, colors={{28,108,200}}, filename=resultFile);

    resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})),
    experiment(StopTime=86400, Interval=60),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-120,-100},{120,100}})));
end TestMeritOrderDispatcher_noPred;
