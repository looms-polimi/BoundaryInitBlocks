within BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig;
model SteadyState_OFF_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig.SteadyState_ON_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SteadyStateOffDesign),
      outputBlock(y_offdes=0.3));
equation

annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SteadyState_OFF_BWD;
