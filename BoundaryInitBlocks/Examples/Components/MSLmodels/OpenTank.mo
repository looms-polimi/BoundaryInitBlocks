within BoundaryInitBlocks.Examples.Components.MSLmodels;
model OpenTank
  extends Modelica.Fluid.Vessels.OpenTank;
Modelica.Blocks.Interfaces.RealOutput levelOutput annotation (
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Blocks.Interfaces.RealOutput temperatureOutput annotation (
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
levelOutput = level;
temperatureOutput = medium.T;
end OpenTank;
