within TransiEnt.Basics.Tables.Check;
model TestGenericDataTable
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
  import TransiEnt;
  extends TransiEnt.Basics.Icons.Checkmodel;

  inner TransiEnt.SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));

  TransiEnt.Basics.Tables.GenericDataTable genericDataTable(relativepath="electricity/ElectricityDemandHH_900s_01.01.20120-01.01.20130.txt") annotation (Placement(transformation(extent={{-10,-8},{10,12}})));
equation

  annotation (experiment(
      StopTime=3.1536e+007,
      Interval=900,
      Tolerance=1e-010,
      __Dymola_Algorithm="Euler"),                           __Dymola_experimentSetupOutput);
end TestGenericDataTable;
