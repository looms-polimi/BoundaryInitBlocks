within BoundaryInitBlocks.Blocks;
model InitBlockOptions
  parameter Options.BlockMode mode = Options.BlockMode.SteadyStateOnDesign "";
  parameter Boolean normalization = false;
equation

  annotation (defaultComponentPrefixes="inner",
    Icon(graphics={  Rectangle(fillColor = {161, 61, 99}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}, radius = 40), Text(                  extent={{-100,
              100},{100,-100}},
          textString="Options",
          textColor={0,0,0})},                                                                                                                                                                                                  coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end InitBlockOptions;
