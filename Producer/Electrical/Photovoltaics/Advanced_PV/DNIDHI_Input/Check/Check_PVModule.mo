within TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.DNIDHI_Input.Check;
model Check_PVModule
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
  TransiEnt.Components.Boundaries.Electrical.Frequency ElectricGrid1 annotation (Placement(transformation(extent={{32,-12},{52,8}})));
  TransiEnt.Basics.Tables.Ambient.Temperature_Hamburg_Fuhlsbuettel_3600s_2012 temperature_Hamburg_3600s_IWEC_from_SAM annotation (Placement(transformation(extent={{-74,30},{-54,50}})));
  TransiEnt.Basics.Tables.Ambient.Wind_Hamburg_3600s_TMY wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m annotation (Placement(transformation(extent={{-74,-86},{-54,-66}})));
  TransiEnt.Basics.Tables.Ambient.DNI_Hamburg_3600s_2012_TMY dNI_Hamburg_3600s_IWEC_from_SAM annotation (Placement(transformation(extent={{-74,-24},{-54,-4}})));
  TransiEnt.Basics.Tables.Ambient.DHI_Hamburg_3600s_2012_TMY dHI_Hamburg_3600s_IWEC_from_SAM annotation (Placement(transformation(extent={{-74,-54},{-54,-34}})));
  PVModule pVModule annotation (Placement(transformation(extent={{-18,-12},{2,8}})));
equation
  connect(wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m.y1, pVModule.WindSpeed_in) annotation (Line(points={{-53,-76},{-34,-76},{-34,-10},{-20,-10}}, color={0,0,127}));
  connect(dHI_Hamburg_3600s_IWEC_from_SAM.y1, pVModule.DHI_in) annotation (Line(points={{-53,-44},{-36,-44},{-36,-4.6},{-20,-4.6}}, color={0,0,127}));
  connect(dNI_Hamburg_3600s_IWEC_from_SAM.y1, pVModule.DNI_in) annotation (Line(points={{-53,-14},{-38,-14},{-38,0.4},{-20,0.4}},
                                                                                                                                color={0,0,127}));
  connect(temperature_Hamburg_3600s_IWEC_from_SAM.y1, pVModule.T_in) annotation (Line(points={{-53,40},{-34,40},{-34,6},{-20,6}},   color={0,0,127}));
  connect(pVModule.epp, ElectricGrid1.epp) annotation (Line(
      points={{1.3,-2.6},{15.65,-2.6},{15.65,-2.1},{31.9,-2.1}},
      color={0,135,135},
      thickness=0.5));
public
function plotResult

  constant String resultFileName = "Check_PVModule.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=3, position={809, 0, 791, 695}, y={"pVModule.epp.P", "dNI_Hamburg_3600s_IWEC_from_SAM.y1", "dHI_Hamburg_3600s_IWEC_from_SAM.y1"}, range={0.0, 1600000.0, -100.0, 500.0}, autoscale=false, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}}, range2={0.1, 0.6},filename=resultFile);
createPlot(id=3, position={809, 0, 791, 159}, y={"temperature_Hamburg_3600s_IWEC_from_SAM.y1"}, range={0.0, 1600000.0, -10.0, 20.0}, autoscale=false, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
createPlot(id=3, position={809, 0, 791, 146}, y={"wind_Hamburg_3600s_01012012_31122012_Wind_Hamburg_175m.y1"}, range={0.0, 1600000.0, 0.0, 20.0}, autoscale=false, grid=true, subPlot=3, colors={{28,108,200}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    experiment(
      StopTime=3.1536e+007,
      Interval=3600,
      Tolerance=1e-008),
    __Dymola_experimentSetupOutput(events=false));
end Check_PVModule;