within BoundaryInitBlocks.Examples.Components.Hydraulics.Sources;
model FlowSink
  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeA inlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={82,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput w annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-108, -20}, {-68, 20}}, rotation = 0), iconTransformation(origin = {-160, 0}, extent = {{-100, -20}, {-60, 20}}, rotation = 180)));
equation
  inlet.w = w;
  annotation (
    Diagram,
    Icon(graphics={  Rectangle(fillColor = {0, 187, 249}, fillPattern = FillPattern.Solid, extent = {{-100, 60}, {100, -60}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end FlowSink;
