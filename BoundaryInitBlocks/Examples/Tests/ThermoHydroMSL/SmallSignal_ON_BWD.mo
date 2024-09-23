within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL;
model SmallSignal_ON_BWD
  extends BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.SteadyState_ON_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SmallSignalOnDesign));
Modelica.Blocks.Interfaces.RealInput u1 annotation (
    Placement(transformation(origin = {-140, 50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-144, 52}, extent = {{-20, -20}, {20, 20}})));
Modelica.Blocks.Interfaces.RealInput u2 annotation (
    Placement(transformation(origin = {-160, -50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-154, -48}, extent = {{-20, -20}, {20, 20}})));
Modelica.Blocks.Interfaces.RealOutput y1 annotation (
    Placement(transformation(origin = {110, 110}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 110}, extent = {{-10, -10}, {10, 10}})));
Modelica.Blocks.Interfaces.RealOutput y2 annotation (
    Placement(transformation(origin = {130, 70}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {130, 68}, extent = {{-10, -10}, {10, 10}})));
equation
connect(u2, inBlockCold.u_in) annotation (
    Line(points = {{-160, -50}, {-118, -50}}, color = {0, 0, 127}));
connect(u1, inBlockHot.u_in) annotation (
    Line(points = {{-140, 50}, {-98, 50}}, color = {0, 0, 127}));
connect(outBlockLevel.y_out, y1) annotation (
    Line(points = {{80, 110}, {110, 110}}, color = {0, 0, 127}));
connect(outBlockTemp.y_out, y2) annotation (
    Line(points = {{98, 70}, {130, 70}}, color = {0, 0, 127}));
annotation (
    Diagram(coordinateSystem(extent = {{-180, 120}, {160, -120}})),
experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
__OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
__OpenModelica_simulationFlags(l = "1", lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SmallSignal_ON_BWD;
