within TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs;
model WindOnshore "Wind onshore"
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
    Cspec_inv_der_E=simCenter.Cinv_Wind_On,
    Cspec_inv_E=0,
    Cspec_OM_W_el=simCenter.Cvar_Wind_On,
    m_flow_CDEspec_fuel=0,
    Cspec_OM_other=0,
    lifeTime=simCenter.lifeTime_Wind_On,
    factor_OM=simCenter.CfixOM_Wind_On/simCenter.Cinv_Wind_On,
    Cspec_fuel=simCenter.Cfue_Wind_On);
end WindOnshore;