within TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs;
model Biomass "Biomass plant"
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

  extends PartialPowerPlantCostSpecs(
    Cspec_inv_der_E=simCenter.Cinv_Biomass,
    Cspec_inv_E=0,
    Cspec_OM_W_el=simCenter.Cvar_Biomass,
    Cspec_OM_other=0,
    lifeTime=simCenter.lifeTime_Biomass,
    m_flow_CDEspec_fuel=simCenter.FuelSpecEmis_Biomass,
    factor_OM=simCenter.CfixOM_Biomass/simCenter.Cinv_Biomass,
    Cspec_fuel=simCenter.Cfue_Biomass);
end Biomass;
