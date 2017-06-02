within TransiEnt.Components.Gas.Compressor;
model CompressorRealGasIsothermal_L1_simple "Simple isothermal compressor or fan for a one phase VLE fluid"

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

  // power is calculated for an isothermal compression                         //

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends Base.PartialCompressorRealGas_L1_simple;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

protected
  SI.SpecificEnergy w_t_rev "Specific technical work for the reversible, isothermal compression";
  SI.SpecificEnergy q_rev "Specific heat for the reversible, isothermal compression (<0)";

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  P_hyd =w_t_rev*gasPortIn.m_flow;

  gasIn.T = gasOut.T;
  //equations from Baehr, H. D., & Kabelac, S. (2012). Thermodynamik: Grundlagen und technische Anwendungen. Springer-Verlag.
  w_t_rev =gasOut.h - gasIn.h - q_rev;
  q_rev =gasIn.T*(gasOut.s - gasIn.s);

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

                                                annotation(dialog(tab = "Advanced"),
              Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),  Icon(coordinateSystem(preserveAspectRatio=false,
          extent={{-100,-100},{100,100}}),
                                      graphics),
          Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>This model represents an isothermal compressor for real gases. It is a modified version of the model ClaRa.Components.TurboMachines.Compressors.CompressorGas_L1_simple from ClaRa version 1.2.1. The model is documented there and here only the changes are described. </p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>The model was changed to work with real gases and to model an isothermal compression. Also, mechanical and electrical efficiencies were added. </p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>Only valid for real gases, positive pressure differences and ideal isothermal compression. Variable efficiencies and time-dependent behavior are not considered.</p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>gasPortIn: real gas inlet </p>
<p>gasPortOut: real gas outlet </p>
<p>m_flow_in: input for mass flow rate </p>
<p>V_flow_in: input for volume flow rate </p>
<p>P_el_in: input for electrical power </p>
<p>dp_in: input for pressure difference </p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no elements) </p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>The specific work for the reversible isothermal compression is calculated using equations from Baehr and Kabelac [1].</p>
<p><br><img src=\"modelica://TransiEnt/Images/equations/equation_CompressorRealGasIsothermal_1.png\" alt=\"\"/><br></p>
<p>The electrical power is determined using the mechanical and electrical efficiencies.</p>
<p><br><img src=\"modelica://TransiEnt/Images/equations/equation_CompressorRealGasIsothermal_2.png\" alt=\"\"/><br></p>
<h4><span style=\"color:#008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>[1] Baehr, H. D., Kabelac, S. (2012). Thermodynamik: Grundlagen und technische Anwendungen. Springer-Verlag. </p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Carsten Bode (c.bode@tuhh.de) on Tue Sep 20 2016<br> </p>
</html>"));
end CompressorRealGasIsothermal_L1_simple;
