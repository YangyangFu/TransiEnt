within TransiEnt.Examples;
package Hamburg "Example of an energy system model based on the city of Hamburg"
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
  extends TransiEnt.Basics.Icons.Package;






































annotation (Icon(graphics={                          Bitmap(
          extent={{-70,-48},{68,74}},
          imageSource="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",
          fileName="modelica://TransiEnt/Images/Hamburg.jpg")}));
end Hamburg;
