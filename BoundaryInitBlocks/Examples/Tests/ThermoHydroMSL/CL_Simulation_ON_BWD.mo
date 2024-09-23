within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL;
model CL_Simulation_ON_BWD
  extends BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.SteadyState_ON_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SimulationOnDesign));
Modelica.Blocks.Sources.RealExpression hotOffset(y = inBlockHot.u_offdes_calc) annotation (
    Placement(transformation(origin = {-170, 30}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Sources.RealExpression coldOffset(y = inBlockCold.u_offdes_calc) annotation (
    Placement(transformation(origin = {-190, -30}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Math.Add hotAdd annotation (
    Placement(transformation(origin = {-130, 50}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Math.Add coldAdd annotation (
    Placement(transformation(origin = {-150, -50}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Math.Feedback fbLevel annotation (
    Placement(transformation(origin = {180, -34}, extent = {{-420, -46}, {-400, -26}})));
Modelica.Blocks.Math.Feedback fbTemp annotation (
    Placement(transformation(origin = {202, 20}, extent = {{-422, 60}, {-402, 40}})));
Modelica.Blocks.Sources.RealExpression levelRef(y = if time < 100 then 5 else 4.8) annotation (
    Placement(transformation(origin = {-270, -70}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Sources.RealExpression tempRef(y = if time < 10 then 30 + 273.15 else 31 + 273.15) annotation (
    Placement(transformation(origin = {-250, 70}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Continuous.PI PI_temp(T = 123.3806, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 716.0702*1.8, y_start = 0) annotation (
    Placement(transformation(origin = {-172, 70}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Continuous.PI PI_level(T = 52.5210, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 520.2372*1.8, y_start = 0) annotation (
    Placement(transformation(origin = {-190, -70}, extent = {{-10, -10}, {10, 10}})));
equation
connect(hotAdd.y, inBlockHot.u_in) annotation (
    Line(points = {{-118, 50}, {-98, 50}}, color = {0, 0, 127}));
connect(coldAdd.y, inBlockCold.u_in) annotation (
    Line(points = {{-138, -50}, {-118, -50}}, color = {0, 0, 127}));
connect(tempRef.y, fbTemp.u1) annotation (
    Line(points = {{-238, 70}, {-218, 70}}, color = {0, 0, 127}));
connect(levelRef.y, fbLevel.u1) annotation (
    Line(points = {{-258, -70}, {-238, -70}}, color = {0, 0, 127}));
connect(fbLevel.y, PI_level.u) annotation (
    Line(points = {{-220, -70}, {-202, -70}}, color = {0, 0, 127}));
connect(PI_level.y, coldAdd.u2) annotation (
    Line(points = {{-178, -70}, {-172, -70}, {-172, -56}, {-162, -56}}, color = {0, 0, 127}));
connect(coldOffset.y, coldAdd.u1) annotation (
    Line(points = {{-178, -30}, {-172, -30}, {-172, -44}, {-162, -44}}, color = {0, 0, 127}));
connect(hotOffset.y, hotAdd.u2) annotation (
    Line(points = {{-158, 30}, {-152, 30}, {-152, 44}, {-142, 44}}, color = {0, 0, 127}));
connect(PI_temp.y, hotAdd.u1) annotation (
    Line(points = {{-160, 70}, {-150, 70}, {-150, 56}, {-142, 56}}, color = {0, 0, 127}));
connect(fbTemp.y, PI_temp.u) annotation (
    Line(points = {{-200, 70}, {-184, 70}}, color = {0, 0, 127}));
connect(outBlockTemp.y_out, fbTemp.u2) annotation (
    Line(points = {{100, 70}, {120, 70}, {120, 140}, {-210, 140}, {-210, 78}}, color = {0, 0, 127}));
connect(outBlockLevel.y_out, fbLevel.u2) annotation (
    Line(points = {{80, 110}, {160, 110}, {160, -140}, {-230, -140}, {-230, -78}}, color = {0, 0, 127}));
annotation (
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
Diagram(coordinateSystem(extent = {{-280, 140}, {160, -140}})));
end CL_Simulation_ON_BWD;
