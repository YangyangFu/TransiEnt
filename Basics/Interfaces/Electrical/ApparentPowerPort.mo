within TransiEnt.Basics.Interfaces.Electrical;
connector ApparentPowerPort "Single phase electric connector containing active and reactive power and frequency and voltage for quasistationary ac power models"
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

  extends ActivePowerPort;

  // Potential variables ("technical connection conditions")
  Modelica.SIunits.Voltage v "Voltage of net";

  // Flow variables ("Transmitted information")
  flow Modelica.SIunits.ReactivePower Q "Reactive Power";

  annotation (defaultComponentName="epp",Icon(graphics={Ellipse(
          extent={{80,80},{-80,-80}},
          lineColor={0,127,0},
          lineThickness=0.5,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>Adds nothing but a symbol to the model <a href=\"TransiEnt.Base.Interfaces.Electrical.PartialElectricPowerPort\">TransiEnt.Base.Interfaces.Electrical.PartialElectricPowerPort</a></p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>The connector contains the transmitted reactive and active power, voltage and frequency. The frequency is always assumed to be ideally sinusoidal without harmonic components. Unsymmetric electric grids may be modelled by using three instances of this connector. </p>
<p>An example how to adapt models based on <a href=\"Modelica.Electrical.Analog.Interfaces.Pin\">Modelica.Electrical.Analog.Interfaces.Pin</a> can be found here: <a href=\"TransiEnt.Examples.ElectricGrid.Architecture.AdaptionOfComplexElectricLoad\">AdaptionOfComplexElectricLoad</a></p>
<p>An adaption to simple real values can be realized using an adapter block like <a href=\"TransiEnt.Components.Adapters.PQ_To_EPP\">PQ_To_EPP</a> or a boundary component <a href=\"TransiEnt.Components.Boundaries.Electrical.PrescribedPotentialVariableBoundary\">PrescribedPotentialVariableBoundary</a></p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>f is the frequency of alternating current</p>
<p>v is the voltage </p>
<p>P is the active power</p>
<p>Q is the reactive power</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color:#008000\">7. Remarsk for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no validation or testing necessary, automatically set to state 4)</p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tu-harburg.de) on Mon Dec 16 17:27:01 2013</p>
</html>"));
end ApparentPowerPort;
