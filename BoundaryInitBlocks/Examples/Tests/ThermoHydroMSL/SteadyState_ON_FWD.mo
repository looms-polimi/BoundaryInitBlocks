within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL;
model SteadyState_ON_FWD
  extends BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.BaseTest.BaseTest;
Blocks.InputBlock inBlockHot(u_des = 1011)  annotation (
    Placement(transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}})));
Blocks.InputBlock inBlockCold(u_des = 1011)  annotation (
    Placement(transformation(origin = {-110, -50}, extent = {{-10, -10}, {10, 10}})));
Blocks.OutputBlock outBlockLevel(y_des = 5)  annotation (
    Placement(transformation(origin = {70, 110}, extent = {{-10, -10}, {10, 10}})));
Blocks.OutputBlock outBlockTemp(y_des = 30 + 273.15)  annotation (
    Placement(transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}})));
inner Blocks.InitBlockOptions initBlockOptions annotation (
    Placement(transformation(origin = {40, -100}, extent = {{-20, -20}, {20, 20}})));
equation
connect(inBlockCold.u_out, pumpCold.N_in) annotation (
    Line(points = {{-100, -50}, {-60, -50}, {-60, -60}}, color = {0, 0, 127}));
connect(inBlockHot.u_out, pumpHot.N_in) annotation (
    Line(points = {{-80, 50}, {-60, 50}, {-60, 20}}, color = {0, 0, 127}));
connect(openTank.levelOutput, outBlockLevel.y_in) annotation (
    Line(points = {{40, 74}, {50, 74}, {50, 110}, {62, 110}}, color = {0, 0, 127}));
connect(openTank.temperatureOutput, outBlockTemp.y_in) annotation (
    Line(points = {{40, 56}, {60, 56}, {60, 70}, {82, 70}}, color = {0, 0, 127}));
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SteadyState_ON_FWD;
