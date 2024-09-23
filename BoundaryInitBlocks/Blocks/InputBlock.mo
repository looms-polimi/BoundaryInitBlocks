within BoundaryInitBlocks.Blocks;
model InputBlock

  outer InitBlockOptions initBlockOptions;

  // Settings
  parameter Options.BlockMode mode = initBlockOptions.mode;
  parameter Options.InitializationDirection initOpt = Options.InitializationDirection.Forward "";
  parameter Boolean normalization = initBlockOptions.normalization "";

  // Parameters
  parameter Real u_des "On-design a-priori value for u_out_in variable";
  parameter Real u_norm = u_des "Normalization value";
  final parameter Real u_des_calc( fixed = false) "";
  final parameter Real u_offdes_calc( fixed = false) "";

  Modelica.Blocks.Interfaces.RealInput u_in = u_in_ if ((mode <> Options.BlockMode.SteadyStateOnDesign) and (mode <> Options.BlockMode.SteadyStateOffDesign)) annotation (Placement(
      visible=true,
      transformation(
        origin={-80,0},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-80,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput u_out( start=u_des) annotation (Placement(
      visible=true,
      transformation(
        origin={70,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={90,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));

  Real u_in_ "Non-conditional alias variable for u_in";

equation

  if mode == Options.BlockMode.SteadyStateOnDesign then
    u_out = u_des_calc;

  elseif mode == Options.BlockMode.SteadyStateOffDesign then
    u_out = u_offdes_calc;

  elseif mode == Options.BlockMode.SmallSignalOnDesign then
    u_in_ = (u_out - u_des_calc)/u_norm;

  elseif mode == Options.BlockMode.SmallSignalOffDesign then
    u_in_ = (u_out - u_offdes_calc)/u_norm;

  elseif mode == Options.BlockMode.SimulationOnDesign then
    if normalization then
      u_out = if initial() then u_des_calc else u_in_*u_norm;
    else
      u_out = if initial() then u_des_calc else u_in_;
    end if;

  elseif mode == Options.BlockMode.SimulationOffDesign then
     if normalization then
      u_out = if initial() then u_offdes_calc else u_in_*u_norm;
    else
      u_out = if initial() then u_offdes_calc else u_in_;
    end if;

  end if;

  if not ((mode <> Options.BlockMode.SteadyStateOnDesign) and (mode <> Options.BlockMode.SteadyStateOffDesign)) then
    u_in_ = 0 "The connector is not active";
   end if;

initial equation

  if (mode == Options.BlockMode.SteadyStateOnDesign or
      mode == Options.BlockMode.SmallSignalOnDesign or
      mode == Options.BlockMode.SimulationOnDesign) and initOpt == Options.InitializationDirection.Forward then

    u_des_calc = u_des;
    u_offdes_calc = u_des;

  elseif (mode == Options.BlockMode.SteadyStateOnDesign or
          mode == Options.BlockMode.SmallSignalOnDesign or
          mode == Options.BlockMode.SimulationOnDesign) and initOpt == Options.InitializationDirection.Backward then

    u_offdes_calc = u_des;

  elseif (mode == Options.BlockMode.SteadyStateOffDesign or
          mode == Options.BlockMode.SmallSignalOffDesign or
          mode == Options.BlockMode.SimulationOffDesign) and initOpt == Options.InitializationDirection.Backward then

    u_des_calc = u_des;

  end if;

annotation (
    Icon(graphics={  Rectangle(fillColor = {123, 224, 173}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end InputBlock;
