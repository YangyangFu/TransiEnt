within TransiEnt.Components.Electrical;
package Grid
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
  extends TransiEnt.Basics.Icons.Package;









































annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
          {100,100}}), graphics={
      Line(
        points={{-40,68},{-40,-40}},
        color={0,0,0},
        smooth=Smooth.None),
      Line(
        points={{0,68},{0,-40}},
        color={0,0,0},
        smooth=Smooth.None),
      Line(
        points={{42,68},{42,-40}},
        color={0,0,0},
        smooth=Smooth.None),
      Line(
        points={{0,54},{0,-54}},
        color={0,0,0},
        smooth=Smooth.None,
        origin={0,48},
        rotation=90),
      Line(
        points={{0,54},{0,-54}},
        color={0,0,0},
        smooth=Smooth.None,
        origin={0,12},
        rotation=90),
      Line(
        points={{0,54},{0,-54}},
        color={0,0,0},
        smooth=Smooth.None,
        origin={2,-22},
        rotation=90)}));
end Grid;