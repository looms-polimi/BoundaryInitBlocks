within BoundaryInitBlocks.Examples.Tests.ThermoHydroMSL.BaseTest;
model BaseTest
extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.FixedBoundary boundaryOut(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=100000,
    T=298.15,
    nPorts=1)                                                                                                                                                                  annotation (
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  inner Modelica.Fluid.System system(allowFlowReversal = false, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial) annotation (
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary boundaryCold(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=293.15,                                                                                                                                nPorts = 1,
    p=100000)                                                                                                                                                        annotation (
    Placement(visible = true, transformation(origin = {-130, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  BoundaryInitBlocks.Examples.Components.MSLmodels.OpenTank openTank(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,

    crossArea=1.25,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    height=8,
    level_start=5,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    use_portsData=false,
    nPorts=3) annotation (Placement(visible=true, transformation(
        origin={10,70},
        extent={{-30,-30},{30,30}},
        rotation=0)));

  Modelica.Fluid.Sources.FixedBoundary boundaryHot(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    T=333.15,                                                                                                                               nPorts = 1,
    p=100000)                                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin = {-130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pumpHot(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p_a_start=100000,
    p_b_start=200000,
    m_flow_start=10,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow (
          V_flow_nominal={0,12.5e-3,25e-3}, head_nominal={8,5,0}),
    use_powerCharacteristic=false,
    V=0.01,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
                                                 use_N_in = true, N_nominal = 1000)  annotation (
    Placement(transformation(origin = {-60, 0}, extent = {{-20, -20}, {20, 20}})));

  Modelica.Fluid.Machines.PrescribedPump pumpCold(
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater,
    p_a_start=100000,
    p_b_start=200000,
    m_flow_start=10,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow (
          V_flow_nominal={0,37.5e-3,75e-3}, head_nominal={9,5,0}),
    N_nominal=1000,
    use_powerCharacteristic=false,
    V=0.01,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
                                                  use_N_in = true)  annotation (
    Placement(transformation(origin = {-60, -80}, extent = {{-20, -20}, {20, 20}})));

  Modelica.Fluid.Valves.ValveLinear userValve(
    allowFlowReversal=false,
    dp_nominal=50000,
    m_flow_nominal=100,
    redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{60,-20},{100,20}})));
  Modelica.Blocks.Sources.Constant const(k=0.5) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,30})));
equation
  connect(boundaryCold.ports[1], pumpCold.port_a) annotation (
    Line(points = {{-120, -80}, {-80, -80}}, color = {0, 127, 255}));
  connect(boundaryHot.ports[1], pumpHot.port_a) annotation (
    Line(points = {{-120, 0}, {-80, 0}}, color = {0, 127, 255}));
  connect(pumpHot.port_b, openTank.ports[1]) annotation (
    Line(points={{-40,0},{6,0},{6,40}},          color = {0, 127, 255}));
  connect(pumpCold.port_b, openTank.ports[2]) annotation (
    Line(points={{-40,-80},{10,-80},{10,40}},        color = {0, 127, 255}));

  connect(userValve.port_a, openTank.ports[3])
    annotation (Line(points={{60,0},{14,0},{14,40}}, color={0,127,255}));
  connect(userValve.port_b, boundaryOut.ports[1])
    annotation (Line(points={{100,0},{120,0}}, color={0,127,255}));
  connect(const.y, userValve.opening)
    annotation (Line(points={{99,30},{80,30},{80,16}}, color={0,0,127}));
annotation (
    Diagram(coordinateSystem(extent = {{-140, 120}, {140, -120}})));
end BaseTest;
