within TransiEnt.Producer.Electrical.Base.ControlPower;
partial block PartialBalancingPowerPotential

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

/// ***** MOST IMPORTANT RULE: BEFORE PUSHING YOUR CHANGES YOUR MODEL SHOULD "CHECK" *****
/// (meaning if you press F8 or click the "check" Button there are no errors)

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  extends TransiEnt.Basics.Icons.Block;

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________
 outer SimCenter simCenter;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________
  parameter SI.Power P_nom = 120e6 "Nominal power of plant";

  parameter Real P_min_star=0.2 "Fraction of nominal power (=20% of nominal power)" annotation(Dialog(group="Physical Constraints"));

  parameter Real P_max_star=1 "Fraction of nominal power (=100% of nominal power)"
                                                                                  annotation(Dialog(group="Physical Constraints"));

  parameter Real P_grad_max_star=0.12/60 "Fraction of nominal power per second (12% per minute)"
                                                            annotation(Dialog(group="Physical Constraints"));

  parameter SI.Power P_pr_max = 10e6 "Primary balancing power band";

  parameter Boolean isSecondaryControlActive=true;

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

  input Boolean is_running  annotation (Dialog);
  input SI.Power   P_el_is  annotation (Dialog);
  input SI.Power   P_SB_set annotation (Dialog);
  input SI.Power   P_PB_set annotation (Dialog);

  SI.Power P_pr_neg_offer;
  SI.Power P_pr_pos_offer;
  SI.Power P_pr_provided;

  SI.Power P_sec_neg_offer;
  SI.Power P_sec_pos_offer;
  SI.Power P_sec_provided;

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________
  P_pr_provided = max(-P_pr_neg_offer, min(0,P_PB_set))+min(P_pr_pos_offer, max(0,P_PB_set));

  if isSecondaryControlActive then
    P_sec_provided = max(-P_sec_neg_offer, min(0,P_SB_set))+min(P_sec_pos_offer, max(0,P_SB_set));
  else
    P_sec_provided=0;
  end if;

    annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Potential balancing power provision.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>LoD 1 - only active power and frequency.</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"));
end PartialBalancingPowerPotential;
