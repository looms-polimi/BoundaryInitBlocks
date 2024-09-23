within BoundaryInitBlocks.Blocks;
package Options
extends Modelica.Icons.Package;
  type BlockMode = enumeration(
      SteadyStateOnDesign,
      SteadyStateOffDesign,
      SmallSignalOnDesign,
      SmallSignalOffDesign,
      SimulationOnDesign,
      SimulationOffDesign);
  type InitializationDirection = enumeration(
      Forward,
      Backward);
end Options;
