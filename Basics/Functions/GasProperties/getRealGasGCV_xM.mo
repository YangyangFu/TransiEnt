within TransiEnt.Basics.Functions.GasProperties;
function getRealGasGCV_xM "Adaptive function for gross calorific value calculation for real gases from molar GCVs, input x and M"

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

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Basics.Icons.Function;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  parameter Real[realGasType.nc] GCVm_vec=getRealGasGCVmVector(                                         realGasType,realGasType.nc);

  // _____________________________________________
  //
  //             Variable Declarations
  // _____________________________________________

public
  input TILMedia.VLEFluidTypes.BaseVLEFluid realGasType "Real gas type" annotation(choicesAllMatching=true);
  input SI.MoleFraction[:] x_in "Mole fractions";
  input SI.MolarMass M_in "Molar mass";
  input SI.SpecificEnthalpy GCVIn "Set this to a specific value for a constant GCV or to zero for GCV calculation";
  output SI.SpecificEnthalpy GCVOut "Returned GCV";

protected
  SI.MoleFraction[realGasType.nc] x=cat(1,x_in,{1-sum(x_in)}) "Molar composition of components";
  Real GCVm(unit="kJ/mol") "Molar gross calorific value";

algorithm
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  //If GCVIn has a value except 0 (no variable GCV calculation) set GCVout = GCVin
  if GCVIn <> 0 then
    GCVOut:=GCVIn;
  else
    //Search for component in GCVComponentValues and add it to total GCV weighted by mole fraction
    GCVm:=sum(x*GCVm_vec);
    //Convert molar (kJ/mol) to specific (J/kg) GCV (ideal gas)
    GCVOut :=GCVm/M_in*1000;
  end if;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model is used to calculate the gross calorific value (GCV), also known as higher heating value (HHV) of a fuel gas mixture based on mole fractions and molar mass and respective molar calorific values from a record.</p>
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
<p>If there are components in the gas which don&apos;t have a corresponding entry in the GCVm values record, they will just be ignored, giving a faulty calorific value. The function will throw a warning.</p>
<p>GCVIn was added to give the possibility to define a constant calorific value. If this value is set to 0, the GCV will be calculated by the composition of the defined medium.</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Lisa Andresen (andresen@tuhh.de), Sep 2016</p>
</html>"));
end getRealGasGCV_xM;
