within TransiEnt.Producer.Electrical.Conventional;
model Oil "Preconfigured mineral oil plant"
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

  extends TransiEnt.Producer.Electrical.Conventional.Components.NonlinearThreeStatePlant(
    final typeOfResource=TransiEnt.Basics.Types.TypeOfResource.Conventional,
    t_startup=3600,
    isPrimaryControlActive=true,
    P_el_n=
          simCenter.generationPark.P_el_n_OIL,
    H =  simCenter.generationPark.H_gen_ST,
    eta_total=simCenter.generationPark.eta_el_n_OIL,
    final typeOfPrimaryEnergyCarrier=TransiEnt.Basics.Types.TypeOfPrimaryEnergyCarrier.Oil,
    P_el_grad_max_SB=simCenter.generationPark.P_grad_max_star_OIL,
    P_min_star=simCenter.generationPark.P_min_star_OIL,
    P_grad_max_star=simCenter.generationPark.P_grad_max_star_OIL,
    isSecondaryControlActive=false,
    redeclare model ProducerCosts = TransiEnt.Components.Statistics.ConfigurationData.PowerProducerCostSpecs.GasCCGT);

annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                               graphics={
    Text( lineColor={255,255,0},
        extent={{-44,-82},{16,-22}},
          textString="NLTI"),
        Rectangle(
          extent={{-88,34},{-58,-6}},
          lineColor={135,135,135},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={135,135,135}),
        Text(
          extent={{-84,24},{-60,6}},
          lineColor={255,255,255},
          fillPattern=FillPattern.VerticalCylinder,
          fillColor={135,135,135},
          textString="OIL")}),   Diagram(coordinateSystem(preserveAspectRatio=false,
                   extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Gasturbine model with startup time and setpoint limits. </span></p>
<p>Preconfigured&nbsp;mineral&nbsp;oil&nbsp;plant.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">* TODO: Reaction to setpoints should be modeled by a first order system</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end Oil;