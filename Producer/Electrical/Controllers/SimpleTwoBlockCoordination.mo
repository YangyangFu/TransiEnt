within TransiEnt.Producer.Electrical.Controllers;
model SimpleTwoBlockCoordination "Assigns load to first block until second block is needed to cover load"
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

/// ***** MOST IMPORTANT RULE: BEFORE PUSHING YOUR CHANGES YOUR MODEL SHOULD "CHECK" *****
/// (meaning if you press F8 or click the "check" Button there are no errors)

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Controller;
  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter Modelica.SIunits.Power P_max_Block_1=800e6;
  parameter Modelica.SIunits.Power P_max_Block_2=800e6;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerIn P_set annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_set_Block_1 annotation (Placement(transformation(extent={{100,50},{120,70}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_set_Block_2 annotation (Placement(transformation(extent={{100,-50},{120,-30}})));

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________
  Modelica.SIunits.Power  P_set_sc;

equation
  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________
  P_set_sc=abs(P_set);
  if P_set_sc<=P_max_Block_1 then //if P_set smaller than the nominal power of block 1
    P_set_Block_1=P_set;        //Cover all with Block 1
    P_set_Block_2=0;

  elseif P_max_Block_1<P_set_sc and P_set_sc<(P_max_Block_1+P_max_Block_2) then //if P_set is between both maximum values
    P_set_Block_1=-1*P_max_Block_1;
    P_set_Block_2=-1*(P_set_sc-P_max_Block_1);

  else  //else both blocks produce the maximum possible power
    P_set_Block_1=-1*P_max_Block_1;
    P_set_Block_2=-1*P_max_Block_2;

  end if;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
                Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Assigns&nbsp;load&nbsp;to&nbsp;first&nbsp;block&nbsp;until&nbsp;second&nbsp;block&nbsp;is&nbsp;needed&nbsp;to&nbsp;cover&nbsp;load.</p>
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
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"));
end SimpleTwoBlockCoordination;
