within TransiEnt.Producer.Electrical.Photovoltaics.Advanced_PV.Characteristics;
record PVModule_Characteristics_Sanyo_HIT_200_BA3
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
  extends Generic_Characteristics_PVModule(
  MPP_dependency_on_Temp_fixedIrradiation=[
 0,214.3545548;
 25,200.8472531;
 50,187.3094253;
 75,173.1095017],
  MPP_dependency_on_irradiation_fixedTemperature=[
  0,0;
200,37.69290789;
400,77.36493756;
600,117.7097234;
800,159.0501238;
1000,201.294124]);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PVModule_Characteristics_Sanyo_HIT_200_BA3;
