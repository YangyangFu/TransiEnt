within TransiEnt.Producer.Combined.LargeScaleCHP.Base.Characteristics;
record PQ_Characteristics_WT "Black coal steam unit based on 'CHP Tiefstack (TS)', Source: Cerbe2002"
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

  extends Generic_PQ_Characteristics(
  final k_Q_flow=1,
  final k_P_el=1,
  PQboundaries=[
0, 203.166e6, 80.656e6;
15.964e6, 205.724e6, 79.121e6;
124.007e6, 193.869e6, 68.734e6;
285.288e6,179.977e6, 174.077e6;
290e6, 179.977e6, 174.077e6],
  PQ_HeatInput_Matrix=[
       0.0e6,         0.0e6,        35.6e6,        71.3e6,       106.9e6,       142.6e6,       178.3e6,       213.9e6,       249.5e6,       285.2e6;
       0.0e6,         0.1e6,        49.8e6,       101.0e6,       152.2e6,       203.4e6,       254.6e6,       305.7e6,       357.6e6,       409.6e6;
      25.7e6,        61.8e6,        75.9e6,       101.0e6,       152.2e6,       203.4e6,       254.6e6,       305.7e6,       357.6e6,       409.6e6;
      51.4e6,       126.0e6,       138.6e6,       152.3e6,       166.9e6,       203.4e6,       254.6e6,       305.7e6,       357.6e6,       409.6e6;
      77.1e6,       191.4e6,       202.3e6,       214.4e6,       227.6e6,       241.9e6,       256.8e6,       305.7e6,       357.6e6,       409.6e6;
     102.9e6,       259.2e6,       268.2e6,       278.6e6,       290.2e6,       302.9e6,       316.7e6,       330.9e6,       357.6e6,       409.6e6;
     128.6e6,       330.2e6,       336.7e6,       344.7e6,       354.2e6,       364.9e6,       376.8e6,       389.8e6,       403.8e6,       417.9e6;
     154.3e6,       399.6e6,       403.7e6,       409.6e6,       417.1e6,       426.2e6,       436.1e6,       447.1e6,       459.1e6,       472.3e6;
     180.0e6,       466.9e6,       468.3e6,       471.8e6,       477.1e6,       484.0e6,       492.4e6,       502.1e6,       513.1e6,       525.1e6;
     205.7e6,       540.7e6,       539.2e6,       540.2e6,       543.3e6,       548.6e6,       555.8e6,       564.6e6,       574.9e6,       586.4e6]);

  annotation (Documentation(info="<html>
<p><span style=\"font-size: 8pt;\">All records (PQ diagrams and Heat input matrixes) included in this package are included with the intention of illustrating the modelling concept.</span></p>
<p><span style=\"font-size: 8pt;\">However, users are encouraged to create their own records based on the plants and scenarios that they want to simulate.</span></p>
</html>"));
end PQ_Characteristics_WT;