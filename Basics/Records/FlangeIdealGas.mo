within TransiEnt.Basics.Records;
model FlangeIdealGas
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

    extends TransiEnt.Basics.Icons.Record;
    import SI = Modelica.SIunits;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

    replaceable parameter TransiEnt.Basics.Media.Gases.Gas_VDIWA_SG6_var mediumModel "Used medium model" annotation (Dialog(tab="System"));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

    input SI.MassFlowRate m_flow "Mass flow rate" annotation (Dialog);
    input SI.Temperature T "Temperature" annotation (Dialog);
    input SI.Pressure p "Pressure" annotation (Dialog);
    input SI.SpecificEnthalpy h "Specific enthalpy" annotation (Dialog);
    input SI.MassFraction xi[mediumModel.nc - 1] "Component mass fractions"  annotation(Dialog);
    input SI.MassFraction x[mediumModel.nc - 1] "Component molar fractions"  annotation(Dialog);
    input SI.Density rho "Density" annotation(Dialog);

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>(Description) </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Description)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(none)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Max Mustermann (mustermann@mustermail.de), Apr 2014</p>
</html>"));
end FlangeIdealGas;
