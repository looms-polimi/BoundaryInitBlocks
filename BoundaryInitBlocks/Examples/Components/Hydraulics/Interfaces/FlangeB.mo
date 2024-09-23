within BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces;
connector FlangeB
  extends BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.Flange;
annotation (
      Icon(graphics={  Ellipse(fillColor = {0, 187, 249}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram(graphics={  Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}}), Ellipse(fillColor = {0, 187, 249}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 80}, {80, -80}})}));
end FlangeB;
