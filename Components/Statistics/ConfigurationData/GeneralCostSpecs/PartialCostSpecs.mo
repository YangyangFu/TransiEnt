within TransiEnt.Components.Statistics.ConfigurationData.GeneralCostSpecs;
partial model PartialCostSpecs "Base model for cost specifications"
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

  extends Basics.Icons.RecordModel;
  import TransiEnt.Basics.Units;

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //        Constants and Parameters
  // _____________________________________________

  //Invest cost
  parameter Units.MonetaryUnitPerPower Cspec_inv_der_E(displayUnit="EUR/kW")=0 "Specific invest cost per nominal power";
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_inv_E(displayUnit="EUR/MWh") = 0 "Specific invest cost per nominal energy capacity";
  parameter Real size1=0 "Size 1 of the component";
  parameter Real size2=0 "Size 2 of the component";
  parameter Units.MonetaryUnit C_inv_size=0 "Invest cost depending on the size";
  //Operation-related cost
  parameter Real factor_OM=0 "Percentage of the invest cost that represents the annual O&M cost";
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_OM_W_el=0 "Specific O&M cost per electric energy";
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_OM_Q=0 "Specific O&M cost per heating energy";
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_OM_H=0 "Specific O&M cost per gas energy";
  parameter TransiEnt.Basics.Units.MonetaryUnitPerEnergy Cspec_OM_other=0 "Specific O&M cost per other resource, e.g. water";
  //Other cost
  parameter Units.MonetaryUnit C_other_fix=0 "Fix other cost";
  //Life time
  parameter Units.Time_year lifeTime=0 "Life time";
  //Demand-related cost and revenue are given in simCenter
end PartialCostSpecs;
