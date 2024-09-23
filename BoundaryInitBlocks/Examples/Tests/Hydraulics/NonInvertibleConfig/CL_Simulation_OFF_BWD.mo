within BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig;
model CL_Simulation_OFF_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.NonInvertibleConfig.SteadyState_OFF_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOffDesign));
Modelica.Blocks.Math.Gain gain(k = 10)  annotation (
    Placement(transformation(origin = {-210, 30}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Math.Feedback feedback annotation (
    Placement(transformation(origin = {-250, 30}, extent = {{-10, 10}, {10, -10}})));
Modelica.Blocks.Sources.Step step(startTime = 5, offset = outputBlock.y_offdes_calc, height = 0.2)  annotation (
    Placement(transformation(origin = {-290, 30}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Math.Add add annotation (
    Placement(transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Sources.Constant const(k = inputBlock.u_offdes_calc)  annotation (
    Placement(transformation(origin = {-210, -10}, extent = {{-10, -10}, {10, 10}})));
equation
connect(feedback.y, gain.u) annotation (
    Line(points = {{-241, 30}, {-223, 30}}, color = {0, 0, 127}));
connect(outputBlock.y_out, feedback.u2) annotation (
    Line(points = {{80, 50}, {94, 50}, {94, 70}, {-250, 70}, {-250, 38}}, color = {0, 0, 127}));
connect(step.y, feedback.u1) annotation (
    Line(points = {{-279, 30}, {-259, 30}}, color = {0, 0, 127}));
connect(gain.y, add.u1) annotation (
    Line(points = {{-198, 30}, {-190, 30}, {-190, 36}, {-182, 36}}, color = {0, 0, 127}));
connect(add.y, inputBlock.u_in) annotation (
    Line(points = {{-158, 30}, {-138, 30}}, color = {0, 0, 127}));
connect(const.y, add.u2) annotation (
    Line(points = {{-198, -10}, {-190, -10}, {-190, 24}, {-182, 24}}, color = {0, 0, 127}));
annotation (
    Diagram(coordinateSystem(extent = {{-300, 80}, {100, -100}})),
experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.4),
__OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
__OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end CL_Simulation_OFF_BWD;
