within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model OL_Simulation_ON_FWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.SteadyState_ON_FWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOnDesign));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = 0.5, offset = inputBlock.u_des_calc, startTime = 10)  annotation (
    Placement(transformation(origin = {-190, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ramp.y, inputBlock.u_in) annotation (
    Line(points = {{-178, 30}, {-158, 30}}, color = {0, 0, 127}));

annotation (
    experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-06, Interval = 2),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end OL_Simulation_ON_FWD;
