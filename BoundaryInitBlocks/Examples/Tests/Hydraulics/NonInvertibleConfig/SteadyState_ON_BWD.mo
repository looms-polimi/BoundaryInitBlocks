within BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig;
model SteadyState_ON_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.BaseTest.NonInvertibleConfiguration;
Blocks.InputBlock inputBlock(initOpt =BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward,
                                                                                                   u_des = 2)  annotation (
    Placement(transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}})));
Blocks.OutputBlock outputBlock(y_des = 0.4, initOpt =BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward)
                                                                                                                   annotation (
    Placement(transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}})));
inner Blocks.InitBlockOptions initBlockOptions annotation (
    Placement(transformation(origin = {-160, -60}, extent = {{-20, -20}, {20, 20}})));
equation
connect(tank.l, outputBlock.y_in) annotation (
    Line(points = {{36, 24}, {50, 24}, {50, 50}, {62, 50}}, color = {0, 0, 127}));
connect(inputBlock.u_out, flowSource.w) annotation (
    Line(points = {{-120, 30}, {-102, 30}}, color = {0, 0, 127}));
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SteadyState_ON_BWD;
