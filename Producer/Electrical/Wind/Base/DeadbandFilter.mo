within TransiEnt.Producer.Electrical.Wind.Base;
model DeadbandFilter
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

  extends TransiEnt.Basics.Icons.Block;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=0.0025)
    annotation (Placement(transformation(extent={{-28,58},{-8,78}})));
  Modelica.Blocks.Logical.Switch deadband
    annotation (Placement(transformation(extent={{62,-12},{82,8}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=0.2)
    annotation (Placement(transformation(extent={{-32,-14},{-12,6}})));
  Modelica.Blocks.Logical.And and1
    annotation (Placement(transformation(extent={{6,-6},{26,14}})));
  Modelica.Blocks.Interfaces.RealInput delta_f annotation (Placement(
        transformation(rotation=0, extent={{-114,58},{-94,78}}), iconTransformation(extent={{-114,58},{-94,78}})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          rotation=0, extent={{92,-12},{112,8}}), iconTransformation(extent={{92,-12},{112,8}})));
  Modelica.Blocks.Interfaces.RealInput P_pu annotation (Placement(
        transformation(
        rotation=90,
        extent={{-10,-10},{10,10}},
        origin={-74,-102}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-74,-102})));
  Modelica.Blocks.Sources.Constant no_inertia1(
                                              k=0)
    annotation (Placement(transformation(extent={{10,-30},{24,-16}})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(
        transformation(
        rotation=270,
        extent={{-10,-10},{10,10}},
        origin={48,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,96})));

  Modelica.Blocks.Math.Abs                 greaterThreshold2
    annotation (Placement(transformation(extent={{-60,-14},{-40,6}})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________
  connect(greaterThreshold.y,and1. u1) annotation (Line(points={{-7,68},{0,68},{0,4},{4,4}},
                          color={255,0,255}));
  connect(greaterThreshold1.y,and1. u2) annotation (Line(points={{-11,-4},{4,-4}},
                          color={255,0,255}));
  connect(and1.y,deadband. u2) annotation (Line(points={{27,4},{38,4},{38,4},{38,-2},{60,-2}},
                    color={255,0,255}));
  connect(y, deadband.y) annotation (Line(points={{102,-2},{84,-2},{83,-2}},
                color={0,0,127}));
  connect(no_inertia1.y, deadband.u3) annotation (Line(points={{24.7,-23},{24.7,-22},{42,-22},{42,-10},{60,-10}},
                                            color={0,0,127}));
  connect(u, deadband.u1)
    annotation (Line(points={{48,100},{48,6},{60,6}}, color={0,0,127}));
  connect(delta_f, greaterThreshold.u) annotation (Line(points={{-104,68},{-84,68},{-30,68}},
                                      color={0,0,127}));
  connect(P_pu, greaterThreshold2.u) annotation (Line(points={{-74,-102},{-74,-102},{-74,-38},{-74,-20},{-74,-20},{-74,-4},{-62,-4}},
                                                                                                                            color={0,0,127}));
  connect(greaterThreshold2.y, greaterThreshold1.u) annotation (Line(points={{-39,-4},{-34,-4}},          color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=false)), Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
                Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Deadband filter for synthetic inertia control</p>
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
<h4><span style=\"color: #008000\">7. Remarsk for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Pascal Dubucq (dubucq@tuhh.de) <span style=\"font-family: MS Shell Dlg 2;\">on 01.10.2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Quality check (Code conventions) by Rebekka Denninger on 01.10.2016</span></p>
</html>"));
end DeadbandFilter;
