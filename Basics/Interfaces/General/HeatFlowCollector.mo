within TransiEnt.Basics.Interfaces.General;
connector HeatFlowCollector "Collector for active power flow diagnostics"

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

  flow SI.HeatFlowRate Q_flow;

  annotation (Icon(graphics={                           Ellipse(
          extent={{80,80},{-80,-80}},
          lineColor={0,0,0},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>Base model in transient for power flows that are transmitted purely for statistical purposes. Use <a href=\"TransiEnt.Base.Interfaces.General.MechanicalPowerPort\">MechanicalPowerPort</a> or <a href=\"TransiEnt.Base.Interfaces.Electrical.ElectricPowerPort\">ElectricPowerPort</a> for physical modeling of power flows across boundaries. The</p>
<p>purpose of this model is to send information in a causal sense from a model component to <a href=\"TransiEnt.ModelStatistics\">ModelStatistics</a>. Example: A PowerPlant model may use this to provide statistics about provided balancing power, which can then be read by the user in the <a href=\"TransiEnt.ModelStatistics\">ModelStatistics</a> component of the global simulation model.</p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>This model is not prepared for acausal use. The flow of information is always from the physical model to the <a href=\"TransiEnt.ModelStatistics\">ModelStatistics</a> block that simply adds up the occurences of a specific power flow quantity.</p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color:#008000\">7. Remarsk for Usage</span></h4>
<p>Example: A PowerPlant model may use this to provide statistics about provided balancing power, which can then be read by the user in the <a href=\"TransiEnt.ModelStatistics\">ModelStatistics</a> component of the global simulation model.</p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no validation or testing necessary, automatically set to state 4)</p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tu-harburg.de) on Wed Apr 2 19:19:12 2014</p>
</html>"));
end HeatFlowCollector;