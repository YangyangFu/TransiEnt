within TransiEnt.Components.Sensors.RealGas;
model CompositionSensor "One Port VLE Composition Sensor"

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

  parameter Integer compositionDefinedBy=1 "Output gives mass or mole fraction"  annotation(Dialog(group="Fundamental Definitions"),choices(choice = 1 "mass", choice = 2 "mole", __Dymola_radioButtons=true));

  Modelica.Blocks.Interfaces.RealOutput fraction[medium.nc](
    final quantity="MassFraction",
    final unit="kg/kg") "Fraction (mass or mole) in port"
    annotation (Placement(transformation(extent={{44,60},{64,80}},  rotation=
           0), iconTransformation(extent={{100,-10},{120,10}})));

protected
  TILMedia.VLEFluid_ph fluid(
    vleFluidType=medium,
    p = gasPortIn.p,
    h = actualStream(gasPortIn.h_outflow),
    xi = actualStream(gasPortIn.xi_outflow),
    computeSurfaceTension=false,
    deactivateTwoPhaseRegion=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation
if compositionDefinedBy == 1 then
  fraction[1:medium.nc-1] = {fluid.xi[i] for i in 1:medium.nc-1};
  fraction[medium.nc] = 1-sum(fluid.xi[i] for i in 1:medium.nc-1);
else
  fraction[1:medium.nc-1] = {fluid.x[i] for i in 1:medium.nc-1};
  fraction[medium.nc] = 1-sum(fluid.x[i] for i in 1:medium.nc-1);
end if;
 annotation (Diagram(graphics), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                     graphics={
       Polygon(
         points={{-20,40},{-20,40},{-62,40},{-86,0},{-62,-40},{-20,-40},{20,-40},{62,-40},{86,0},{62,40},{20,40},{-20,40}},
         lineColor={27,36,42},
         smooth=Smooth.Bezier,
         lineThickness=0.5),
       Text(
         extent={{-100,40},{100,0}},
         lineColor={27,36,42},
         fillColor={0,255,0},
         fillPattern=FillPattern.Solid,
          textString=""),
       Line(
         points={{80,0},{100,0}},
         color={27,36,42},
         smooth=Smooth.None),
       Text(
         extent={{-100,24},{100,-16}},
         lineColor={27,36,42},
         fillColor={0,255,0},
         fillPattern=FillPattern.Solid,
         textString="%name"),
       Line(
         points={{0,-40},{0,-100}},
         color={27,36,42},
         thickness=0.5,
         smooth=Smooth.None),
        Text(
          extent={{-100,60},{100,90}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor=DynamicSelect({230, 230, 230},  if fraction[end] > 0 then {0,131,169} else {167,25,48}),
          textString=DynamicSelect(" fraction[end] ", realString(fraction[end]*100, 1,2)+" %%")),
       Line(
         points={{-98,-100},{96,-100}},
         color={255,255,0},
         thickness=0.5)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Composition sensor for VLEFluidTypes.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>-</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Can only be used for VLEFluidTypes.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>GasPortIn, GasPortOut and RealOutput for the nc fraction of the medium. Mass or mole fractions can be displayed.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">-</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">-</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no validation or testing necessary)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">-</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Lisa Andresen (andresen@tuhh.de) in Jun 2015</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Adapted by Carsten Bode (c.bode@tuhh.de) in Nov 2016</span></p>
</html>"));
end CompositionSensor;
