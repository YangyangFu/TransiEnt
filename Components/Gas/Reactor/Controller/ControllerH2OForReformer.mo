within TransiEnt.Components.Gas.Reactor.Controller;
model ControllerH2OForReformer "Controller to control the water mass flow rate for the prereformer and steam methane reformer"

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  import SI = Modelica.SIunits;
  import Modelica.Constants.eps;
  extends TransiEnt.Basics.Icons.Controller;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  constant SI.MolarMass M_H2O=0.01802;
  constant SI.MolarMass M_CH4=0.01604;
  constant SI.MolarMass M_C2H6=0.03007;
  constant SI.MolarMass M_C3H8=0.04410;
  constant SI.MolarMass M_C4H10=0.05812;

  final parameter TransiEnt.Basics.Media.Gases.VLE_VDIWA_NG7_SG_var vle_ng7_sg;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Real desiredMolarRatio=4.8 "Desired molar ratio of H2O to CH4 at the inlet of the SMR" annotation(Dialog(group="Fundamental Definitions"));

  // _____________________________________________
  //
  //                 Outer Models
  // _____________________________________________

  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.RealInput massComposition[vle_ng7_sg.nc](
    final quantity="MassFraction",
    final unit="kg/kg") "Mass composition of the feed before adding water or hydrogen"              annotation (Placement(transformation(extent={{-120,20},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_feed(final quantity="MassFlowRate", final unit="kg/s") "Feed mass flow rate before adding water or hydrogen" annotation (Placement(transformation(extent={{-120,-60},{-80,-20}}), iconTransformation(extent={{-120,-60},{-80,-20}})));

  Modelica.Blocks.Interfaces.RealOutput m_flow_steam(final quantity="MassFlowRate", final unit="kg/s") "Water mass flow rate that has to be added for given molar ratio" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,-100})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

protected
  SI.MassFlowRate m_flow_H2OforReformerCalc "Calculated mass flow rate for water, is negative if there is already sufficient water in the gas";
  SI.MolarFlowRate n_flow_H2O_beforeSMR "molar flow rate of H2O at the inlet of the SMR";
  SI.MolarFlowRate n_flow_CH4_beforeSMR "molar flow rate of CH4 at the inlet of the SMR";

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

  desiredMolarRatio = n_flow_H2O_beforeSMR/n_flow_CH4_beforeSMR;
  n_flow_CH4_beforeSMR =max(eps, m_flow_feed*(massComposition[1]/M_CH4 + 5/3*massComposition[2]/M_C2H6 + 7/3*massComposition[3]/M_C3H8 + 3*massComposition[4]/M_C4H10));
  n_flow_H2O_beforeSMR =(m_flow_feed*massComposition[7] + m_flow_H2OforReformerCalc)/M_H2O - m_flow_feed*(1/3*massComposition[2]/M_C2H6 + 2/3*massComposition[3]/M_C3H8 + massComposition[4]/M_C4H10);
  m_flow_steam = max(0, m_flow_H2OforReformerCalc);

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>This is a controller to control the steam mass flow rate for a steam methane reformer to ensure a given molar steam to methane ratio at the inlet of the steam methane reformer. </p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>The composition and mass flow rate of the feed are measured and the necessary steam mass flow rate is calculated depending on the expected reactions in the prereformer. </p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>The validity is limited because the composition is measured ideally and continuously which is not possible in reality. </p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>m_flow_feed: input for the feed mass flow rate </p>
<p>massComposition: input for the mass fractions of the feed </p>
<p>m_flow_steam: output for the steam mass flow rate (positive sign) </p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>The steam mass flow rate is calculated under consideration of the steam that will be consumed by decomposing C2H6, C3H8 and C4H10 in the prereformer and the desired steam to methane molar ratio. </p>
<h4><span style=\"color:#008000\">7. Remarks for Usage</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Carsten Bode (c.bode@tuhh.de) on Tue Apr 05 2016<br> </p>
</html>"));
end ControllerH2OForReformer;