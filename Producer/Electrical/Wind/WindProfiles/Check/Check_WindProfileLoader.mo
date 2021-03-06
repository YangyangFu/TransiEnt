within TransiEnt.Producer.Electrical.Wind.WindProfiles.Check;
model Check_WindProfileLoader
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
  WindProfileLoader windProfileLoader(
    change_of_sign=true,
    REProfile=TransiEnt.Producer.Electrical.Wind.WindProfiles.WindData.Wind2013_LK_E66_HH,
    P_el_n=360e6) annotation (Placement(transformation(extent={{-80,46},{-60,66}})));
  TransiEnt.Components.Boundaries.Electrical.Power WindGenerator annotation (choicesAllMatching=true, Placement(transformation(extent={{-23,14},{-3,34}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency ElectricGrid annotation (Placement(transformation(extent={{-24,-24},{-4,-4}})));
  WindProfileLoader windProfileLoader1(
    change_of_sign=true,
    REProfile=TransiEnt.Producer.Electrical.Wind.WindProfiles.WindData.Wind2011_TenneT_Offshore_900s,
    P_el_n=360e6) annotation (Placement(transformation(extent={{-92,-86},{-72,-66}})));
  TransiEnt.Components.Boundaries.Electrical.Power WindGenerator1 annotation (choicesAllMatching=true, Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-65,-40})));
equation
  connect(windProfileLoader.y1, WindGenerator.P_el_set)
    annotation (Line(points={{-59,56},{-19,56},{-19,36}}, color={0,0,127}));
  connect(ElectricGrid.epp, WindGenerator.epp) annotation (Line(
      points={{-24.1,-14.1},{-44,-14.1},{-44,23.9},{-23.1,23.9}},
      color={0,135,135},
      thickness=0.5));
  connect(windProfileLoader1.y1, WindGenerator1.P_el_set)
    annotation (Line(points={{-71,-76},{-59,-76},{-59,-52}}, color={0,0,127}));
  connect(WindGenerator1.epp, WindGenerator.epp) annotation (Line(
      points={{-54.9,-39.9},{-44,-39.9},{-44,23.9},{-23.1,23.9}},
      color={0,135,135},
      thickness=0.5));
public
function plotResult

  constant String resultFileName = "Check_WindProfileLoader.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();

createPlot(id=1, position={809, 0, 791, 681}, y={"WindGenerator.epp.P", "WindGenerator1.epp.P"}, range={0.0, 30000.0, -400000000.0, -100000000.0}, grid=true, colors={{28,108,200}, {238,46,47}}, filename=resultFileName);
   resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end Check_WindProfileLoader;
