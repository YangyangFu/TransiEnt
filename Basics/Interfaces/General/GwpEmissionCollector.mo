within TransiEnt.Basics.Interfaces.General;
connector GwpEmissionCollector "Collector for gwp emissions (in metric mass of CO2 equivalents)"

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

  flow TransiEnt.Basics.Units.MassFlowOfCDE m_flow_cde;

  annotation (Icon(graphics={                           Ellipse(
          extent={{80,80},{-80,-80}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<h4><span style=\"color:#008000\">1. Purpose of model</span></h4>
<p>Interface for components emiting exhaust gas with global warming potential. The provided flow variable contains the mass of exhaus gas in carbon dioxid equivalent units. </p>
<h4><span style=\"color:#008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color:#008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color:#008000\">7. Remarsk for Usage</span></h4>
<p>Models of components emiting gwp exhaust gases would use this interface to define the amount of CO2 equivalent mass they are causing. The Block <a href=\"TransiEnt.ModelStatistics\">ModelStatistics</a> is then be able to sum up the equivalent masses emited by all components present in the global model where it can be read by the user.</p>
<h4><span style=\"color:#008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color:#008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color:#008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tu-harburg.de) on Wed Apr 2 19:19:12 2014</p>
</html>"));
end GwpEmissionCollector;