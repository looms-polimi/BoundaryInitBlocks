within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL;
model SteadyState_ON_BWD
  extends BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.SteadyState_ON_FWD(
    outBlockTemp(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),

    outBlockLevel(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),

    inBlockCold(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),

    inBlockHot(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward));

equation

annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SteadyState_ON_BWD;
