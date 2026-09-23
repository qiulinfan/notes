#import "@preview/cetz:0.5.2"

#let blue = rgb("#2574d8")
#let red = rgb("#d84b4b")
#let orange = rgb("#e98a2e")
#let green = rgb("#2f9e6f")
#let purple = rgb("#7950b2")
#let gray = rgb("#667085")
#let ink = rgb("#172033")

#let curve(function, start, stop, steps: 80) = range(steps + 1).map(index => {
  let x = start + (stop - start) * index / steps
  (x, function(x))
})

#let axes(x-end, y-end, x-label: [$x$], y-label: [$y$]) = {
  import cetz.draw: *
  line((-0.2, 0), (x-end, 0), mark: (end: ">"))
  line((0, -0.2), (0, y-end), mark: (end: ">"))
  content((x-end, 0), text(size: 7pt)[#x-label], anchor: "west")
  content((0, y-end), text(size: 7pt)[#y-label], anchor: "south")
}

#let prob-01-combinatorics-prob-space-diagram-01() = cetz.canvas(
  length: 0.08cm,
  {
    import cetz.draw: *
    line(
      (0, 0),
      (0, 60),
      (60, 60),
      (60, 0),
      close: true,
      stroke: ink + 1pt,
    )
    line(
      (0, 10),
      (10, 0),
      (60, 50),
      (50, 60),
      close: true,
      fill: blue.transparentize(76%),
      stroke: none,
    )
    line((10, 0), (60, 50), stroke: red + 1.4pt)
    line((0, 10), (50, 60), stroke: red + 1.4pt)
    line((0, 0), (65, 0), mark: (end: ">"))
    line((0, 0), (0, 65), mark: (end: ">"))
    content((67, 0), text(size: 7pt)[$x$], anchor: "west")
    content((0, 67), text(size: 7pt)[$y$], anchor: "south")
    content((60, 0), text(size: 6.5pt)[60], anchor: "north")
    content((0, 60), text(size: 6.5pt)[60], anchor: "east")
    content(
      (30, 42),
      text(size: 7pt, fill: blue.darken(20%))[$abs(x-y) <= 10$],
      anchor: "center",
    )
  },
)

#let covariance-panel(offset, points, trend-start, trend-end, label) = {
  import cetz.draw: *
  line((offset - 0.35, 0), (offset + 3, 0), mark: (end: ">"))
  line((offset, -0.35), (offset, 3), mark: (end: ">"))
  for point in points {
    circle(
      (offset + point.at(0), point.at(1)),
      radius: 1.35pt,
      fill: ink,
      stroke: none,
    )
  }
  line(
    (offset + trend-start.at(0), trend-start.at(1)),
    (offset + trend-end.at(0), trend-end.at(1)),
    stroke: (paint: red, dash: "dashed"),
  )
  content(
    (offset + 1.4, -0.5),
    text(size: 6.5pt)[#label],
    anchor: "center",
  )
}

#let prob-02-random-variables-diagram-01() = cetz.canvas(
  length: 0.72cm,
  {
    covariance-panel(
      0,
      ((0.5, 0.6), (0.8, 0.9), (1.2, 1.3), (1.5, 1.6),
        (1.8, 1.9), (2.2, 2.3), (2.5, 2.5)),
      (0.3, 0.4),
      (2.7, 2.7),
      [$upright("Cov")(X,Y) > 0$],
    )
    covariance-panel(
      4.3,
      ((0.5, 2.4), (0.8, 2.2), (1.2, 1.7), (1.5, 1.4),
        (1.8, 1.1), (2.2, 0.7), (2.5, 0.5)),
      (0.3, 2.7),
      (2.7, 0.3),
      [$upright("Cov")(X,Y) < 0$],
    )
    covariance-panel(
      8.6,
      ((0.5, 1.5), (0.8, 1.2), (1.2, 1.8), (1.5, 1.4),
        (1.8, 1.6), (2.2, 1.3), (2.5, 1.5)),
      (0.3, 1.5),
      (2.7, 1.5),
      [$upright("Cov")(X,Y) = 0$],
    )
  },
)

#let circular-dependence() = cetz.canvas(length: 0.85cm, {
  import cetz.draw: *
  axes(2.7, 2.7)
  circle(
    (0, 0),
    radius: 1.8,
    stroke: (paint: blue, dash: "dashed"),
  )
  let points = (
    (1.8, 0), (1.27, 1.27), (0, 1.8), (-1.27, 1.27),
    (-1.8, 0), (-1.27, -1.27), (0, -1.8), (1.27, -1.27),
    (1.56, 0.9), (0.9, 1.56), (-0.9, 1.56), (-1.56, 0.9),
    (-1.56, -0.9), (-0.9, -1.56), (0.9, -1.56), (1.56, -0.9),
  )
  for point in points {
    circle(point, radius: 1.3pt, fill: ink, stroke: none)
  }
  content((0.65, 1.35), text(size: 7pt)[$x^2 + y^2 = r^2$], anchor: "west")
  content(
    (0, -2.25),
    text(size: 6.2pt)[$upright("Cov")(X,Y)=0$, but $X,Y$ are dependent],
    anchor: "north",
  )
})

#let prob-02-random-variables-diagram-02() = circular-dependence()

#let prob-02-random-variables-diagram-03() = cetz.canvas(length: 0.62cm, {
  import cetz.draw: *
  axes(10.8, 3.1, x-label: [$k$], y-label: [$P(X=k)$])
  let probabilities = (
    0.04979, 0.14936, 0.22404, 0.22404, 0.16803, 0.10082,
    0.05041, 0.02160, 0.00810, 0.00270, 0.00081,
  )
  for index in range(probabilities.len()) {
    let height = probabilities.at(index) * 11
    line((index, 0), (index, height), stroke: blue + 0.8pt)
    circle((index, height), radius: 1.25pt, fill: blue, stroke: none)
    content((index, -0.18), text(size: 5.5pt)[#index], anchor: "north")
  }
  content((6.2, 2.55), text(size: 7pt)[$lambda = 3$], anchor: "west")
})

#let prob-02-random-variables-diagram-04() = cetz.canvas(length: 0.88cm, {
  import cetz.draw: *
  axes(5.2, 1.3, y-label: [$f_X(x)$])
  line((0.5, 0), (1, 0), stroke: ink + 1.2pt)
  line((1, 0.75), (4, 0.75), stroke: blue + 1.5pt)
  line((4, 0), (4.5, 0), stroke: ink + 1.2pt)
  line((1, 0), (1, 0.75), stroke: (paint: gray, dash: "dashed"))
  line((4, 0), (4, 0.75), stroke: (paint: gray, dash: "dashed"))
  content((1, -0.18), text(size: 7pt)[$a$], anchor: "north")
  content((4, -0.18), text(size: 7pt)[$b$], anchor: "north")
  content((2.5, 0.95), text(size: 7pt)[$1/(b-a)$], anchor: "center")
})

#let prob-02-random-variables-diagram-05() = cetz.canvas(length: 0.88cm, {
  import cetz.draw: *
  axes(5.2, 1.35, y-label: [$F_X(x)$])
  line((0.5, 0), (1, 0), stroke: ink + 1.2pt)
  line((1, 0), (4, 1), stroke: blue + 1.5pt)
  line((4, 1), (4.5, 1), stroke: blue + 1.5pt)
  line((1, 0), (1, 1), stroke: (paint: gray, dash: "dashed"))
  line((4, 0), (4, 1), stroke: (paint: gray, dash: "dashed"))
  content((1, -0.18), text(size: 7pt)[$a$], anchor: "north")
  content((4, -0.18), text(size: 7pt)[$b$], anchor: "north")
  content((0, 1), text(size: 7pt)[$1$], anchor: "east")
})

#let prob-02-random-variables-diagram-06() = cetz.canvas(length: 0.82cm, {
  import cetz.draw: *
  axes(6.3, 1.2, y-label: [$f_X(x)$])
  line(
    ..curve(x => calc.exp(-0.5 * x), 0, 6),
    stroke: blue + 1.5pt,
  )
  content(
    (0.8, 0.75),
    text(size: 7pt)[$f_X(x) = lambda exp(-lambda x)$],
    anchor: "west",
  )
})

#let prob-02-random-variables-diagram-07() = cetz.canvas(length: 0.82cm, {
  import cetz.draw: *
  axes(6.3, 1.35, y-label: [$F_X(x)$])
  line(
    ..curve(x => 1 - calc.exp(-0.5 * x), 0, 6),
    stroke: blue + 1.5pt,
  )
  line((0, 1), (6, 1), stroke: (paint: gray, dash: "dashed"))
  content(
    (2.2, 0.6),
    text(size: 7pt)[$F_X(x) = 1 - exp(-lambda x)$],
    anchor: "west",
  )
})

#let gamma-pdf(alpha, x) = {
  if alpha == 1 { calc.exp(-x) }
  else if alpha == 2 { x * calc.exp(-x) }
  else if alpha == 3 { x * x * calc.exp(-x) / 2 }
  else { x * x * x * x * calc.exp(-x) / 24 }
}

#let gamma-cdf(alpha, x) = {
  if alpha == 1 { 1 - calc.exp(-x) }
  else if alpha == 2 { 1 - (1 + x) * calc.exp(-x) }
  else if alpha == 3 { 1 - (1 + x + x * x / 2) * calc.exp(-x) }
  else {
    1 - (
      1 + x + x * x / 2 + x * x * x / 6 + x * x * x * x / 24
    ) * calc.exp(-x)
  }
}

#let palette = ((1, blue), (2, red), (3, green), (5, purple))

#let prob-02-random-variables-diagram-08() = cetz.canvas(length: 0.72cm, {
  import cetz.draw: *
  axes(8.3, 1.2, y-label: [$f_X(x)$])
  for pair in palette {
    let alpha = pair.at(0)
    let color = pair.at(1)
    line(
      ..curve(x => gamma-pdf(alpha, x), 0.05, 8, steps: 120),
      stroke: color + 1.25pt,
    )
  }
  content((4.2, -0.35), text(size: 7pt)[Gamma densities, $lambda=1$], anchor: "north")
})

#let prob-02-random-variables-diagram-09() = cetz.canvas(length: 0.72cm, {
  import cetz.draw: *
  axes(8.3, 1.3, y-label: [$F_X(x)$])
  for pair in palette {
    let alpha = pair.at(0)
    let color = pair.at(1)
    line(
      ..curve(x => gamma-cdf(alpha, x), 0, 8, steps: 120),
      stroke: color + 1.25pt,
    )
  }
  line((0, 1), (8, 1), stroke: (paint: gray, dash: "dashed"))
  content((4.2, -0.35), text(size: 7pt)[Gamma cdfs, $lambda=1$], anchor: "north")
})

#let prob-03-joint-conditional-distribution-diagram-01() = cetz.canvas(
  length: 2.2cm,
  {
    import cetz.draw: *
    axes(1.25, 2.2)
    line((0, 0), (1, 2), stroke: (paint: gray, dash: "dashed"))
    line((0, 1.5), (1.5, 0), stroke: (paint: gray, dash: "dashed"))
    line(
      (0, 0),
      (0.5, 0),
      (0.5, 1),
      close: true,
      fill: blue.transparentize(72%),
      stroke: none,
    )
    line(
      (0.5, 0),
      (1, 0),
      (1, 0.5),
      (0.5, 1),
      close: true,
      fill: blue.transparentize(72%),
      stroke: none,
    )
    line(
      (0, 0),
      (0.5, 1),
      (1, 0.5),
      (1, 0),
      close: true,
      stroke: blue + 1.2pt,
    )
    circle((0.5, 1), radius: 1.6pt, fill: red, stroke: none)
    circle((1, 0.5), radius: 1.6pt, fill: red, stroke: none)
    content((0.5, 1), text(size: 7pt)[$(1/2,1)$], anchor: "south-east")
    content((1, 0.5), text(size: 7pt)[$(1,1/2)$], anchor: "north-west")
  },
)

#let prob-03-joint-conditional-distribution-diagram-02() = circular-dependence()

#let prob-03-joint-conditional-distribution-diagram-03() = cetz.canvas(
  length: 0.8cm,
  {
    import cetz.draw: *
    axes(3.8, 3.2)
    line(
      (0.5, 0.5),
      (0.5, 2.6),
      (3.2, 2.6),
      (3.2, 0.5),
      close: true,
      fill: blue.transparentize(90%),
      stroke: blue + 1pt,
    )
    line((1.2, 0.5), (1.2, 2.6), stroke: orange + 1.2pt)
    line((2.5, 0.5), (2.5, 2.6), stroke: red + 1.2pt)
    content((1.2, 0), text(size: 7pt)[$x_1$], anchor: "north")
    content((2.5, 0), text(size: 7pt)[$x_2$], anchor: "north")
    content((1.85, 2.9), text(size: 7pt)[support of $f_(X,Y)$], anchor: "center")

    line((5.1, 0), (8.4, 0), mark: (end: ">"))
    line((5.3, -0.2), (5.3, 3.1), mark: (end: ">"))
    line(
      ..curve(y => 2.2 * calc.exp(-((y - 1.6) * (y - 1.6)) / 0.55), 0.2, 3)
        .map(point => (5.3 + point.at(0), point.at(1))),
      stroke: orange + 1.2pt,
    )
    line(
      ..curve(y => 1.2 * calc.exp(-((y - 1.6) * (y - 1.6)) / 0.55), 0.2, 3)
        .map(point => (5.3 + point.at(0), point.at(1))),
      stroke: red + 1.2pt,
    )
    content((6.9, -0.4), text(size: 6.5pt)[same shape, different scale], anchor: "north")
  },
)

#let prob-04-lln-diagram-01() = cetz.canvas(length: 1.02cm, {
  import cetz.draw: *
  axes(5.8, 1.2, y-label: [$f_X(x)$])
  let density = x => calc.exp(-((x - 2) * (x - 2)) / 1.7)
  let tail = ((3.05, 0),) + curve(density, 3.05, 5.35) + ((5.35, 0),)
  line(
    ..tail,
    close: true,
    fill: orange.transparentize(65%),
    stroke: none,
  )
  line(..curve(density, 0, 5.35), stroke: blue + 1.4pt)
  line((3.05, 0), (3.05, density(3.05)), stroke: (paint: gray, dash: "dashed"))
  content((3.05, 0), text(size: 7pt)[$t$], anchor: "north")
  content((4.15, 0.22), text(size: 7pt, fill: orange)[$P(X >= t)$], anchor: "center")
})
