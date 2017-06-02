within TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs;
model P2H "Power-2-Heat electrode boiler"
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
//Toedter,2015
  extends PartialPowerPlantCostSpecs(
    Cspec_inv_der_E=simCenter.Cinv_GasBoiler,
    Cspec_inv_E=0,
    Cspec_OM_W_el=simCenter.Cvar_GasBoiler,
    Cspec_OM_other=0,
    lifeTime=20,
    m_flow_CDEspec_fuel=0,
    factor_OM=simCenter.CfixOM_GasBoiler/simCenter.Cinv_GasBoiler,
    Cspec_fuel=0);
end P2H;
