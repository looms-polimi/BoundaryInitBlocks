within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model OL_Simulation_ON_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.OL_Simulation_ON_FWD(
      outputBlock(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),
      inputBlock(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward));
equation

annotation (
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end OL_Simulation_ON_BWD;
