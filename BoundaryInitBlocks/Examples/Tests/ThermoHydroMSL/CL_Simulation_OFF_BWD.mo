within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL;
model CL_Simulation_OFF_BWD
  extends BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.CL_Simulation_ON_BWD(
    initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOffDesign),

    outBlockTemp(y_offdes=27 + 273.15),
    outBlockLevel(y_offdes=4.5),
    tempRef(y=if time < 10 then 27 + 273.15 else 29 + 273.15),
    levelRef(y=if time < 100 then 4.5 else 5));

equation

annotation (
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
Diagram(coordinateSystem(extent = {{-280, 140}, {160, -140}})));
end CL_Simulation_OFF_BWD;
