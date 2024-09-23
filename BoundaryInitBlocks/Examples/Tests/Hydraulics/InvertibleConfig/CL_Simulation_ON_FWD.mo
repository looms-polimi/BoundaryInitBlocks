within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model CL_Simulation_ON_FWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.SteadyState_ON_FWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOnDesign));
  Modelica.Blocks.Continuous.PI PI(initType = Modelica.Blocks.Types.Init.InitialOutput, T = 170, y_start = inputBlock.u_des_calc, k = 10)  annotation (
    Placement(transformation(origin = {-190, 30}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(origin = {-230, 30}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Modelica.Blocks.Sources.Step step(height = 0.2, offset = outputBlock.y_des_calc, startTime = 10)  annotation (
    Placement(transformation(origin = {-270, 30}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(PI.y, inputBlock.u_in) annotation (
    Line(points = {{-178, 30}, {-158, 30}}, color = {0, 0, 127}));
  connect(feedback.y, PI.u) annotation (
    Line(points = {{-220, 30}, {-202, 30}}, color = {0, 0, 127}));
  connect(outputBlock.y_out, feedback.u2) annotation (
    Line(points = {{80, 50}, {92, 50}, {92, 66}, {-230, 66}, {-230, 38}}, color = {0, 0, 127}));
  connect(step.y, feedback.u1) annotation (
    Line(points = {{-258, 30}, {-238, 30}}, color = {0, 0, 127}));
annotation (
    Diagram(coordinateSystem(extent = {{-280, 80}, {100, -100}})),
  experiment(StartTime = 0, StopTime = 300, Tolerance = 1e-06, Interval = 0.6),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end CL_Simulation_ON_FWD;
