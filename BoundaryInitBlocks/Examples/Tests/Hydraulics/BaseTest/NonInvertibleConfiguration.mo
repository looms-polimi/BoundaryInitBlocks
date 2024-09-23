within BoundaryInitBlocks.Examples.Tests.Hydraulics.BaseTest;
model NonInvertibleConfiguration

  extends Modelica.Icons.Example;
  BoundaryInitBlocks.Examples.Components.Hydraulics.Tank tank(A=0.4)
    annotation (Placement(visible=true, transformation(
        origin={-3.55271e-15,-3.55271e-15},
        extent={{-40,-40},{40,40}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Sources.FlowSource flowSource
    annotation (Placement(visible=true, transformation(
        origin={-26,-38},
        extent={{-80,48},{-40,88}},
        rotation=0)));
  Modelica.Blocks.Sources.RealExpression outletSource(y=2) annotation (
      Placement(visible=true, transformation(
        origin={-54,-70},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Sources.FlowSink flowSink
    annotation (Placement(visible=true, transformation(
        origin={4,-70},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation
  connect(tank.outlet, flowSink.inlet) annotation (
    Line(points={{35.2,-24},{68,-24},{68,-70},{24,-70}}));
  connect(flowSource.outlet, tank.inlet) annotation (
    Line(points={{-66,30},{-52,30},{-52,29.6},{-36,29.6}}));
  connect(outletSource.y, flowSink.w) annotation (
    Line(points = {{-32, -70}, {-12, -70}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, 100}, {100, -100}})));
end NonInvertibleConfiguration;
