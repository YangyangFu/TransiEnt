within TransiEnt.Producer.Combined.SmallScaleCHP.Controller;
model ControllerExtQ_flow "CHP controller that sets plant to a given heat flow rate"

//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 1.1.0                             //
//                                                                                //
// Licensed by Hamburg University of Technology under Modelica License 2.         //
// Copyright 2018, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE and ResiliEntEE are research projects supported by the German     //
// Federal Ministry of Economics and Energy (FKZ 03ET4003 and 03ET4048).          //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Institute of Electrical Power Systems and Automation                           //
// (Hamburg University of Technology)                                             //
// and is supported by                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________
  import TransiEnt;
  extends TransiEnt.Basics.Icons.Controller;

  extends TransiEnt.Producer.Combined.SmallScaleCHP.Base.PartialCHPController;
  // _____________________________________________
  //
  //                   Parameters
  // _____________________________________________
  parameter Boolean useQ_flow_in=true "Use input or constant";
  parameter Modelica.SIunits.HeatFlowRate Q_flow_const=400e3 "Fixed input"
    annotation (Dialog(enable=useQ_flow_in));
  // _____________________________________________
  //
  //                    Variables
  // _____________________________________________
  Boolean onCondition(start=true);
  Boolean offCondition;
  // _____________________________________________
  //
  //                    Complex Components
  // _____________________________________________
  Modelica.Blocks.Continuous.LimPID PID(
    Ti=1,
    Td=0,
    k=100,
    yMin=Specification.P_el_min,
    yMax=Specification.P_el_max,
    strict=true)
    annotation (Placement(transformation(extent={{-12,0},{8,20}})));
  // _____________________________________________
  //
  //                    Interfaces
  // _____________________________________________
  Modelica.Blocks.Interfaces.RealInput Q_flow_set if useQ_flow_in
    annotation (Placement(transformation(extent={{-110,0},{-90,20}})));
equation
  onCondition = P_el_set >= Specification.P_el_min and (time - stopTime >= t_OnOff);
  // PDU: I dont understand this condition
  // offCondition = P_el_set <= Specification.P_el_min or T_return > T_return_max;
  offCondition = P_el_set <= Specification.P_el_min;

  if ((pre(switch) == true) and offCondition) then
    switch = false;
    //Power on if off and OnCondition is met:
  elseif ((pre(switch) == false) and onCondition) then
    switch = true;
    //else: keep running
  else
    switch = pre(switch);
  end if;

  if not useQ_flow_in then
    PID.u_s=Q_flow_const;
  end if;

  connect(P_el_set, PID.y) annotation (Line(
      points={{80,10},{9,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(PID.u_m, Q_flow_meas) annotation (Line(
      points={{-2,-2},{-2,-60},{80,-60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q_flow_set, PID.u_s) annotation (Line(
      points={{-100,10},{-14,10}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics),
          Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Model for external thermal power control of CHP.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Arne Koeppen (arne.koeppen@tuhh.de), Jun 2013</p>
<p>Revised by Lisa Andresen (andresen@tuhh.de), Aug 2013</p>
</html>"));
end ControllerExtQ_flow;
