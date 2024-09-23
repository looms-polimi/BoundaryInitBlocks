within BoundaryInitBlocks.Examples.Tests.Hydraulics.BaseTest;
model InvertibleConfiguration
extends Modelica.Icons.Example;
  BoundaryInitBlocks.Examples.Components.Hydraulics.Tank tank(A=0.4)
    annotation (Placement(visible=true, transformation(
        origin={-3.55271e-15,-3.55271e-15},
        extent={{-40,-40},{40,40}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Valve valve(dpNom(
        displayUnit="bar") = 4000, wNom=2) annotation (Placement(visible=true,
        transformation(
        origin={46,-70},
        extent={{-20,-20},{20,20}},
        rotation=180)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Sources.FlowSource flowSource
    annotation (Placement(visible=true, transformation(
        origin={-26,-38},
        extent={{-80,48},{-40,88}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Sources.PressureSink pressureSink(p(
        displayUnit="bar") = 101324.5) annotation (Placement(visible=true,
        transformation(
        origin={-32,-70},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation
  connect(tank.outlet, valve.inlet) annotation (
    Line(points={{35.2,-24},{86,-24},{86,-70},{66,-70}}));
  connect(flowSource.outlet, tank.inlet) annotation (
    Line(points={{-66,30},{-52,30},{-52,29.6},{-36,29.6}}));
  connect(pressureSink.inlet, valve.outlet) annotation (
    Line(points={{-32,-70},{26,-70}}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, 100}, {100, -100}})));
end InvertibleConfiguration;
