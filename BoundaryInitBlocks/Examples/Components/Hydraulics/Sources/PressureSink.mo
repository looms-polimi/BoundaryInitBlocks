within BoundaryInitBlocks.Examples.Components.Hydraulics.Sources;
model PressureSink
  parameter Modelica.Units.SI.Pressure p;
  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeA inlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={-2,-4},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation
  inlet.p = p;
annotation (
    Icon(graphics={  Ellipse(fillColor = {0, 187, 249}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end PressureSink;
