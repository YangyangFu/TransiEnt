within TransiEnt.Storage.Base;
model ThermalConductance "Thermal stationary loss parameterized in thermodynamic terms"
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
  extends TransiEnt.Storage.Base.LinearStationaryLoss(final a=alpha*(T_ref_min - T_amb), final b=alpha*(T_ref_max - T_ref_min)/params.E_max);

  parameter Modelica.SIunits.ThermalConductance alpha = 62.5/45 "Loss coefficient in W/K";
  parameter SI.Temperature T_ref_max "Average storage temperature at which storage is considered full";
  parameter SI.Temperature T_ref_min "Average storage temperature at which storage is considered empty";
  parameter SI.Temperature T_amb=273.15+25 "Ambient temperature determining stationary loss";

  // ---- Diagnostic variables ---
  SI.Temperature T_mean;
  SI.HeatFlowRate Q_flow_loss;
equation
  T_mean = T_ref_min + E_is/params.E_max * (T_ref_max-T_ref_min);
  Q_flow_loss=alpha * (T_mean - T_amb);

  annotation (Icon(graphics={
      Polygon(
        origin={-50,56.333},
        fillPattern=FillPattern.Solid,
        points={{0.0,21.667},{-10.0,-8.333},{10.0,-8.333}}),
      Polygon(
        origin={0,56.333},
        fillPattern=FillPattern.Solid,
        points={{0.0,21.667},{-10.0,-8.333},{10.0,-8.333}}),
      Polygon(
        origin={50,56.333},
        fillPattern=FillPattern.Solid,
        points={{0.0,21.667},{-10.0,-8.333},{10.0,-8.333}}),
      Line(
        origin={52.5,19.667},
        points={{-2.5,-91.6667},{17.5,-71.6667},{-22.5,-51.6667},{17.5,-31.6667},
            {-22.5,-11.667},{17.5,8.3333},{-2.5,28.3333},{-2.5,48.3333}},
        smooth=Smooth.Bezier),
      Line(
        origin={2.5,19.667},
        points={{-2.5,-91.6667},{17.5,-71.6667},{-22.5,-51.6667},{17.5,-31.6667},
            {-22.5,-11.667},{17.5,8.3333},{-2.5,28.3333},{-2.5,48.3333}},
        smooth=Smooth.Bezier),
      Line(
        origin={-47.5,19.667},
        points={{-2.5,-91.6667},{17.5,-71.6667},{-22.5,-51.6667},{17.5,-31.6667},
            {-22.5,-11.667},{17.5,8.3333},{-2.5,28.3333},{-2.5,48.3333}},
        smooth=Smooth.Bezier)}), Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>Thermal&nbsp;stationary&nbsp;loss&nbsp;parameterized&nbsp;in&nbsp;thermodynamic&nbsp;terms.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
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
end ThermalConductance;