within BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig;
model SteadyState_ON_BWD
extends
    BoundaryInitBlocks.Examples.Tests.Hydraulics.InvertibleConfig.SteadyState_ON_FWD(
      inputBlock(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward),
      outputBlock(initOpt=BoundaryInitBlocks.Blocks.Options.InitializationDirection.Backward));
equation

end SteadyState_ON_BWD;
