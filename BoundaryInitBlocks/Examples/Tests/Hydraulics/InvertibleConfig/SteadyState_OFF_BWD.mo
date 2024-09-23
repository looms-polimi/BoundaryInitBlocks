within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model SteadyState_OFF_BWD
  extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.SteadyState_ON_BWD(
      initBlockOptions(mode=BoundaryInitBlocks.Blocks.Options.BlockMode.SteadyStateOffDesign),
      outputBlock(y_offdes=0.5));
equation

end SteadyState_OFF_BWD;
