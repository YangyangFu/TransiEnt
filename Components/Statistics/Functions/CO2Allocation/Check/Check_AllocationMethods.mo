within TransiEnt.Components.Statistics.Functions.CO2Allocation.Check;
model Check_AllocationMethods "Tester for allocation method functions"
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

  //thermal and electrical efficiency of coupled process
  Modelica.SIunits.Efficiency eta_th(start=0.4);
  Modelica.SIunits.Efficiency eta_el = 0.3;

  // (energy-) specific mass of carbon dioxide equivalents
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec=250;

  // allocated (energy-) specific mass of carbon dioxide equivalents for different methods
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_el_IEA;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_th_IEA;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_el_efficiencies;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_th_efficiencies;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_el_finnish;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_th_finnish;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_el_creditsThermal;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_th_creditsThermal;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_el_creditsElectrical;
  TransiEnt.Basics.Units.MassOfCDEperEnergy m_flow_spec_th_creditsElectrical;

  //defined to catch the output vector of the allocation function
protected
  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_flow_spec_IEA={m_flow_spec_el_IEA,m_flow_spec_th_IEA};
  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_flow_spec_efficiencies={m_flow_spec_el_efficiencies,m_flow_spec_th_efficiencies};
  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_flow_spec_finnish={m_flow_spec_el_finnish,m_flow_spec_th_finnish};
  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_flow_spec_creditsThermal={m_flow_spec_el_creditsThermal,m_flow_spec_th_creditsThermal};
  TransiEnt.Basics.Units.MassOfCDEperEnergy[2] m_flow_spec_creditsElectrical={m_flow_spec_el_creditsElectrical,m_flow_spec_th_creditsElectrical};

equation
  der(eta_th) = 0.2;

  //function calls for different allocation methods
  m_flow_spec_IEA = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_IEA(
    eta_el,
    eta_th,
    m_flow_spec);
  m_flow_spec_efficiencies = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_Efficiencies(
    eta_el,
    eta_th,
    m_flow_spec);
  m_flow_spec_finnish = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_Finnish(
    eta_el,
    eta_th,
    m_flow_spec);
  m_flow_spec_creditsThermal = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_CreditsThermal(
    eta_el,
    eta_th,
    m_flow_spec);
  m_flow_spec_creditsElectrical = TransiEnt.Components.Statistics.Functions.CO2Allocation.AllocationMethod_CreditsElectrical(
    eta_el,
    eta_th,
    m_flow_spec);

end Check_AllocationMethods;
