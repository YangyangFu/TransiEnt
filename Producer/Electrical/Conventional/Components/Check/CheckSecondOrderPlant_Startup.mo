within TransiEnt.Producer.Electrical.Conventional.Components.Check;
model CheckSecondOrderPlant_Startup "Example of the component SecondOrderPlant startup process (variable efficiency)"

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

  TransiEnt.Components.Boundaries.Electrical.Frequency grid(useInputConnector=false, f_set_const=simCenter.f_n) annotation (Placement(transformation(extent={{56,-60},{76,-40}})));
  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  Modelica.Blocks.Sources.Step P_el_set(
    offset=0,
    height=-1600e6,
    startTime=3600)
              annotation (Placement(transformation(extent={{-88,-54},{-68,-34}})));
  Components.SecondOrderPlant SteamPowerPlant_L0(
    P_el_n=1600e6,
    eta_total=0.45,
    typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.BlackCoal,
    P_el_grad=0.04,
    PartLoadCharLine=TransiEnt.Producer.Electrical.Base.PartloadEfficiency.SteamturbinePlant()) annotation (Placement(transformation(extent={{-8,-16},{12,4}})));
  Components.SecondOrderPlant CombinedCyclePlant_L0(
    eta_total=0.60,
    redeclare model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.GasCCGT,
    P_el_grad=0.08,
    P_el_n=1600000000,
    PartLoadCharLine=TransiEnt.Producer.Electrical.Base.PartloadEfficiency.CombinedCyclePlant()) annotation (Placement(transformation(extent={{-8,-126},{12,-106}})));
  Components.SecondOrderPlant GTPowerPlant_L0(
    redeclare model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.GasCCGT,
    P_el_grad=0.12,
    P_el_n=1600000000,
    PartLoadCharLine=TransiEnt.Producer.Electrical.Base.PartloadEfficiency.Gasturbine(),
    eta_total=0.35) annotation (Placement(transformation(extent={{-8,-66},{12,-46}})));
  inner TransiEnt.ModelStatistics modelStatistics
    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
equation
  connect(P_el_set.y, SteamPowerPlant_L0.P_el_set) annotation (Line(
      points={{-67,-44},{-28,-44},{-28,12},{0,12},{0,3.9},{0.5,3.9}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(SteamPowerPlant_L0.epp, grid.epp)
    annotation (Line(
      points={{11.5,-0.4},{30.75,-0.4},{30.75,-50.1},{55.9,-50.1}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(CombinedCyclePlant_L0.epp, grid.epp)
    annotation (Line(
      points={{11.5,-110.4},{30,-110.4},{30,-50.1},{55.9,-50.1}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.Bezier));

  connect(GTPowerPlant_L0.epp, grid.epp)
    annotation (Line(
      points={{11.5,-50.4},{11.5,-50},{30,-50},{30,-50.1},{55.9,-50.1}},
      color={0,135,135},
      thickness=0.5,
      smooth=Smooth.Bezier));
  connect(P_el_set.y, GTPowerPlant_L0.P_el_set) annotation (Line(
      points={{-67,-44},{0.5,-44},{0.5,-46.1}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(CombinedCyclePlant_L0.P_el_set, P_el_set.y) annotation (Line(
      points={{0.5,-106.1},{-28,-106.1},{-28,-44},{-67,-44}},
      color={0,0,127},
      smooth=Smooth.Bezier));
public
function plotResult

  constant String resultFileName = "CheckSecondOrderPlant_Startup.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=1, position={809, 0, 791, 695}, y={"P_el_set.y", "SteamPowerPlant_L0.epp.P", "CombinedCyclePlant_L0.epp.P",
"GTPowerPlant_L0.epp.P"}, range={0.0, 20000.0, -1800000000.0, 200000000.0}, grid=true, colors={{28,108,200}, {238,46,47}, {0,140,72}, {217,67,180}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-160},{100,100}})),
    experiment(StopTime=20000),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent={{-100,-160},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p align=\"center\"><img src=\"modelica://TransiEnt/Images/PlantStart.png\"/></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end CheckSecondOrderPlant_Startup;
