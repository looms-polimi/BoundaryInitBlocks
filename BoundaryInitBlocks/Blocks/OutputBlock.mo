within BoundaryInitBlocks.Blocks;
model OutputBlock

  outer InitBlockOptions initBlockOptions;

  // Settings
  parameter Options.BlockMode mode = initBlockOptions.mode;
  parameter Options.InitializationDirection initOpt = Options.InitializationDirection.Forward "";
  parameter Boolean normalization = initBlockOptions.normalization "";

  // Parameters
  parameter Real y_des "On-design a-priori value for y variable";
  parameter Real y_offdes = y_des "Off design a-priori value for y to be used in homotopy operator";
  parameter Real y_norm = y_des "Normalization value";
  final parameter Real y_des_calc( fixed = false);
  final parameter Real y_offdes_calc( fixed = false);

  Modelica.Blocks.Interfaces.RealInput y_in( start=y_des) annotation (Placement(
      visible=true,
      transformation(
        origin={-80,0},
        extent={{-20,-20},{20,20}},
        rotation=0),
      iconTransformation(
        origin={-80,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput y_out annotation (Placement(
      visible=true,
      transformation(
        origin={70,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={90,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));

equation

  if mode == Options.BlockMode.SteadyStateOnDesign then
    y_out = y_in;

  elseif mode == Options.BlockMode.SteadyStateOffDesign then
    y_out = y_in;

  elseif mode == Options.BlockMode.SmallSignalOnDesign then
    y_out = (y_in - y_des_calc)/y_norm;

  elseif mode == Options.BlockMode.SmallSignalOffDesign then
    y_out = (y_in - y_offdes_calc)/y_norm;

  elseif mode == Options.BlockMode.SimulationOnDesign then
    if normalization then
      y_out = y_in/y_norm;
    else
      y_out = y_in;
    end if;

  elseif mode == Options.BlockMode.SimulationOffDesign then
     if normalization then
      y_out = y_in/y_norm;
    else
      y_out = y_in;
    end if;

  end if;

initial equation

  if (mode == Options.BlockMode.SteadyStateOnDesign or
      mode == Options.BlockMode.SmallSignalOnDesign or
      mode == Options.BlockMode.SimulationOnDesign) and initOpt == Options.InitializationDirection.Forward then

    y_des_calc = y_in;
    y_offdes_calc = y_in;

  elseif (mode == Options.BlockMode.SteadyStateOnDesign or
          mode == Options.BlockMode.SmallSignalOnDesign or
          mode == Options.BlockMode.SimulationOnDesign) and initOpt == Options.InitializationDirection.Backward then

    y_in = y_des;
    y_des_calc = y_des;
    y_offdes_calc = y_des;

  elseif (mode == Options.BlockMode.SteadyStateOffDesign or
          mode == Options.BlockMode.SmallSignalOffDesign or
          mode == Options.BlockMode.SimulationOffDesign) and initOpt == Options.InitializationDirection.Backward then

    y_in = homotopy(y_offdes, y_des);
    y_des_calc = y_des;
    y_offdes_calc = y_offdes;

  end if;

annotation (
    Icon(graphics={  Rectangle(fillColor = {247, 197, 159}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
end OutputBlock;
