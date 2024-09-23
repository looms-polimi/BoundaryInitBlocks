within BoundaryInitBlocks.Examples.Components.Hydraulics;
model Valve

  // Nominal values
  parameter Modelica.Units.SI.Pressure dpNom;
  parameter Modelica.Units.SI.MassFlowRate wNom;

  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeA inlet(w(start=
          wNom)) annotation (Placement(
      visible=true,
      transformation(
        origin={-100,0},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-100,0},
        extent={{-20,-20},{20,20}},
        rotation=0)));
  BoundaryInitBlocks.Examples.Components.Hydraulics.Interfaces.FlangeB outlet
    annotation (Placement(
      visible=true,
      transformation(
        origin={100,-2},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={100,-1.11022e-16},
        extent={{-20,-20},{20,20}},
        rotation=0)));
equation

  inlet.w + outlet.w = 0;
  inlet.p - outlet.p = dpNom/wNom^2 * inlet.w^2;

  annotation (Icon(graphics={Polygon(
          points={{-100,100},{0,0},{-100,-100},{-100,-98},{-100,100}},
          lineColor={0,123,161},
          lineThickness=1,
          fillColor={0,187,249},
          fillPattern=FillPattern.Solid), Polygon(
          points={{-50,100},{50,0},{-50,-100},{-50,-98},{-50,100}},
          lineColor={0,123,161},
          origin={50,0},
          rotation=180,
          lineThickness=1,
          fillColor={0,187,249},
          fillPattern=FillPattern.Solid)}));
end Valve;
