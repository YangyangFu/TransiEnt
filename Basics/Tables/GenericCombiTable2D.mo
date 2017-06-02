within TransiEnt.Basics.Tables;
model GenericCombiTable2D "Parameterized version of MSL's CombiTimeTable with 2 Dimensions"

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

  import TransiEnt;
  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  extends TransiEnt.Basics.Icons.TableIcon;

  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________

  parameter TransiEnt.Basics.Tables.DataPrivacy datasource=DataPrivacy.isPublic "Source of table data" annotation (
    Evaluate=true,
    HideResult=true,
    Dialog(enable=not use_absolute_path, group="Data location"));

  final parameter String environment_variable_name=if datasource ==DataPrivacy.isPublic              then Types.PUBLIC_DATA else Types.PRIVATE_DATA annotation(Evaluate=true, HideResult=true, Dialog(enable=not use_absolute_path, group="Data location"));

  parameter String relativepath = "" "Path relative to source directory"
                                                                        annotation(Evaluate=true, HideResult=true, Dialog(enable=not use_absolute_path, group="Data location"));

  final parameter String complete_relative_path = Modelica.Utilities.Files.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(environment_variable_name) + relativepath);

  final parameter String genericFileName = complete_relative_path;

  parameter String tablename = "default";

//   parameter Integer columns[:]=2:size(combiTable2D.table, 2) "columns of table to be interpolated (has to be modified before usage!)";
//     // this parameter has to be set manually to a correct value, e.g. {2,3,4} because dymola is not able to evaluate size(combiTable2D.table) prior to simulation and therefore the check will fail!

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput u1 annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
  Modelica.Blocks.Interfaces.RealInput u2 annotation (Placement(transformation(extent={{-140,-90},{-100,-50}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(extent={{100,-10},{120,10}})));

    //y[size(columns,1)]
  // _____________________________________________
  //
  //                Complex Components
  // _____________________________________________

  Modelica.Blocks.Tables.CombiTable2D combiTable2D(
    tableOnFile=true,
    tableName=tablename,
    fileName=genericFileName) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(u1, combiTable2D.u1) annotation (Line(
      points={{-120,70},{-68,70},{-68,6},{-12,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(u2, combiTable2D.u2) annotation (Line(
      points={{-120,-70},{-68,-70},{-68,-6},{-12,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(combiTable2D.y, y) annotation (Line(
      points={{11,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.None));
   annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}), graphics));
end GenericCombiTable2D;
