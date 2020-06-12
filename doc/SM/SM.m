(* ::Package:: *)

(* ::Text:: *)
(*This file was automatically generated by PyR@TE 3.*)
(*Model : SM*)
(*Author : Lohan Sartore*)
(**)
(*Section 1 contains the renormalization group equations.*)
(*Section 2 is a proposition of a minimal working code to solve the RGEs and plot the running couplings.*)
(*Section 3 should be completed by the user since it contains the initial conditions for the running couplings.*)
(* ::Subsection:: *)
(*1. RGEs*)

(* \[Beta]-function definition *)

\[Beta][x_] := 1*Sum[If[With[{j=i}, ValueQ[\[Beta][x, j]]] && (!ValueQ[loops[x]] || i <= loops[x]),  1/(4 Pi)^(2*i)*\[Beta][x,i], 0], {i,2}]*Log[10];


(* Gauge Couplings *)

GaugeCouplings = {g1, g2, g3};

\[Beta][g1, 1] = (41/10)*g1^3;
\[Beta][g2, 1] = -19/6*g2^3;
\[Beta][g3, 1] = -7*g3^3;

\[Beta][g1, 2] = (199/50)*g1^5 + (27/10)*g1^3*g2^2 + (44/5)*g1^3*g3^2 - 1/2*g1^3*yb*Conjugate[yb] - 17/10*g1^3*yt*Conjugate[yt] - 3/2*g1^3*ytau*Conjugate[ytau];
\[Beta][g2, 2] = (9/10)*g1^2*g2^3 + (35/6)*g2^5 + 12*g2^3*g3^2 - 3/2*g2^3*yb*Conjugate[yb] - 3/2*g2^3*yt*Conjugate[yt] - 1/2*g2^3*ytau*Conjugate[ytau];
\[Beta][g3, 2] = (11/10)*g1^2*g3^3 + (9/2)*g2^2*g3^3 - 26*g3^5 - 2*g3^3*yb*Conjugate[yb] - 2*g3^3*yt*Conjugate[yt];


(* Yukawa Couplings *)

YukawaCouplings = {yt, yb, ytau};

\[Beta][yt, 1] = -17/20*g1^2*yt - 9/4*g2^2*yt - 8*g3^2*yt + (3/2)*yb*yt*Conjugate[yb] + (9/2)*yt^2*Conjugate[yt] + yt*ytau*Conjugate[ytau];
\[Beta][yb, 1] = -1/4*g1^2*yb - 9/4*g2^2*yb - 8*g3^2*yb + (9/2)*yb^2*Conjugate[yb] + (3/2)*yb*yt*Conjugate[yt] + yb*ytau*Conjugate[ytau];
\[Beta][ytau, 1] = -9/4*g1^2*ytau - 9/4*g2^2*ytau + 3*yb*ytau*Conjugate[yb] + 3*yt*ytau*Conjugate[yt] + (5/2)*ytau^2*Conjugate[ytau];

\[Beta][yt, 2] = (1187/600)*g1^4*yt - 9/20*g1^2*g2^2*yt + (19/15)*g1^2*g3^2*yt + (7/80)*g1^2*yb*yt*Conjugate[yb] + (393/80)*g1^2*yt^2*Conjugate[yt] + (15/8)*g1^2*yt*ytau*Conjugate[ytau] - 23/4*g2^4*yt + 9*g2^2*g3^2*yt + (99/16)*g2^2*yb*yt*Conjugate[yb] + (225/16)*g2^2*yt^2*Conjugate[yt] + (15/8)*g2^2*yt*ytau*Conjugate[ytau] - 108*g3^4*yt + 4*g3^2*yb*yt*Conjugate[yb] + 36*g3^2*yt^2*Conjugate[yt] + 6*lambda^2*yt - 12*lambda*yt^2*Conjugate[yt] - 1/4*yb^2*yt*Conjugate[yb]^2 - 11/4*yb*yt^2*Conjugate[yb]*Conjugate[yt] + (5/4)*yb*yt*ytau*Conjugate[yb]*Conjugate[ytau] - 12*yt^3*Conjugate[yt]^2 - 9/4*yt^2*ytau*Conjugate[yt]*Conjugate[ytau] - 9/4*yt*ytau^2*Conjugate[ytau]^2;
\[Beta][yb, 2] = -127/600*g1^4*yb - 27/20*g1^2*g2^2*yb + (31/15)*g1^2*g3^2*yb + (237/80)*g1^2*yb^2*Conjugate[yb] + (91/80)*g1^2*yb*yt*Conjugate[yt] + (15/8)*g1^2*yb*ytau*Conjugate[ytau] - 23/4*g2^4*yb + 9*g2^2*g3^2*yb + (225/16)*g2^2*yb^2*Conjugate[yb] + (99/16)*g2^2*yb*yt*Conjugate[yt] + (15/8)*g2^2*yb*ytau*Conjugate[ytau] - 108*g3^4*yb + 36*g3^2*yb^2*Conjugate[yb] + 4*g3^2*yb*yt*Conjugate[yt] + 6*lambda^2*yb - 12*lambda*yb^2*Conjugate[yb] - 12*yb^3*Conjugate[yb]^2 - 11/4*yb^2*yt*Conjugate[yb]*Conjugate[yt] - 9/4*yb^2*ytau*Conjugate[yb]*Conjugate[ytau] - 1/4*yb*yt^2*Conjugate[yt]^2 + (5/4)*yb*yt*ytau*Conjugate[yt]*Conjugate[ytau] - 9/4*yb*ytau^2*Conjugate[ytau]^2;
\[Beta][ytau, 2] = (1371/200)*g1^4*ytau + (27/20)*g1^2*g2^2*ytau + (5/8)*g1^2*yb*ytau*Conjugate[yb] + (17/8)*g1^2*yt*ytau*Conjugate[yt] + (537/80)*g1^2*ytau^2*Conjugate[ytau] - 23/4*g2^4*ytau + (45/8)*g2^2*yb*ytau*Conjugate[yb] + (45/8)*g2^2*yt*ytau*Conjugate[yt] + (165/16)*g2^2*ytau^2*Conjugate[ytau] + 20*g3^2*yb*ytau*Conjugate[yb] + 20*g3^2*yt*ytau*Conjugate[yt] + 6*lambda^2*ytau - 12*lambda*ytau^2*Conjugate[ytau] - 27/4*yb^2*ytau*Conjugate[yb]^2 + (3/2)*yb*yt*ytau*Conjugate[yb]*Conjugate[yt] - 27/4*yb*ytau^2*Conjugate[yb]*Conjugate[ytau] - 27/4*yt^2*ytau*Conjugate[yt]^2 - 27/4*yt*ytau^2*Conjugate[yt]*Conjugate[ytau] - 3*ytau^3*Conjugate[ytau]^2;


(* Quartic Couplings *)

QuarticCouplings = {lambda};

\[Beta][lambda, 1] = (27/200)*g1^4 + (9/20)*g1^2*g2^2 - 9/5*g1^2*lambda + (9/8)*g2^4 - 9*g2^2*lambda + 24*lambda^2 + 12*lambda*yb*Conjugate[yb] + 12*lambda*yt*Conjugate[yt] + 4*lambda*ytau*Conjugate[ytau] - 6*yb^2*Conjugate[yb]^2 - 6*yt^2*Conjugate[yt]^2 - 2*ytau^2*Conjugate[ytau]^2;

\[Beta][lambda, 2] = -3411/2000*g1^6 - 1677/400*g1^4*g2^2 + (1887/200)*g1^4*lambda + (9/20)*g1^4*yb*Conjugate[yb] - 171/100*g1^4*yt*Conjugate[yt] - 9/4*g1^4*ytau*Conjugate[ytau] - 289/80*g1^2*g2^4 + (117/20)*g1^2*g2^2*lambda + (27/10)*g1^2*g2^2*yb*Conjugate[yb] + (63/10)*g1^2*g2^2*yt*Conjugate[yt] + (33/10)*g1^2*g2^2*ytau*Conjugate[ytau] + (108/5)*g1^2*lambda^2 + (5/2)*g1^2*lambda*yb*Conjugate[yb] + (17/2)*g1^2*lambda*yt*Conjugate[yt] + (15/2)*g1^2*lambda*ytau*Conjugate[ytau] + (4/5)*g1^2*yb^2*Conjugate[yb]^2 - 8/5*g1^2*yt^2*Conjugate[yt]^2 - 12/5*g1^2*ytau^2*Conjugate[ytau]^2 + (305/16)*g2^6 - 73/8*g2^4*lambda - 9/4*g2^4*yb*Conjugate[yb] - 9/4*g2^4*yt*Conjugate[yt] - 3/4*g2^4*ytau*Conjugate[ytau] + 108*g2^2*lambda^2 + (45/2)*g2^2*lambda*yb*Conjugate[yb] + (45/2)*g2^2*lambda*yt*Conjugate[yt] + (15/2)*g2^2*lambda*ytau*Conjugate[ytau] + 80*g3^2*lambda*yb*Conjugate[yb] + 80*g3^2*lambda*yt*Conjugate[yt] - 32*g3^2*yb^2*Conjugate[yb]^2 - 32*g3^2*yt^2*Conjugate[yt]^2 - 312*lambda^3 - 144*lambda^2*yb*Conjugate[yb] - 144*lambda^2*yt*Conjugate[yt] - 48*lambda^2*ytau*Conjugate[ytau] - 3*lambda*yb^2*Conjugate[yb]^2 - 42*lambda*yb*yt*Conjugate[yb]*Conjugate[yt] - 3*lambda*yt^2*Conjugate[yt]^2 - lambda*ytau^2*Conjugate[ytau]^2 + 30*yb^3*Conjugate[yb]^3 - 6*yb^2*yt*Conjugate[yb]^2*Conjugate[yt] - 6*yb*yt^2*Conjugate[yb]*Conjugate[yt]^2 + 30*yt^3*Conjugate[yt]^3 + 10*ytau^3*Conjugate[ytau]^3;


(* Scalar Mass Couplings *)

ScalarMassCouplings = {mu};

\[Beta][mu, 1] = -9/10*g1^2*mu - 9/2*g2^2*mu + 12*lambda*mu + 6*mu*yb*Conjugate[yb] + 6*mu*yt*Conjugate[yt] + 2*mu*ytau*Conjugate[ytau];

\[Beta][mu, 2] = (1671/400)*g1^4*mu + (9/8)*g1^2*g2^2*mu + (72/5)*g1^2*lambda*mu + (5/4)*g1^2*mu*yb*Conjugate[yb] + (17/4)*g1^2*mu*yt*Conjugate[yt] + (15/4)*g1^2*mu*ytau*Conjugate[ytau] - 145/16*g2^4*mu + 72*g2^2*lambda*mu + (45/4)*g2^2*mu*yb*Conjugate[yb] + (45/4)*g2^2*mu*yt*Conjugate[yt] + (15/4)*g2^2*mu*ytau*Conjugate[ytau] + 40*g3^2*mu*yb*Conjugate[yb] + 40*g3^2*mu*yt*Conjugate[yt] - 60*lambda^2*mu - 72*lambda*mu*yb*Conjugate[yb] - 72*lambda*mu*yt*Conjugate[yt] - 24*lambda*mu*ytau*Conjugate[ytau] - 27/2*mu*yb^2*Conjugate[yb]^2 - 21*mu*yb*yt*Conjugate[yb]*Conjugate[yt] - 27/2*mu*yt^2*Conjugate[yt]^2 - 9/2*mu*ytau^2*Conjugate[ytau]^2;


(* Vacuum-expectation Values *)

Vevs = {v};

(* For vevs the gauge must be fixed. Let's use for instance the Landau gauge : *)
xiGauge = 0;

\[Beta][v, 1] = (3/20)*xiGauge*g1^2*v + (3/4)*xiGauge*g2^2*v + (9/20)*g1^2*v + (9/4)*g2^2*v - 3*v*yb*Conjugate[yb] - 3*v*yt*Conjugate[yt] - v*ytau*Conjugate[ytau];

\[Beta][v, 2] = (9/200)*xiGauge^2*g1^4*v + (9/20)*xiGauge^2*g1^2*g2^2*v - 9/8*xiGauge^2*g2^4*v + (9/200)*xiGauge*g1^4*v + (9/20)*xiGauge*g1^2*g2^2*v - 9/20*xiGauge*g1^2*v*yb*Conjugate[yb] - 9/20*xiGauge*g1^2*v*yt*Conjugate[yt] - 3/20*xiGauge*g1^2*v*ytau*Conjugate[ytau] - 9/8*xiGauge*g2^4*v - 9/4*xiGauge*g2^2*v*yb*Conjugate[yb] - 9/4*xiGauge*g2^2*v*yt*Conjugate[yt] - 3/4*xiGauge*g2^2*v*ytau*Conjugate[ytau] - 1293/800*g1^4*v - 27/80*g1^2*g2^2*v - 5/8*g1^2*v*yb*Conjugate[yb] - 17/8*g1^2*v*yt*Conjugate[yt] - 15/8*g1^2*v*ytau*Conjugate[ytau] + (271/32)*g2^4*v - 45/8*g2^2*v*yb*Conjugate[yb] - 45/8*g2^2*v*yt*Conjugate[yt] - 15/8*g2^2*v*ytau*Conjugate[ytau] - 20*g3^2*v*yb*Conjugate[yb] - 20*g3^2*v*yt*Conjugate[yt] - 6*lambda^2*v + (27/4)*v*yb^2*Conjugate[yb]^2 - 3/2*v*yb*yt*Conjugate[yb]*Conjugate[yt] + (27/4)*v*yt^2*Conjugate[yt]^2 + (9/4)*v*ytau^2*Conjugate[ytau]^2;
(* ::Subsection:: *)
(*2. Solving and plotting functions*)

(* ::Subsubsection::Closed:: *)
(*RG-solving functions*)

(* Solving function *)

RGsolve[initialScale_, range_] := Block[{allCouplings, couplingsToFunction, differentialEquations, initialConditions, allEquations, solutions, yukawaLike},
	(* Define and solve the system of coupled differential equations *)
	allCouplings = Join[GaugeCouplings, YukawaCouplings, QuarticCouplings, ScalarMassCouplings, Vevs];
	couplingsToFunction = # -> #[t] & /@ allCouplings;

	differentialEquations = (#'[t] == (\[Beta][#] /. couplingsToFunction) & /@ allCouplings);
	initialConditions = (#[initialScale] == init[#] & /@ allCouplings);
	allEquations = Join[differentialEquations, initialConditions];

	solutions = NDSolve[allEquations, allCouplings /. couplingsToFunction, {t, range[[1]], range[[2]]}][[1]];
	Return[solutions];
];

(* The following function removes from the list the couplings which seem to identically vanish over the energy range *)
DiscardZeroCouplings[range_, solutions_] := Block[{N, testPoints},
	N = 20;
	testPoints =  Range[range[[1]], range[[2]], (range[[2]] - range[[1]])/N];
	Return @ Select[solutions, (DeleteDuplicates[#[[2, 0]] /@ testPoints] != {0}) &];
];
(* ::Subsubsection::Closed:: *)
(*Plot function*)

(* Plotting function handling both real and complex quantities *)

ComplexPlot[funcs_, {min_, max_}, legends_, plotRange_] := Block[{cplxPos, newFuncs, newLegends},
	cplxPos = If[Head[Chop[funcs[[#]] /. t -> 1/2(max-min)]] === Complex,#, Nothing]& /@ Range[Length[funcs]];
	newFuncs = If[MemberQ[cplxPos, #], Sequence @@ {Re@funcs[[#]], Im@funcs[[#]]}, funcs[[#]]]& /@ Range[Length[funcs]];
	newLegends = If[MemberQ[cplxPos, #], Sequence @@ {Re@legends[[#]], Im@legends[[#]]}, legends[[#]]]& /@ Range[Length[funcs]];

	Return @ Plot[Evaluate @ newFuncs, {t, min, max}, PlotLegends->newLegends, PlotRange->plotRange]
 ]


RGplot[range_, solutions_] := Block[{selectType, toPlot},
	selectType[type_] := Select[solutions, MemberQ[type, If[Head@#[[1]] =!= Symbol, Head@#[[1]], #[[1]]]]&];

	toPlot = selectType[GaugeCouplings];
	If[toPlot =!= {},
		Print["### Gauge Couplings ###"];
		Print @ ComplexPlot[toPlot[[All, 2]], range, toPlot[[All, 1]], All];
	];

	toPlot = selectType[YukawaCouplings];
	If[toPlot =!= {},
		Print["### Yukawa Couplings ###"];
		Print @ ComplexPlot[toPlot[[All, 2]], range, toPlot[[All, 1]], All];
	];

	toPlot = selectType[QuarticCouplings];
	If[toPlot =!= {},
		Print["### Quartic Couplings ###"];
		Print @ ComplexPlot[toPlot[[All, 2]], range, toPlot[[All, 1]], All];
	];

	toPlot = selectType[ScalarMassCouplings];
	If[toPlot =!= {},
		Print["### Scalar Mass Couplings ###"];
		Print @ ComplexPlot[toPlot[[All, 2]], range, toPlot[[All, 1]], All];
	];

	toPlot = selectType[Vevs];
	If[toPlot =!= {},
		Print["### Vacuum-expectation Values ###"];
		Print @ ComplexPlot[toPlot[[All, 2]], range, toPlot[[All, 1]], All];
	];
];
(* ::Subsection:: *)
(*3. Actual solving*)


(* Some useful quantities. Energy and mass are in units of Log10[ GeV ] *)

MZ = 91.1876                 // Log10; (* Z boson mass *)
MP = 1.22*10^19              // Log10; (* Planck mass *)
Mp = 1.22*10^19 / Sqrt[8 Pi] // Log10; (* Reduced Planck mass *)

MT = 173.0 // Log10; (* Pole top mass *)

vev = 246.22 // Log10; (* SM Higgs vacuum-expectation value *)


(*** Initial conditions ; Energy range ***)

initialScale = MZ;
range = {0, MP};

(* Gauge Couplings *)

init[g1] = 0;
init[g2] = 0;
init[g3] = 0;

(* Yukawa Couplings *)

init[yt] = 0;
init[yb] = 0;
init[ytau] = 0;

(* Quartic Couplings *)

init[lambda] = 0;

(* Scalar Mass Couplings *)

init[mu] = 0;

(* Vacuum-expectation Values *)

init[v] = 0;


(* Definition of the running scheme *)

(loops[#] = 2)& /@ GaugeCouplings;
(loops[#] = 2)& /@ YukawaCouplings;
(loops[#] = 2)& /@ QuarticCouplings;
(loops[#] = 2)& /@ ScalarMassCouplings;
(loops[#] = 2)& /@ Vevs;


(* Now call the functions defined in section 2 *)

solutions = RGsolve[initialScale, range];
solutions = DiscardZeroCouplings[range, solutions];

RGplot[range, solutions]