within TransiEnt.Producer.Electrical.Photovoltaics.Check;
model Check_PhotovoltaicPlant
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
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  inner TransiEnt.ModelStatistics modelStatistics annotation (Placement(transformation(extent={{-60,80},{-40,100}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency ElectricGrid1 annotation (Placement(transformation(extent={{42,-10},{62,10}})));
  PhotovoltaicPlant photovoltaicPlant annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
public
function plotResult

  constant String resultFileName = "Check_PVModule.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=3, position={809, 0, 791, 695}, y={"pVModule.epp.P", "gHI_Hamburg_3600s_0101_3112_IWECfile1.y1"}, range={0.0, 1700000.0, -50.0, 250.0}, autoscale=false, grid=true, colors={{28,108,200}, {238,46,47}}, range2={0.15000000000000002, 0.4},filename=resultFile);
createPlot(id=3, position={809, 0, 791, 229}, y={"temperature_Hamburg_3600s_IWEC_from_SAM.y1"}, range={0.0, 1700000.0, -10.0, 15.0}, autoscale=false, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
createPlot(id=3, position={809, 0, 791, 228}, y={"wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m.y1"}, range={0.0, 1700000.0, 0.0, 20.0}, autoscale=false, grid=true, subPlot=3, colors={{28,108,200}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
equation
  connect(photovoltaicPlant.epp, ElectricGrid1.epp) annotation (Line(
      points={{-20,0},{41.9,0},{41.9,-0.1}},
      color={0,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(StopTime=3.1536e+007, Interval=3600),
    __Dymola_experimentSetupOutput(events=false));
end Check_PhotovoltaicPlant;
