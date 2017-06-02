within TransiEnt.Consumer.DemandSideManagement.FridgePoolControl.Check;
model TestPoolResponsePrequalification
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
  extends TransiEnt.Basics.Icons.Checkmodel;
Modelica.Blocks.Sources.CombiTimeTable f_grid(
    tableName="default",
    fileName="D:/Uni/TUHH/MASTER/Projektarbeit/04 Simulation/Frequenzverlaeufe/f_Referenzstoerfall.txt",
    tableOnFile=false,
    startTime=0,
    table=[0,50; 7200,50; 7202.2,50; 7204.4,50; 7206.6,50; 7208.8,50; 7210,50; 7210,50; 7211,49.904; 7213.2,49.72; 7215.4,49.57; 7217.6,49.451; 7219.8,49.359; 7222,49.293; 7224.2,49.248; 7226.4,49.224; 7228.6,49.218; 7230.8,49.229; 7233,49.253; 7235.2,49.291; 7237.4,49.339; 7239.6,49.399; 7241.8,49.462; 7244,49.518; 7246.2,49.569; 7248.4,49.614; 7250.6,49.655; 7252.8,49.691; 7255,49.723; 7257.2,49.752; 7259.4,49.778; 7261.6,49.801; 7263.8,49.815; 7266,49.819; 7268.2,49.82; 7270.4,49.82; 7272.6,49.82; 7274.8,49.82; 7277,49.82; 7279.2,49.82; 7281.4,49.82; 7283.6,49.82; 7285.8,49.82; 7288,49.82; 7290.2,49.82; 7292.4,49.82; 7294.6,49.82; 7296.8,49.82; 7299,49.82; 7301.2,49.82; 7303.4,49.82; 7305.6,49.82; 7307.8,49.82; 7310,49.82; 7310,49.82]) annotation (Placement(transformation(extent={{2,40},{22,60}})));
  TransiEnt.Components.Boundaries.Electrical.Frequency electricGrid(useInputConnector=true) annotation (Placement(transformation(extent={{36,-10},{56,10}})));
  Pool.FridgePool fridgePool(
    dbf=0.4,
    poolSize=500,
    uniqueParams=[287.85,278.22,1.4426,278.03,3249,1970.6,0.60693,10.004,1.3412; 301.37,278.88,1.4263,278.98,3031.7,1901.2,0.51744,9.2955,1.6345; 297.64,278.9,1.0176,278.41,2850.7,1720.8,0.48789,10.54,1.4642; 294.35,278.94,1.8308,278.91,2660.9,2273.5,0.44365,9.9565,1.7742; 295.42,278.42,2.0691,277.79,2430.1,1772.8,0.54895,11.756,1.7246; 292.78,279.61,1.7927,279.36,3256.9,1931.8,0.47827,10.586,1.6803; 296.97,278.65,1.7441,278.42,2860.3,1634.8,0.47362,10.589,1.6151; 292.28,278.98,1.7355,279.05,3141.7,1755.3,0.50971,10.383,1.5513; 292.89,278.87,1.9283,279.38,3328.1,1668.1,0.49515,9.8699,1.5182; 293.63,279.81,1.2439,280.29,2477.6,1746.4,0.5058,10.292,1.65; 288.77,279.27,1.4367,278.59,2675.4,1643.5,0.49035,9.5852,1.554; 295.34,278.66,1.8795,278.83,2816.1,2122.5,0.5213,9.277,1.2874; 291.95,279.56,2.346,278.43,2697.3,2103.2,0.52011,10.93,1.4529; 291.66,279.52,1.2668,278.94,2550.6,1836.5,0.54708,11.171,1.5783; 296.09,278.4,1.8227,278.19,2921.5,2261.4,0.56619,10.403,1.4417; 297.45,278.81,1.8404,
        279.14,2756,1533.8,0.49245,9.5806,1.7738; 298.1,279.21,1.7498,279.24,2716.9,1908.8,0.43609,11.732,1.5717; 292.89,279.9,1.6618,280.63,2906.4,1947.3,0.5497,9.6962,1.789; 298.94,279.77,1.593,280.5,2982,2034.9,0.45584,9.7978,1.5431; 293.98,278.84,1.802,279.41,2640.1,1926.9,0.59386,10.771,1.6377; 295.35,279.74,1.7504,279.58,2857.9,1711.6,0.60178,10.866,1.6344; 290.71,278.94,1.8204,278.18,2640.8,1920.9,0.49524,11.197,1.7578; 301.86,278.4,1.4345,277.68,2830.1,2299.2,0.41904,9.9709,1.6319; 301.99,279.45,1.255,279.5,3023.5,1761.6,0.52438,10.924,1.8589; 292.5,279.48,1.3591,279.63,2864.4,1831.9,0.53581,9.1335,1.2222; 297.03,279.03,1.5092,279.58,2748.6,1612.5,0.52884,11.109,1.7682; 287.32,279.68,1.7285,279.43,2398.6,1849.6,0.50661,9.8073,2.0239; 295.28,278.53,1.4248,279.02,2920,2038.9,0.54072,8.394,1.7321; 297.5,278.97,1.6666,278.89,2772,2271.5,0.48336,10.553,1.6857; 294.87,279.73,2.007,280.24,2958,1625.7,0.50017,11.331,1.6548; 294.51,279.21,1.6121,279.75,3177.9,2032.1,0.51965,10.874,1.7894;
        291.74,279.62,1.8403,279.6,2979.2,1991.7,0.47791,10.706,1.7143; 293.13,279.63,1.6419,279.74,2604.8,1918.1,0.51043,9.5703,1.8368; 293.06,278.02,2.0718,277.49,2631.4,1957.1,0.42865,8.3261,1.8874; 295.17,279.74,1.2597,280.27,2962.1,1956.3,0.43256,10.819,1.4344; 303.31,279.61,2.2747,279.54,2675.3,2023.3,0.51559,9.5582,1.7838; 291.17,278.67,1.7749,278.93,2914.9,1454.7,0.47205,10.607,1.5085; 288.88,278.62,1.5533,279.29,2618.8,1725.2,0.43685,9.7427,1.674; 296.98,278.82,1.47,278.6,3038,1777.1,0.45721,8.7509,1.6086; 294.25,279.48,1.6853,279.23,2758.9,2065.2,0.49664,10.791,1.738; 299.47,278.49,1.4226,278.86,2759,1645.8,0.5336,9.8763,2.0367; 296.6,278.68,1.8669,278,2281.7,1814.6,0.4724,9.1434,1.7339; 291.74,279.74,1.5444,279.83,2774.9,1857.4,0.44616,11.307,1.4829; 290.52,278.46,1.6904,278.25,2933.8,2365.9,0.45882,9.2126,1.6517; 296.82,277.47,1.4806,277.4,2870.4,2030.6,0.48419,11.157,1.4127; 297.6,277.94,1.7375,277.88,2969.9,1803.7,0.47978,9.2065,1.6016; 292.67,278.99,1.7733,278.42,3502.4,
        1776.9,0.48538,8.5374,1.556; 296.18,279.53,1.5994,279.29,2379,1829.6,0.52631,10.567,2.0374; 297.32,279.01,2.0278,279.69,2717.2,1693.1,0.47429,12.534,1.6083; 292.01,278.88,1.0782,278.36,3435.3,1955,0.52377,10.48,1.7479; 293.59,279.13,2.0161,279.44,3107.7,1968.8,0.47121,10.335,1.8612; 296.91,277.76,2.3372,278.89,3201.5,1762,0.419,9.8249,1.5345; 295.94,278.89,1.7185,278.49,3009.2,2111.2,0.51616,10.518,1.6148; 292.02,278.73,1.8211,279.03,3121.9,2095.2,0.40152,10.043,1.3499; 296.54,280.13,1.6971,279.45,2806,1806.7,0.52384,9.3721,1.4884; 297.52,279.43,1.3468,279.8,3177.7,1726.9,0.55668,9.705,1.7701; 297.06,279.35,1.8326,278.45,2414.5,2099.3,0.43932,9.0907,1.8046; 290.68,279.64,1.5607,279.81,3019.6,1821.8,0.47267,10.419,1.6143; 293.43,279.17,2.5258,278.61,3219.7,1826.5,0.61434,9.5878,1.5409; 294.49,279.29,1.3749,279.16,3062.3,2264.6,0.5409,10.456,1.7122; 296.77,279.58,1.8717,280.49,2973.6,1891.4,0.48262,9.4577,1.7083; 296.62,278.44,1.3613,278.94,3156.3,1895.1,0.50155,10.752,1.6471; 294.47,
        279.4,1.5081,280.06,2885.1,1679.6,0.44204,11.123,1.826; 294.76,279.43,1.7165,279.09,2802.6,1816.3,0.46331,11.134,1.5226; 295.26,278.59,1.5392,278.43,3220.9,1479,0.48745,12.49,1.6447; 296.15,279.56,1.2408,279.63,2258.9,1427.4,0.57532,11.873,1.698; 296.61,278.82,2.0169,278.06,2803.9,1710.2,0.41233,9.8161,2.1121; 290.12,279.51,1.9941,279.03,3215.1,1683.1,0.41922,8.713,1.9004; 290.74,278.95,1.5456,279.49,2736.6,1785.7,0.47485,9.8778,1.6798; 296.01,277.97,1.8466,277.38,2934.5,2075.4,0.5406,9.9566,1.6052; 294.73,279.43,1.6806,280.18,3209.9,1746.6,0.6125,9.8992,1.477; 299.39,279.48,1.7122,280.13,3180.2,2068.5,0.45302,9.1817,1.7385; 295.05,279.21,1.5376,279.52,2874.5,1734,0.55738,9.3244,1.5207; 291.66,279.31,1.5853,279.19,2120.3,2016.7,0.53956,9.6047,1.6459; 294.97,278.66,1.7174,278.87,2989,1515.7,0.60992,9.6852,1.1575; 292.86,279.17,1.7524,279.95,2905.4,1951.2,0.42995,9.2909,1.8152; 291.9,279.49,2.2472,279.37,2458.9,1765.1,0.42609,10.855,1.6631; 288.66,279.23,1.9431,280.18,3163.2,1760.4,
        0.49762,8.3817,1.7086; 295.93,279.22,1.9544,279.88,2682.1,1598.7,0.5105,11.974,1.6336; 295.04,278.09,1.295,278.07,3308.6,2171.2,0.45291,9.2208,1.9251; 295.17,278.5,2.3165,279.46,2673.8,1943.9,0.48648,9.9879,1.657; 292.01,280.31,1.387,279.89,3168.6,1967.8,0.54756,9.3101,1.7772; 294.31,278.27,1.6296,278.25,2584.9,2058.3,0.42401,10.242,1.7095; 291.85,278.41,1.5671,278.57,3263.5,1848.2,0.482,10.454,1.7195; 294.3,278.89,1.8409,279,2847.5,1681.7,0.4937,9.2499,1.7384; 297.55,279.58,2.0569,280.34,2908.5,2087.8,0.51898,8.5234,1.5606; 291.3,278.56,1.7616,278.99,2350.6,1855.6,0.48883,10.011,1.8843; 295.52,278.94,1.3899,278.7,3022.6,1868.9,0.51492,10.097,1.2787; 296.47,278.62,1.8398,277.78,3050.1,2155.4,0.39464,10.457,1.7347; 300.73,279.12,1.7305,278.87,2918.7,1707.9,0.48062,11.437,1.6269; 289.21,278.99,2.2049,279.57,2971.3,1854.2,0.47382,8.8963,1.7446; 298.71,278.44,1.8623,279.31,3215.3,1816.8,0.50307,8.9401,1.7042; 298.86,278.54,1.7165,279,3245.6,1581.6,0.53578,9.4783,1.6145; 292.48,280.04,
        1.6655,279.68,2960.7,2092.7,0.3911,12.228,1.3451; 299.52,279.19,2.0584,278.9,3508.5,1925.6,0.44156,9.3514,1.6147; 294.69,278.81,1.9318,279.27,2680.7,1793.9,0.53662,10.146,1.652; 291.78,278.93,1.7339,278.45,2872.4,1784.9,0.5816,8.9268,1.4304; 292.42,278.82,1.3049,279.35,3316.6,2004.9,0.54096,10.591,1.62; 294.21,279.19,1.3915,278.52,3005.9,2222.4,0.59411,11.122,1.6952; 301.59,279.06,1.6611,279.52,3002.9,1534.7,0.52491,11.176,1.8445; 290.15,279.27,1.6655,279.48,2794.5,2042.9,0.57167,10.52,1.6624; 291.95,278.4,1.9256,278.35,2521.4,2110,0.43651,9.6118,1.6649; 292.31,279.41,2.1145,278.36,3345.2,2061.3,0.52826,10.589,1.5981; 298.48,278.63,1.8873,277.83,2420.8,2147.7,0.48975,9.5186,2.0207; 293.38,279.37,1.8999,279.29,3111.6,2337.9,0.40617,8.0069,1.4558; 292.35,279.98,1.6253,280.13,3246.1,1717.2,0.46702,10.75,1.8559; 293.39,279.46,2.0149,279.29,2912.5,2018.7,0.50569,10.458,1.5866; 288.44,279.22,2.0722,279.64,2321.5,1943.9,0.4749,9.5425,1.7389; 295.41,278.84,1.9498,279.22,2651.8,1812.6,0.45304,
        9.1983,1.7037; 291.7,278.83,1.8706,279.05,3100.5,1903.5,0.55416,8.4436,1.7095; 294.22,279.4,1.8886,279.23,2657,2138.2,0.5917,8.6795,1.5512; 294.62,280.36,1.2894,280.19,3255.7,1843.7,0.51817,11.285,1.8513; 288.09,278.99,1.8702,278.08,3144,2227.5,0.46914,9.7697,1.5223; 295.01,278.8,1.5803,279.53,2792.6,2002.3,0.44248,9.729,1.5201; 293.89,278.6,1.5604,278.04,2649,1935.8,0.41374,10.163,1.7411; 295.07,277.62,1.9973,277.06,2967.1,1865.7,0.48047,10.887,1.453; 295.16,279.64,1.6425,279.33,2905.6,1936.4,0.4121,9.963,1.8227; 291.61,278.51,2.0552,279.31,2911.3,1797.3,0.42173,9.7102,1.462; 297.5,279.59,2.1309,278.76,3249.4,2250.9,0.53717,9.3036,1.6321; 291.31,279.29,2.0394,278.59,3045.2,1824.3,0.49728,10.727,1.5089; 293.31,278.74,1.4316,278.1,3374.3,1805.5,0.57358,9.2387,1.6851; 297.28,279.53,2.3954,280.26,2482.1,2203.4,0.445,10.797,1.4642; 295.45,279.69,1.9456,280.31,2582.2,1679.3,0.49082,9.8763,1.6391; 292.1,278.87,1.6748,278.62,3217.7,1788.6,0.48154,10.285,2.1136; 293.48,278.79,1.8934,279.73,
        2473.4,1960.6,0.48523,10.646,1.5748; 299.3,278.75,1.598,278.39,2654.4,1533.1,0.51184,10.508,1.5718; 295.01,278.42,1.7097,278.39,2629.3,1911.3,0.49044,10.335,2.2619; 290.34,279.56,1.7389,280.06,2972.4,1921,0.51982,11.906,1.7962; 296.73,279.57,1.7547,278.97,2865.1,1742.2,0.54378,11.595,1.4688; 291.09,279.84,1.0609,280.23,3223,1971.7,0.53873,10.427,1.2299; 295.17,278.8,1.3404,279.16,3173.3,1801.4,0.49633,10.461,1.6108; 293.31,278.77,1.8804,278.76,3080.4,1771.7,0.49801,9.4981,1.8806; 293.47,277.63,1.374,277.76,2625.1,1909.4,0.50025,9.1869,1.6851; 294.82,278.7,1.8981,277.87,2690,1866.9,0.48573,9.7094,1.6794; 294.27,279.06,1.6291,278.59,2799.1,2142.7,0.63245,10.231,1.8021; 299.5,278.3,2.0466,277.62,2587.8,1709.8,0.5332,10.515,1.5903; 287.77,279.97,1.8345,279.14,2485.9,1816.1,0.56212,11.142,1.8204; 293.37,279.6,1.8407,279.68,2588.2,1296.1,0.52363,9.5991,1.7192; 291.9,279.67,2.1859,280.65,2644.7,1963.2,0.43396,9.6127,1.8102; 289.63,278.79,1.8545,278.4,3052.8,1753.6,0.45702,8.7999,1.7628;
        292.05,279.06,1.7902,279.02,2999.2,1886.6,0.45705,10.184,1.5127; 292.31,279.11,1.9494,278.63,2725.1,2126.7,0.48866,10.863,1.6658; 293.3,278.88,1.6356,278.59,2601.5,2019.1,0.526,10.637,1.5897; 295.96,278.32,2.1581,278.56,2876,1745.6,0.56856,8.1526,1.3318; 290.92,279.32,1.0672,279.57,2833.5,1894.4,0.4953,8.9361,2.0279; 293.97,279.23,0.91322,279.67,2628.4,2043.7,0.5299,8.7762,1.7967; 292.58,279.3,1.9961,278.35,2773.8,1773.7,0.54893,10.455,1.6691; 296.39,279.81,2.0177,280.63,3160.3,2032,0.57391,10.011,1.5756; 299.59,279.22,1.6677,279.61,2748,2342.1,0.51993,11.513,1.5751; 290.78,278.86,1.517,278.36,3358.5,1560.9,0.43582,8.2515,1.716; 293.96,279.01,1.4692,279.66,3169.7,2268.8,0.48528,9.5188,1.5501; 297.42,280.91,1.2669,280.58,3094,1862.5,0.55026,11.064,1.5735; 289.83,279.34,1.8772,280.15,2962,1715.5,0.47802,9.9821,1.8352; 300.28,278.62,1.8223,278.33,2451.3,1421.9,0.5826,9.9718,1.616; 295.3,279.78,1.5041,279.4,2636.5,1937.3,0.57228,9.9237,1.3981; 295.96,279.42,1.8417,279.63,2899.3,1992.6,
        0.46058,12.251,1.6701; 293.27,280.18,1.4603,280.8,3169.5,2015,0.6194,9.71,1.5828; 295.31,279.33,1.5137,279.53,3064.6,2003.3,0.4622,10.564,1.7946; 294.95,278.93,1.7946,279.79,3052.4,1700.3,0.57528,9.5846,1.7604; 293.04,279.16,1.6522,279.65,2717,1930,0.58571,11.514,1.459; 294.8,279.78,1.6123,279.75,2590.7,1864.7,0.42374,9.6083,1.9385; 300.29,278.6,2.0326,278.77,2967.6,1970.1,0.48059,8.8419,1.7778; 298,279.28,1.6715,279.79,2704.6,1919.8,0.51099,11.269,1.4363; 297.98,279.72,1.6784,279.53,2664.5,2023.1,0.49555,9.5937,1.7343; 293.28,278.68,2.1679,279.03,2722.6,1953.6,0.44738,9.9587,1.6026; 291.42,278.88,1.6838,279.07,3231.2,1920.9,0.52662,9.1571,1.8563; 297.46,278.5,1.1553,278.56,3139.2,1788,0.45971,9.5893,1.5599; 294.03,279.16,2.1124,278.53,2910.3,1945.1,0.5298,8.7609,1.3901; 293.54,280.08,1.1991,280.11,2889.9,1408.7,0.56942,9.4493,1.8975; 295.29,278.59,1.6432,278.73,3062.7,1692.8,0.53493,9.5182,1.4857; 296.51,280.95,1.7049,280.49,2957.6,1919.8,0.43882,10.586,1.6505; 293.43,278.84,1.7004,
        279.69,2630.8,2004,0.51027,9.8825,1.5971; 294.24,279.25,1.8133,278.91,2647.8,1666.2,0.61504,10.348,1.6838; 291.18,278.18,1.946,277.6,2810.5,1876.3,0.45318,10.946,1.2115; 297.43,278.53,1.2001,278.25,3328,1691.7,0.56003,8.7094,1.3641; 299.89,278.49,2.0177,279.13,2888.2,1955.3,0.46149,9.9581,1.7827; 294.22,278.85,1.3874,279.38,3031.9,1812.8,0.50423,11.135,1.7167; 291.31,277.86,1.5251,278.07,2809.6,1706.5,0.54857,8.5977,1.6849; 294.03,279.9,1.8798,280.68,3174.5,1656.2,0.50002,10.505,1.3999; 295.44,279.95,1.6788,280.06,2998,2280.7,0.48689,12.045,1.7971; 296.79,279.28,1.2498,279.36,2969.2,2013.1,0.50036,11.005,1.3213; 289.94,279.53,2.24,280.06,2516,2170.5,0.50343,9.9006,1.5524; 294.16,278,2.0931,277.19,3059.8,2081.4,0.55828,9.4664,1.6912; 288.39,278.58,1.5333,278.35,2728.4,1683.3,0.48105,10.209,1.7117; 293.58,279.34,2.0022,279.31,3268.9,2205.7,0.52339,10.291,1.6539; 298.58,279.39,1.4337,278.84,2922.4,1869.7,0.51148,9.217,1.7003; 290.97,279.94,1.6076,280.32,2913.4,2102.5,0.4693,11.705,
        1.8669; 294.15,279.7,1.7198,279.77,2708.6,1454.9,0.46305,10.814,1.4445; 293.62,278.9,1.4892,278.35,3080.7,1710.8,0.4392,9.8561,1.5063; 293.95,279.49,2.3616,278.45,2668.1,1829,0.50257,10.001,1.8474; 294.36,278.51,1.6658,277.85,3331.1,1837.9,0.53709,8.0959,1.7116; 297.41,279.26,1.6758,278.54,3328.5,2151.6,0.49513,11.685,1.5003; 290,278.77,1.5603,278.55,3492.7,1906.2,0.41609,8.9847,1.693; 291.51,279.53,1.5039,279.44,2596.7,1787.3,0.42788,11.663,1.4016; 296.94,278.89,2.0235,278.55,2883,1864.7,0.41794,8.3672,1.8255; 291.74,279.24,1.7451,278.63,2524.9,2010.5,0.46205,10.634,1.78; 292.57,279.37,1.3934,279.89,3133.9,1882.7,0.51501,9.9596,1.556; 292.79,278.91,1.5193,279.03,2772.6,2007,0.48331,10.683,1.7402; 293.72,278.05,1.5974,278.84,2770.8,1852,0.41135,9.8518,1.9672; 300.15,279.64,1.5275,279.28,2880.3,1636,0.47451,9.2174,1.6586; 290.4,278.47,2.1448,277.89,3076.5,2243.2,0.50542,10.567,1.7446; 288.35,279.76,2.1177,279.77,2733.9,2250.7,0.56702,11.212,1.8011; 300.3,279.25,1.5707,279.16,2561.9,
        2101.5,0.56288,11.566,1.843; 296.74,278.65,0.92163,278.73,3304.9,1999.8,0.42584,9.2586,1.9756; 291.64,278.96,1.6738,279.52,3533.4,1915.9,0.47901,8.2222,1.881; 296.4,278.52,1.4532,278.38,3199.6,1993.4,0.46307,9.884,1.9953; 284.38,278.42,1.7975,278.96,2817.3,1557.4,0.54488,11.791,1.8127; 297.4,279.44,1.3314,279.15,2750.3,2016.7,0.56316,10.561,1.7612; 300.3,278.93,1.3792,278.43,2869.5,2154.8,0.49491,9.9835,1.6041; 297.17,278.33,1.9886,278.8,2426.4,1892.7,0.46594,10.201,1.8029; 298.83,278.92,1.9343,278.07,3057.4,2291.7,0.48227,9.2695,1.3293; 299.83,279.26,1.8826,279.64,2413.8,1839.3,0.49839,9.2284,1.8373; 292.05,279.22,1.3546,279.35,2951.5,2086.3,0.52791,10.644,1.3439; 290.07,279.04,1.7804,278.21,3188.3,1557.4,0.51756,10.017,1.5344; 294.9,278.99,1.7101,279.72,2902.4,2016.2,0.42968,12.46,1.6671; 300.33,278.53,1.1795,279.09,3123.7,2283.5,0.43172,10.645,1.5006; 295.46,279.98,2.0618,280,2753.9,1535.7,0.51432,11.614,1.3466; 293.09,279.44,2.1474,278.67,3200.8,2204,0.48492,11.307,1.82; 294.79,
        279.65,1.4119,279.18,3169.2,1786.2,0.4211,9.3233,1.9072; 295.33,278.68,1.6067,278.06,3362.7,1904.5,0.54432,10.333,1.4333; 292.12,278.4,1.8117,278.32,2728.5,1788.6,0.4838,9.5979,1.8237; 294.16,278.69,1.6557,278.75,2679.9,1768.6,0.55914,11.757,2.1085; 297.18,279.01,1.241,279.41,2903.3,2016.7,0.47507,9.0129,1.9252; 292.98,278.5,1.8971,279.15,2947.6,1943.9,0.51743,10.173,1.4966; 293.27,279.85,2.0415,279.45,2298.2,1794.9,0.5185,8.8786,1.8416; 290.67,279.5,1.7342,280.13,2608.4,1581.9,0.51295,8.6907,1.9254; 298.25,278.15,2.2728,278.16,3283.6,1917.6,0.56936,9.8443,1.7518; 296.48,278.25,1.3439,278.34,2876.5,1789,0.51195,10.637,1.6399; 288.31,277.37,1.4254,276.85,2971.8,2068.8,0.48026,9.6983,1.324; 298.3,279.05,1.5005,279.69,3004.7,1443,0.50565,9.5079,1.5073; 290.94,278.55,1.9992,277.56,2947.8,1933.5,0.55173,11.773,1.676; 297.79,279.31,2.2992,278.62,3546.7,2017.9,0.49039,10.842,1.3592; 295.69,279.41,1.699,278.85,2799.1,2190.3,0.49301,8.8864,1.8235; 298.09,280.19,1.8652,281.07,3245.9,1852.7,
        0.50457,10.53,1.7869; 291.28,279.13,1.646,279.32,2518.7,1827.1,0.44301,9.675,1.6776; 294.77,279.43,1.2735,279.41,3313.4,1804.6,0.44217,9.8374,1.7243; 293.34,279.15,1.6168,279.22,2450.7,1707.9,0.46048,11.495,1.7619; 294.19,278.93,2.4817,279.42,2702.3,1862.6,0.55971,7.5629,1.4657; 291,278.7,1.8941,277.99,3264.9,1872.4,0.54884,10.365,1.8301; 294.59,278.36,1.569,278.14,2851.5,1788,0.44608,11.981,1.944; 297.74,280.04,2.1146,279.58,3180.3,1956.1,0.46469,9.1998,1.5145; 294.12,278.95,1.8302,279.65,2683.7,1959.3,0.44431,10.754,1.8201; 296.97,279.14,1.9691,278.47,3217,1880.5,0.45429,9.3725,1.6282; 294.14,279.81,1.1886,279.7,2944.3,1837.7,0.52264,10.88,1.6276; 293.86,278.4,1.4814,278.7,2794,1993.3,0.54254,8.3875,1.6124; 294.62,278.7,1.6709,278.52,3140.6,2007.8,0.55808,8.5824,1.5696; 294.3,280.21,2.19,280.94,2742,2142.2,0.54135,9.1221,1.6607; 296.42,278.98,1.7281,279.59,2957.1,2119.9,0.52689,11.089,1.4404; 294.49,279.2,1.4984,279.5,2719.2,2025.6,0.52036,11.122,1.5812; 294.65,278.84,1.6637,
        278.53,2981.5,1918.9,0.54852,9.3408,1.6889; 295.19,279.23,1.4731,279.74,2973.5,1488.4,0.40551,8.5669,1.9647; 295.12,279.07,1.7962,279.73,3031.4,1873,0.5879,10.71,1.6; 294.5,279.67,1.7298,279.23,2735.6,2142.5,0.49572,11.447,1.5052; 298.11,279.58,1.8517,280.4,2674.8,1388.8,0.5477,8.8314,1.5627; 294.92,279.25,1.4243,278.57,2931.7,1643.6,0.55858,9.8385,1.3657; 299.57,279.56,2.097,278.8,2949.5,1555.7,0.63596,10.636,1.5452; 295.67,278.08,1.2836,277.64,2792.4,2028.6,0.43914,9.7515,1.5444; 294.88,278.59,1.6043,277.79,2875.9,1881.6,0.43209,9.6908,1.7485; 298.4,280.18,1.4651,280.18,3071.9,1552.8,0.40772,11.095,1.8002; 293.68,279.74,1.9648,280.48,3014.4,1917.7,0.52539,10.541,1.6252; 288.6,279.68,1.6106,279.33,3190.9,2050.1,0.56615,8.2656,1.9669; 301.3,279.79,1.6203,279.42,3275.7,2148.8,0.57104,9.4421,1.1706; 300.58,279.62,2.0389,279.57,2715.7,2213.2,0.45238,12.183,1.3729; 301,279.78,1.5779,279.14,2410,1969.9,0.56101,9.3578,1.7328; 295.71,279.57,1.8495,279.91,2460.2,2268,0.5189,10.994,1.8414;
        290.41,278.87,1.5253,279.45,2675.6,1913.2,0.46197,10.336,1.821; 291.79,280.13,1.4603,280.75,3020.8,1705,0.51036,10.226,1.9516; 289.27,279.82,1.6825,280.6,2532.8,1918.6,0.48391,9.1199,1.83; 288.33,279.94,1.9873,280.67,3059.4,2033.6,0.51763,10.931,1.5199; 297.32,280.09,1.6241,280.73,2717.3,1941.3,0.5224,9.3741,1.3736; 291.81,279.04,1.5812,279.02,3276.4,1823.8,0.46638,12.48,1.6744; 297.93,279.13,1.8789,278.63,2617.8,1935.8,0.48858,9.2067,1.7506; 292.92,279.06,1.746,278.84,3131.6,1897.1,0.47144,10.118,1.6515; 296.39,277.92,1.2134,277.53,2744.2,1771.7,0.52047,9.4641,1.3121; 297.84,280.23,1.8865,279.92,3035,2195.7,0.41415,10.161,1.7047; 295.49,279.58,1.6552,279.62,2718.4,2049.4,0.53126,10.48,1.9349; 297.57,280.26,2.0245,280.84,3113.9,2195.5,0.57883,8.5785,1.2772; 296.15,279.18,1.4894,279.33,2720.8,1987.4,0.54599,10.022,1.5353; 290.33,280.14,1.9284,279.3,3224.8,1637.3,0.45665,10.265,1.9027; 297.7,279.48,1.34,279.72,3341,2327.2,0.50768,9.0712,1.3517; 296.26,278.59,2.1717,277.61,2442.6,
        1708.4,0.51878,11.044,1.7844; 294.02,279.31,1.0664,279.05,3038.9,2152,0.51173,10.598,1.5824; 294.08,279.78,1.5681,280.55,3054.9,1886.2,0.47876,11.016,1.7282; 297.9,279.81,1.8259,280.37,2819.9,1971.9,0.44567,10.595,2.0092; 293.63,278.96,2.0794,278.44,2467.5,2005.2,0.47427,9.8805,1.8198; 291,280.45,1.9378,280.27,3171.3,1698.3,0.51904,8.464,1.6539; 298.7,279.31,1.8756,278.7,2263.6,1527.4,0.50777,9.8116,1.7565; 291.12,278.6,2.0504,279.03,2851.4,1675.3,0.4675,8.7745,1.6132; 298.03,279.89,1.6037,280.48,3359.5,1448.5,0.58439,10.201,1.6681; 294.96,279.04,1.6715,278.78,2993.9,2021.9,0.49376,9.4979,1.6951; 296.74,278.58,1.825,278.21,2889.9,1799.6,0.44155,9.9635,1.5868; 299.3,278.93,1.2845,278.57,2745.1,1939,0.43697,10.054,1.6698; 300.74,279.95,0.94927,280.35,2654.7,1551.6,0.47551,12.239,1.8623; 293.23,278.59,2.1197,278.29,2946.5,1591.3,0.47679,9.3743,1.7956; 294.95,279.08,1.6388,279.07,3250.8,2041.8,0.56953,11.107,1.593; 295.56,279.24,1.831,278.74,3659.9,1633.1,0.52602,9.6398,1.4417; 292.39,
        279.79,1.19,280.02,2823.4,1919.9,0.59865,8.7453,1.5917; 293.4,279.65,2.0328,280.27,3112.9,1642.8,0.58231,11.156,1.4999; 292.32,279.18,1.2168,279.25,2863.2,2046,0.48801,8.2726,1.5253; 294.18,278.57,1.84,278.12,3045.9,1955.8,0.50101,10.512,1.9525; 292.52,279.29,2.1526,278.71,3157.2,2335.3,0.41389,8.9843,1.6937; 300.86,278.95,2.1047,278.45,2484.3,2276.5,0.57464,10.252,1.3151; 290.06,279.79,1.618,279.98,3066.9,2090.7,0.47744,12.328,1.3483; 294.27,279.62,1.9902,278.8,2724.8,1938.1,0.49953,12.103,1.8247; 293.24,278.46,1.6808,278.14,3027.1,2232.7,0.50497,10.604,1.7216; 294.35,279.25,1.5519,278.9,3079.5,1924,0.51757,10.587,1.7771; 292.82,278.9,1.4959,278.86,2429.8,1892.8,0.47771,9.7084,1.9761; 298.24,278.94,1.0863,278.47,2631.3,1991.6,0.55093,9.6206,1.5886; 297.27,278.48,1.244,278.83,2635.6,2014.1,0.53132,10.874,1.6335; 295.48,278.15,1.7527,277.76,2973.9,1692.4,0.58928,9.0551,1.5187; 294.36,279.13,1.244,279.67,2947.8,1772.3,0.49863,9.8284,1.4448; 301.71,278.71,1.5105,279.33,3079.8,2150.2,
        0.50312,12.267,1.5021; 292.25,278.77,1.9804,278.92,3061.3,2129.7,0.55066,10.083,1.7573; 295.12,279.94,1.7673,280.78,3330.5,2042.9,0.49104,9.5505,1.848; 294.01,279.52,1.5988,279.14,2884.9,1736.6,0.49015,7.917,1.5842; 293.3,280.05,1.815,279.82,2911.3,1713.2,0.49147,9.7602,1.4165; 293.63,279.12,1.1008,279.43,2855,1623.5,0.55216,9.604,1.8062; 292.54,280.05,1.765,280.89,2993,2082.6,0.50185,9.5808,1.3081; 295.24,279.5,1.7352,279.77,2598.5,1715.8,0.53127,9.5306,1.5566; 293.98,279.12,1.1762,278.64,2702.3,2054.6,0.45514,10.023,1.4248; 292.61,278.46,2.0902,279.05,3023.4,2025.5,0.52539,11.265,1.5411; 298.14,279.57,1.2296,279.61,2869.5,1939.3,0.4854,8.9045,1.6343; 297.38,278.93,1.9295,279.4,2517.7,1949.9,0.56474,10.135,1.9865; 300.88,278.55,1.5957,279.33,3290.3,2310.9,0.51471,10.003,1.8365; 295.25,279.64,1.542,279.14,2884.2,1879,0.50733,8.825,1.5993; 293.68,279.24,1.5317,278.64,2746.4,1662.1,0.53536,11.629,1.6806; 288.93,279.79,1.5643,279.87,2649.7,1661.8,0.6127,11.495,1.413; 291.66,278.7,
        1.3656,278.3,2924.8,2209.1,0.57654,10.749,1.6418; 295.11,279.45,1.4423,279.58,2868.8,1980.1,0.52275,9.7157,1.7031; 291.57,279.28,1.4808,279.83,2904,1846.4,0.50873,8.9052,1.5461; 301.02,278.03,1.9129,278.31,2907,1986,0.53193,10.559,1.6167; 293.75,279.41,1.3235,279.45,2735.8,1575.8,0.5239,10.641,1.8094; 300.14,278.59,1.7133,278.11,2618.2,1662.4,0.48161,10.056,1.4265; 291.69,279.38,1.7856,279.02,2730.3,1569.1,0.50188,8.5999,1.8858; 300.44,279.94,1.2662,279.77,2506.6,2100.3,0.48815,11.702,2.0087; 298.15,278.7,2.1587,279.41,2384.5,1992.2,0.39829,8.5621,1.5674; 293.27,279.9,1.1129,280.26,2833.9,1783.7,0.55474,10.378,1.7248; 294.88,279.56,1.6952,279.69,2593.1,1774.9,0.42681,9.7145,1.6758; 292.65,278.12,1.2623,277.5,3376.1,1551.7,0.45185,7.1698,1.6452; 291.65,278.78,1.7094,278.66,2195.5,2061.9,0.55663,10.123,1.4796; 290.64,278.74,1.5739,278.98,3330.5,2037,0.54676,9.0706,1.6001; 297.8,278.63,1.5598,277.93,3204.8,1701.7,0.47762,10.969,1.7992; 298.81,279.12,1.458,279.44,2868.7,1986,0.4185,
        10.652,1.8158; 292.76,279.84,1.8051,279.97,2629.4,1631.8,0.42846,8.3251,1.5109; 291.91,279.72,1.5523,279.1,2404.3,1951.5,0.44014,9.5573,1.703; 299.75,278.98,1.5924,279.08,3090.9,2028.6,0.47684,10.165,1.7768; 294.78,278.84,2.0109,278.15,2823,1609.2,0.35364,10.207,1.9227; 293.15,279.8,2.0673,279.7,2781.1,1899.7,0.5375,11.431,1.7706; 296.63,279.08,1.9065,279.51,3301,1412.5,0.47996,9.0178,1.3121; 293.27,279.14,1.6284,278.89,3267.5,1588.7,0.49308,10.038,1.5607; 298.34,279.06,1.8123,278.7,3048.2,2023.2,0.4782,10.148,1.5513; 294.99,279.13,1.4664,278.46,2283.7,1891.2,0.50933,9.114,1.6005; 294.17,278.07,1.5546,278.14,3042.8,1897.4,0.49622,11.137,1.5982; 293.38,279.79,1.3195,279.42,3144.7,1788.5,0.52593,8.6129,1.8639; 291.57,279.03,1.496,279.73,2579,1572,0.60111,10.582,1.6947; 297.89,278.68,1.3978,278.05,2536.4,1974,0.40073,9.1268,2.0288; 300.48,278.82,1.3601,278.85,2974.8,1645.7,0.52677,10.495,1.7563; 294.58,280.33,1.6256,279.52,2357.3,1495.4,0.43184,9.0454,1.6361; 294.54,278.91,2.0819,
        279.48,2930.9,1763.8,0.59635,10.307,1.8249; 290.32,279.31,1.5599,278.77,2590.3,2196.2,0.50052,7.8724,1.5726; 287.37,278.27,2.0388,279.12,3137.4,2112.2,0.43832,8.511,1.5862; 291.91,278.87,1.8423,278.64,2531.6,1603.3,0.46068,9.3418,1.655; 294.23,279.54,1.7131,279.52,3158.4,1808,0.4746,10.173,1.4405; 299.97,279.21,1.6259,279.85,2574,2005,0.42957,10.146,1.6017; 295.8,279.46,1.6954,279.03,3146.5,1884.1,0.57346,9.9596,1.5054; 289.35,278.78,2.7448,279.04,2522.6,1556.4,0.41649,9.1153,1.5339; 293.81,278.92,2.0281,279.56,2410.7,1841.8,0.48822,9.5136,1.5841; 295.65,279.27,1.9105,278.54,2871.6,2067.5,0.41244,8.5025,1.3898; 292.34,279.23,2.0221,279.3,2944.2,1873,0.52427,8.7314,1.5869; 298.17,278.46,1.658,278.99,3217.3,2020.3,0.47589,7.3415,1.6808; 293.55,279.69,2.1644,280,3041.3,1882.2,0.55982,10.181,1.9584; 297,281.12,1.8778,281.27,2806.1,1985.9,0.45197,10.14,1.9305; 300.11,278.78,1.7599,279.09,2669.5,2128.2,0.50527,10.226,1.6331; 295.84,279.6,1.3685,280.24,3016.5,2164.4,0.46828,8.7931,1.6439;
        295.96,277.83,1.4893,277.16,2372.9,1872.8,0.45231,10.32,1.8971; 293.18,279.6,1.6569,280.3,2594.3,1874.3,0.54622,10.362,1.7265; 291.61,279.84,1.5175,279.53,2964,1485.8,0.58639,10.182,1.4722; 292.25,278.98,1.4413,279.11,2821.9,2177.8,0.54905,12.476,1.6111; 296.28,279.33,1.6598,278.83,3166.8,1890.1,0.59152,9.0918,1.6204; 293.98,279.41,2.4553,279.69,3258.2,1961.2,0.51903,9.8056,1.4272; 291.14,280.04,1.673,280.27,2883.6,1784.8,0.5259,8.641,1.6326; 295.49,279.66,2.2689,279.14,3412.5,2110.8,0.51885,11.236,1.9695; 294.09,279.79,1.6263,279.72,2542.7,1998.2,0.47333,11.673,1.8257; 297.12,279.12,1.7211,279.58,2463.8,1934.9,0.54511,8.4279,1.8986; 296.77,278.6,1.6114,279.11,3357.5,1968.3,0.47541,9.8683,1.6955; 298.03,279.09,1.9863,278.35,2401.7,1636.8,0.51568,11.97,1.6832; 297.94,278.87,1.998,278.73,2595.4,2010.3,0.56091,10.185,1.8805; 293.24,279.43,1.7686,280.24,2677.9,1889.3,0.50378,10.056,1.6179; 291.27,280.43,2.3857,280.32,2971.7,2019.5,0.44471,10.616,1.7375; 291.95,279.39,2.3277,278.42,
        2928.5,1796.5,0.47252,10.682,1.5379; 298.14,279.33,1.6355,279.53,3415.5,1898.4,0.43502,8.8925,1.3318; 296.24,279.31,2.0903,279.98,2727.2,2050.1,0.52774,10.262,1.5788; 291.86,278.92,1.9614,279.21,3059,1958.9,0.4463,9.4648,1.713; 298.31,278.09,1.3283,277.62,2967.5,1653.8,0.43175,8.5108,1.8597; 299.42,280.17,1.6642,279.94,2968,2093.7,0.55663,8.8159,1.7043; 290.87,278.83,1.9426,278.79,3192.8,2141,0.41487,10.039,1.4435; 297.1,279.35,2.131,279.48,2819.6,2004.7,0.54252,9.7025,1.8228; 299.52,279.37,1.529,278.88,3176.1,1836.9,0.50923,8.8724,1.6819; 293.41,278.47,1.4128,278.85,3091.3,1547.5,0.49987,10.547,1.5614; 296.3,279.76,1.2351,279.85,2396.5,1436.6,0.44455,9.1777,1.5631; 289.83,279.17,1.5596,279.94,3148.2,2156.1,0.46232,11.163,1.4575; 293.71,278.66,1.4107,279.35,2606.6,2070.4,0.49749,10.877,1.7306; 290.34,279.37,1.6989,280.12,2749,2089,0.56656,9.6444,1.795; 290.06,278.32,1.5642,277.72,3509.5,1500.4,0.44665,10.909,1.7342; 302.19,279.33,1.9597,279.18,2697,1894.8,0.52746,10.232,1.8049;
        293.62,279.27,1.7547,278.77,2691.2,1956.6,0.45502,9.8363,1.6999; 295.44,278.94,1.8808,279.67,3174.4,1963.7,0.5388,10.43,1.6943; 295.52,278.55,1.3483,278.6,2784.8,1772.9,0.49167,9.7368,1.6155; 293.59,279.47,1.5965,278.83,2787.6,1967.6,0.50163,8.6496,1.977; 299.17,279.48,1.6452,279.08,2611.7,1845.3,0.60135,10.865,1.4785; 300.33,279.63,1.4597,280.2,3017.3,1974.4,0.47856,10.361,1.7677; 292.24,279.47,1.6517,279.07,2917.8,1739.9,0.57499,9.3546,1.9052; 294.33,279.22,1.7867,279.85,2589.8,2138.3,0.48417,10.285,1.8263; 296.67,278.86,1.7001,278.41,2738.1,1891.8,0.48294,10.039,1.8621; 290.26,279.32,2.0822,279.78,2618.3,1805.2,0.52015,8.4583,1.6695; 290.37,279,1.486,278.48,2603.5,1541.2,0.42713,7.8395,1.5769; 292.31,278.2,1.6114,277.51,2912.2,1970.1,0.49045,9.7998,1.673; 296.22,279.53,1.665,279.66,3044.6,1880.5,0.49181,7.5247,1.8884; 295.5,279.69,1.9072,279.39,3362.7,1546.3,0.54749,10.202,1.8065; 291.79,279.31,1.8246,280.1,3136.5,1909.9,0.52888,8.5495,1.5834; 290.14,280.67,1.2353,280.11,2911.3,
        1609.8,0.37607,10.304,1.2959; 295.04,277.99,1.3356,278.51,2741,1604.1,0.52909,8.7399,1.7052; 295.08,278.85,1.8107,278.55,2311.9,1924.9,0.50307,8.7749,2.0209; 300.68,279.09,1.8141,279.97,2093.8,1930.1,0.5176,11.286,1.8185; 293.66,278.64,1.84,278.18,2851.6,1665.6,0.46734,9.9657,2.0001; 292.5,280.36,1.6828,279.58,3087.1,1989.4,0.58101,8.8776,1.8192; 292.15,279.01,2.1479,279.81,3363.9,1771.4,0.5087,10.175,1.3939; 299.24,279.64,1.9144,279.84,2840.7,2052,0.54748,9.6084,1.5995; 290.04,280.07,1.0281,280.05,2605.3,1691.7,0.39833,9.546,1.7335; 295.45,278.54,0.91638,278.44,2619.6,1914,0.46186,9.6759,1.5302; 294.16,279.81,1.3905,280.45,2972.7,1625.3,0.52965,7.7551,1.6902; 291.21,279.86,1.9455,278.95,3486.3,1906.4,0.4943,8.3504,1.4494; 292.25,277.88,1.7643,277.66,2861.6,1902.6,0.4984,8.6477,1.7571; 301.07,279.53,1.6345,279.86,2486.3,1922.7,0.46309,10.505,1.9122; 291.65,279.5,1.917,278.95,2453.3,2115,0.48373,9.9027,1.4773; 293.12,278.32,2.2054,278.4,3272.6,2202.1,0.42699,10.323,1.7452; 294.16,
        279.89,1.6722,279.65,2893.1,1949.2,0.55324,9.1808,1.785; 300.87,279.59,2.6314,280.15,2822.9,2110,0.48983,8.3068,1.6706; 291.35,279.4,1.7964,278.52,2772.2,1974.5,0.57624,10.389,1.6377; 293.71,279.01,1.8775,279.27,2946.4,1640,0.54821,11.133,1.5412; 299.52,279.7,1.4358,279.16,2787.3,1736,0.51016,9.8442,1.6502; 293.53,280.42,1.7447,280.9,2659.1,2089.8,0.52729,11.156,1.5511; 296.42,279.65,1.8785,279.72,2905.2,1861.7,0.50592,10.186,1.7459; 294.53,279.14,1.468,279.28,2741.7,1828.4,0.43528,11.231,1.3988; 294.72,279.35,1.6605,278.72,3222.6,2135.2,0.4523,9.2737,1.346; 291.25,278.9,1.981,279.13,3086,1934.3,0.49249,9.3737,2.0606; 287.81,280.13,1.6883,280.11,3252.9,2026.9,0.49394,10.464,1.5815; 296.4,279.56,1.9463,279.32,2785.5,1820.8,0.50317,11.235,1.6602; 298.59,279.31,1.8501,278.41,2794.1,2053.2,0.57948,10.152,1.6353; 296.09,279.7,1.6185,280.28,3042.3,1920.6,0.49861,11.11,1.5026; 294.87,279.01,1.9157,279.76,2623.5,2095,0.51874,9.9428,1.9845; 294.55,279.29,1.4528,279.66,3185.7,1968.3,0.48094,
        8.2406,1.853; 290.58,278.43,1.4457,278.86,3072.1,1870.3,0.50808,8.7343,1.6001; 296.92,278.59,1.305,278.12,2834.8,1814,0.52989,10.685,1.7947; 296.43,278.98,1.5428,278.63,2725.8,1898.7,0.47944,10.764,1.818; 291.12,277.98,1.8287,278.78,2378.3,1685.8,0.46805,9.9851,1.5116; 294.85,279.65,1.4889,280.39,2446.2,1744.8,0.42559,9.7087,1.9556; 295.06,278.91,1.4674,279.57,2655.7,1570,0.45698,10.488,1.7553; 291.27,279.13,1.7646,279.13,3157.5,1983.8,0.46881,9.2457,1.8673; 300.02,279.07,1.5362,279.27,3096.9,1942.3,0.47864,9.9819,1.6898; 289.77,279.47,1.4477,278.77,3046.7,1725.1,0.44375,8.7021,1.787; 287.3,278.8,1.4497,278.61,2671.3,1899.3,0.54921,10.377,1.4097; 288.89,279.42,1.3105,278.78,2888,1893.2,0.50339,8.4699,1.9311; 297.06,279.38,1.8771,279.46,3229.8,1816.8,0.54858,10.358,1.2928; 295.51,280.32,0.99093,280.24,2907.9,1791.2,0.49502,11.406,1.3914; 296.34,278.45,1.6856,278.92,2658.4,1875.5,0.46426,10.722,1.6943; 289.18,280.16,1.7237,280.62,2260.2,2142.1,0.49176,9.3734,1.518; 295.13,278.3,1.9459,
        277.61,3018.4,1891.3,0.57743,9.2173,1.6954; 294.71,278.75,1.8072,278.12,2811.7,1670.7,0.43193,9.6639,1.8395; 298.04,279.2,1.7961,279.27,2744.2,1891.2,0.46945,12.584,1.8313; 294.75,278.02,2.1296,278.15,2231.7,1998.7,0.42188,11.865,1.7596; 295.63,278,1.1988,277.78,2853.1,1868.4,0.52176,10.321,1.8109; 297.93,279.85,1.4176,279.43,2911.7,1814.2,0.5763,10.216,1.8289; 296.97,279.9,1.3793,280.07,3247.5,1636.5,0.48399,10.387,1.8319; 292.39,278.97,1.5392,278.92,3267.7,2005,0.55829,12.021,1.8205; 295.4,278.33,1.3185,278.48,2901.4,1891.3,0.49315,10.364,1.8508; 297.85,279.5,2.0217,278.5,2812.3,2022.3,0.5308,9.6781,1.8007; 296.05,279.71,1.7106,279.68,3069.7,1913.2,0.49702,8.4801,1.8021; 295.61,279.06,1.6988,278.79,2831.5,2029.2,0.44638,11.628,1.7113; 296.89,279.5,1.7942,278.83,3055.9,1913.6,0.55214,9.9429,1.6828; 295.44,280.48,1.5,280.45,3106.8,1784.7,0.4235,10.367,1.693; 294.52,278.72,1.1508,278.64,2618.1,1878.2,0.56185,10.781,1.6436; 293.79,279.33,1.6184,279.62,2906.1,1789.2,0.51614,8.4338,
        2.1045; 300.75,280.97,1.6721,281.24,2993.1,1595.3,0.42659,10.908,2.1456; 293.81,278.7,1.5714,278.13,2731.3,1840.8,0.46627,10.403,1.5568; 293.5,278.93,2.5285,278.23,2309.8,1772.9,0.51974,11.874,1.8194; 291.64,279.57,1.6925,278.95,3095.8,1606.1,0.48979,9.4126,1.5856; 292.83,279.74,1.5508,279.79,2270.1,1970.4,0.44687,9.2865,1.6572; 299.33,280.54,2.2424,279.54,3262,1994.1,0.49031,12.555,1.8128; 293.47,279.02,1.6815,278.61,3057.5,1992.1,0.46658,10.317,1.8115; 297.84,279.12,1.9906,279.01,3511.7,1903.3,0.47965,10.507,1.9152; 291.72,279.13,1.7471,278.61,3170.5,1862.2,0.50305,10.764,1.3573; 293.94,278.97,1.424,279.52,2856.3,1895.7,0.46691,8.8525,1.3499; 291.61,279.74,2.1595,279.9,2605.5,1812.9,0.55434,10.861,1.8983; 294.46,278.94,1.6346,279.12,3138.9,1969.3,0.4072,11.104,1.6455; 292.02,278.94,1.8128,278.99,2421.1,2153.3,0.48188,8.9252,1.7974; 294.04,279.16,1.187,279.33,2906,2037.1,0.46204,10.894,1.9704; 293.32,278.76,2.223,278.3,2829,2005,0.49506,8.383,1.6046; 296.3,279.63,1.8747,279.31,
        2628,2072.3,0.47497,10.335,1.588; 293.69,279.47,2.2528,280.15,3261.5,1956.1,0.54659,10.516,1.6547],
    startStatus={false,true,false,false,false,false,false,false,true,false,true,false,true,false,true,true,true,false,false,true,true,false,false,true,false,false,false,false,false,false,true,false,false,false,false,false,false,false,false,false,false,true,false,true,false,false,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,false,true,false,false,false,true,false,false,false,false,false,false,false,false,true,false,false,true,false,true,false,false,false,false,true,false,false,true,false,true,false,false,false,false,true,false,false,false,false,false,true,false,false,true,false,false,false,false,true,true,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,true,true,true,true,false,false,false,true,true,false,true,false,false,false,false,false,false,false,false,false,false,false,true,true,false,true,true,false,false,false,false,true,true,true,false,false,false,true,false,
        true,false,false,true,false,false,false,false,true,false,false,false,false,false,false,true,false,false,false,false,true,false,true,false,false,false,true,false,false,false,false,true,false,false,true,true,false,true,true,false,false,false,false,false,true,false,false,false,true,false,false,false,false,false,false,false,false,false,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,false,false,false,true,false,false,false,false,true,false,false,false,false,false,false,true,false,false,true,false,true,true,true,false,true,true,false,false,false,false,true,false,false,true,false,false,true,false,true,false,true,false,false,true,false,false,false,false,true,false,false,false,false,false,false,false,true,true,false,true,false,false,false,true,false,false,false,false,true,true,false,false,true,false,true,false,false,false,true,true,false,false,true,false,true,true,false,true,true,true,false,false,
        false,true,true,true,true,false,false,false,true,true,false,true,false,false,true,false,false,false,true,false,true,false,false,true,false,false,true,false,true,false,false,false,true,false,false,false,true,false,false,false,false,false,false,true,false,false,true,false,true,false,false,true,false,false,false,false,false,false,true,true,false,false,false,false,false,true,true,false,false,false,true,false,false,false,false,false,false,true,false,false,false,false,true,false,false,true,false,false,false,true,false,false,false,false,false,true,false,false,true,false,false,false,false,false,true,false,false,false,false,false,true,false,false,true,false,true,false,true,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false,false,false,true,false,false,false,true,false,false,true,false,false,false,false,false,false,false,false,false,false}) annotation (Placement(transformation(extent={{-50,-28},{14,28}})));

  inner SimCenter simCenter annotation (Placement(transformation(extent={{-90,80},{-70,100}})));
equation
  connect(fridgePool.epp, electricGrid.epp) annotation (Line(
      points={{10.48,0},{24,0},{24,-0.1},{35.9,-0.1}},
      color={0,135,135},
      thickness=0.5));
  connect(f_grid.y[1], electricGrid.f_set) annotation (Line(points={{23,50},{40,50},{40,12},{40.6,12}}, color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestPoolResponsePrequalification.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
createPlot(id=1, position={475, 0, 458, 679}, y={"fridgePool.epp.P"}, range={0.0, 8000.0, 6000.0, 20000.0}, grid=true, colors={{28,108,200}},filename=resultFile);
createPlot(id=1, position={475, 0, 458, 337}, y={"electricGrid.epp.f"}, range={0.0, 8000.0, 44.0, 56.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}})));
end TestPoolResponsePrequalification;
