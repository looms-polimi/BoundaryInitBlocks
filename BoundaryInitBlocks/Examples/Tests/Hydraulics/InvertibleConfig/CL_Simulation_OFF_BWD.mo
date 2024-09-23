within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model CL_Simulation_OFF_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.CL_Simulation_ON_FWD(
    initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOffDesign),

    outputBlock(y_offdes=0.3, initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),

    PI(y_start=inputBlock.u_offdes_calc),
    step(offset=outputBlock.y_offdes_calc),
    inputBlock(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward));

equation

annotation (
    experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.6),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end CL_Simulation_OFF_BWD;
