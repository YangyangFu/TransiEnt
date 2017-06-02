within TransiEnt.Components.Sensors.RealGas;
model MassFlowSensor "Two port real gas mass flow sensor"

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

  extends TransiEnt.Components.Sensors.RealGas.Base.RealGas_SensorBase;
  outer TransiEnt.SimCenter simCenter;

  parameter Integer xiNumber=1 "xi vector entry for auxiliary mass flow";

  Modelica.Blocks.Interfaces.RealOutput m_flow(
    final quantity="MassFlowRate",
    displayUnit="kg/s",
    final unit="kg/s") "Mass flow rate"          annotation (Placement(
        transformation(extent={{100,-10},{120,10}},
                                                 rotation=0),
        iconTransformation(extent={{100,-10},{120,10}})));

  Modelica.Blocks.Interfaces.RealOutput m_flow_aux(
    displayUnit="kg/s",
    final unit="kg/s",
    final quantity="MassFlowRate") "Auxiliary mass flow rate" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
equation
  assert(xiNumber<=medium.nc, "xiNumber is out of range!");

  m_flow = gasPortIn.m_flow;

  if xiNumber==medium.nc then
    m_flow_aux = m_flow*(1.0 - sum(actualStream(gasPortIn.xi_outflow)));
  else
    m_flow_aux = m_flow*actualStream(gasPortIn.xi_outflow[xiNumber]);
  end if;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})),  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                      graphics={
        Text(
          extent={{-100,24},{100,-16}},
          lineColor={27,36,42},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid,
          textString="%name"),
        Text(
          extent={{-100,40},{100,0}},
          lineColor={27,36,42},
          fillColor={0,255,0},
          fillPattern=FillPattern.Solid,
          textString=""),
        Line(
          points={{0,-40},{0,-100}},
          color={27,36,42},
          thickness=0.5,
          smooth=Smooth.None),
        Text(
          extent={{-100,76},{100,106}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor=DynamicSelect({230, 230, 230},  if m_flow > 0 then {0,131,169} else {167,25,48}),
          textString=DynamicSelect(" m_flow ", realString(m_flow, 1,1)+" kg/s")),
        Text(
          extent={{-100,44},{100,74}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor=DynamicSelect({230, 230, 230},  if m_flow_aux > 0 then {0,131,169} else {167,25,48}),
          textString=DynamicSelect(" m_flow_aux"+"["+ realString(xiNumber) +"] ", realString(m_flow_aux, 1,3)+" kg/s")),
        Line(
          points={{80,0},{100,0}},
          color={27,36,42},
          smooth=Smooth.None),
        Line(
          points={{-98,-100},{96,-100}},
          color={255,255,0},
          thickness=0.5),
        Polygon(
          points={{-20,40},{-20,40},{-62,40},{-86,0},{-62,-40},{-20,-40},{20,-40},{62,-40},{86,0},{62,40},{20,40},{-20,40}},
          lineColor={27,36,42},
          smooth=Smooth.Bezier,
          lineThickness=0.5),
        Line(
          points={{-100,0},{-80,0}},
          color={27,36,42},
          smooth=Smooth.None)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Mass flow sensor for VLEFluidTypes.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>-</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Can only be used for VLEFluidTypes.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>GasPortIn, GasPortOut and RealOutput for temperature.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">-</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">-</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarsk for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no validation or testing necessary)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Copied and changed from ClaRa.Components.Sensors.vleMassflowSensor.</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Adapted to be used with RealGasPorts and real gas media.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Lisa Andresen (andresen@tuhh.de) in Jun 2015</span></p>
</html>"));
end MassFlowSensor;
