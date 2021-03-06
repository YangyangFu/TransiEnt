within TransiEnt.Components.Boundaries.Gas.Check;
model CheckStepVariationModels

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Checkmodel;

  inner TransiEnt.SimCenter simCenter(redeclare Basics.Media.Gases.VLE_VDIWA_NG7_H2_var gasModel1, redeclare Basics.Media.Gases.Gas_VDIWA_NG7_H2_var gasModel2)
                                                                                                    annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
  RealGasCompositionByWtFractions_stepVariation realGasCompositionByWtFractions_stepVariation(period=0.1, stepsize=0.1) annotation (Placement(transformation(extent={{-10,24},{10,44}})));
  IdealGasCompositionByWtFractions_stepVariation idealGasCompositionByWtFractions_stepVariation(period=0.1, stepsize=0.1) annotation (Placement(transformation(extent={{-8,-16},{12,4}})));
  annotation (experiment(StopTime=1.1), __Dymola_experimentSetupOutput);
end CheckStepVariationModels;
