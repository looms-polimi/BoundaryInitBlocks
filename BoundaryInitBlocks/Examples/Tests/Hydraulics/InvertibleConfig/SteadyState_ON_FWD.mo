within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model SteadyState_ON_FWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.BaseTest.InvertibleConfiguration;
  Blocks.InputBlock inputBlock(u_des=2)
    annotation (Placement(transformation(extent={{-160,20},{-140,40}})));
  inner Blocks.InitBlockOptions initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SteadyStateOnDesign)
    annotation (Placement(transformation(extent={{-180,-80},{-140,-40}})));
  Blocks.OutputBlock outputBlock(y_des= 0.4)
    annotation (Placement(transformation(extent={{60,40},{80,60}})));
equation
  connect(inputBlock.u_out, flowSource.w)
    annotation (Line(points={{-141,30},{-102,30}}, color={0,0,127}));
  connect(tank.l, outputBlock.y_in) annotation (Line(points={{36,24},{50,24},{
          50,50},{62,50}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
  __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
end SteadyState_ON_FWD;
