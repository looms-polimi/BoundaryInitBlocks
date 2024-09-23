within BoundaryInitBlocks.Examples.Components.Hydraulics;
model Tank

  // Parameters
  constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Gravitational acceleration";
  constant Modelica.Units.SI.Pressure pAtm = 101325 "Atmospheric pressure";

  parameter Modelica.Units.SI.Density rho = 1000 "Water density";
  parameter Modelica.Units.SI.Area A = 1 "Tank section";

  // Variables
  Modelica.Blocks.Interfaces.RealOutput l( unit = "m") "Tank fluid level" annotation (
    Placement(visible = true, transformation(origin = {88, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeA inlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={-68,62},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-90,74},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeB outlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={76,-68},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={88,-60},
        extent={{-20,-20},{20,20}},
        rotation=0)));

equation

  inlet.p = pAtm;

  outlet.p = pAtm + rho*g*l;

  rho*A*der(l) = inlet.w + outlet.w;

initial equation

  der(l) = 0;

annotation (
    Icon(graphics={  Polygon(fillColor = {186, 186, 186}, fillPattern = FillPattern.Solid, points = {{-100, 100}, {-100, -100}, {100, -100}, {100, 100}, {80, 100}, {80, -80}, {-80, -80}, {-80, 100}, {-100, 100}}), Rectangle(origin = {0, -10}, fillColor = {0, 0, 255}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-80, 70}, {80, -70}})}));
end Tank;
