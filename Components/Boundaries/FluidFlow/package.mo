within TransiEnt.Components.Boundaries;
package FluidFlow "Boundaries for fluid flow, extended from ClaraLib"
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
  extends Basics.Icons.Package;












  annotation (Icon(graphics={
      Polygon(
        origin={13.533,41.938},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        points = {{-80,10},{-60,-10},{-80,-30},{-20,-30},{0,-10},{-20,10},{-80,10}},
          pattern=LinePattern.None,
          lineColor={0,0,0}),
      Polygon(
        origin={13.533,41.938},
        fillColor={95,95,95},
        fillPattern=FillPattern.Solid,
        points = {{-20,10},{0,-10},{-20,-30},{40,-30},{60,-10},{40,10},{-20,10}},
          pattern=LinePattern.None),
      Polygon(
        origin={13.533,41.938},
        lineColor = {255,0,0},
        fillColor = {255,0,0},
        fillPattern = FillPattern.Solid,
        points = {{-40,-90},{-20,-70},{0,-90},{0,-50},{-20,-30},{-40,-50},{-40,-90}})}));
end FluidFlow;
