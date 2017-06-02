within TransiEnt.Components.Sensors.IdealGas.Base;
model GasSensorBase "Base class for gas sensors"
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

  outer TransiEnt.SimCenter simCenter;

inner parameter TILMedia.GasTypes.BaseGas medium = simCenter.gasModel2 "Medium to be used"
                         annotation(choicesAllMatching, Dialog(group="Fundamental Definitions"));

  TransiEnt.Basics.Interfaces.Gas.IdealGasEnthPortIn inlet(Medium=medium) annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  TransiEnt.Basics.Interfaces.Gas.IdealGasEnthPortOut outlet(Medium=medium) annotation (Placement(transformation(extent={{90,-110},{110,-90}})));
equation
  inlet.p = outlet.p;
  inlet.m_flow + outlet.m_flow = 0;
  inlet.h_outflow=inStream(outlet.h_outflow);
  outlet.h_outflow=inStream(inlet.h_outflow);
  inlet.xi_outflow=inStream(outlet.xi_outflow);
  outlet.xi_outflow=inStream(inlet.xi_outflow);

  annotation (                               Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                  graphics),
                                 Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Base class for ideal gas sensors.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Lisa Andresen (andresen@tuhh.de), Sep 2016</p>
</html>"), Icon(graphics={Text(
          extent={{-40,50},{44,-48}},
          lineColor={0,0,0},
          textString="Hs")}));
end GasSensorBase;
