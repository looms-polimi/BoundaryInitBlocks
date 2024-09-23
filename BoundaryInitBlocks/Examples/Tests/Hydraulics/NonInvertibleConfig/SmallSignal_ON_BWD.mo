within BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig;
model SmallSignal_ON_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig.SteadyState_ON_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SmallSignalOnDesign));
Modelica.Blocks.Interfaces.RealInput u annotation (
    Placement(transformation(origin = {-180, 30}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-170, 32}, extent = {{-20, -20}, {20, 20}})));
Modelica.Blocks.Interfaces.RealOutput y annotation (
    Placement(transformation(origin = {100, 50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {96, 52}, extent = {{-10, -10}, {10, 10}})));
equation
connect(u, inputBlock.u_in) annotation (
    Line(points = {{-180, 30}, {-138, 30}}, color = {0, 0, 127}));
connect(outputBlock.y_out, y) annotation (
    Line(points = {{80, 50}, {100, 50}}, color = {0, 0, 127}));
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(l = "1", lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SmallSignal_ON_BWD;
