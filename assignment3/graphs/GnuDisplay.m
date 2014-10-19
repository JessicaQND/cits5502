BeginPackage["GnuDisplay`"];

(* GnuDisplay.m -- *)

(* -- A Package for Printing 2D-Graphics with Gnuplot 3.0 *)

(* Mathematica Version 2.0.1 *)

(* Version 1.0 from June 13, 1992 *)

(* a little manual is at the end of this file *)

(* author: Matthias Schunter *)

(* The Package is public-domain. *)

(* The distribution of changed versions is not allowed without permission *)

GnuDisplay::usage=
	"GnuDisplay[\"filename\",graphics] generates a Gnuplot 3.0 \
	Programm named filename.gnu for Plotting the graphics. \n\
	The Points are stored in filename.pt. \
	The Lines are stored in filename.lin. ";

Term::usage="The Term--Option gives the Gnuplot terminal for Printing \
	(e.g. latex, emtex, postscript)." ;

Size::usage="The Size-Options gives {Width, Height} \
	 in cm.";

LinesPoints::usage="LinesPoints->{linestyle,pointstyle} gives the \
	plotting styles as described in the Gnuplot--Manual."

Attributes[GnuDisplay]={};
Options[GnuDisplay]={Term->latex,Size->{12,10},LinesPoints->{1,11}};

Begin["`Private`"]

GnuDisplay[a_String,g_Graphics,opts___]:=
	Module[
		{GNUout,LINout,PTout,
		graph=g[[1]],
		plotopts=g[[2]],
		linespoints= LinesPoints /. {opts} /. Options[GnuDisplay],
		latexterms={latex,emtex,eepic},
		siz=Size /.{opts}/.Options[GnuDisplay],
		title,term}
	,

		term = Term /.{opts}/.Options[GnuDisplay];
		title =	PlotLabel /.  {opts} /. plotopts /.{None -> ""};
		If[MemberQ[latexterms,term],
      			title="$"<>StringReplace[ToString[title],
			{"\n"->" ","^"->"\\,\\hat{}\\, "," "->"\\; "}]<>"$"
		,];

	(* generation of the .pt - file *)
		PTout=OpenWrite[a<>".pt"];
		WriteString[PTout,"# Point[] graphic-primitives of ",a," \n"];
		(WriteString[PTout,CForm[N[#]],"\t"]& 
			/@ #;WriteString[PTout,"\n"])& 
			/@ Cases[{graph},Point[po_]->po,Infinity];
		Close[PTout];

	(* generation of the .lin - file *)
		LINout=OpenWrite[a<>".lin"];
		WriteString[LINout,"# Line[] graphic-primitives of ",a," \n"];
		((WriteString[LINout,CForm[N[#]],"\t"]& 
			/@ #;WriteString[LINout,"\n"])&
			/@ #;WriteString[LINout,"\n\n"])& 
			/@ Cases[{graph},Line[lin_]->lin, Infinity];
		Close[LINout];
		
	(* generation of the .gnu - program  *)
		GNUout=OpenWrite[a<>".p"];
		WriteString[GNUout,
			"# Gnu-Program for printing ",a,".lin and ",a,".pt  \n",
			"set term tikz monochrome dashed size 5in,3in font \",9\"\n",
			"set style func linespoints\n",
			"set style data lines\n",
			"set nogrid\n",
			"set title \"",title,"\"\n",
			"set title font \",12\"\n",
			"set format xy \"",If[MemberQ[latexterms,term],"$%g$","%g"],"\"\n",
			"set output \"",a,".tex","\"\n",
			"plot \"",a,".lin\" i 0 lw 3 lt 1 smooth csplines title \"Curve\", \"",a,".lin\" i 1 lw 1 lt 4  title \"Raw Data\"\n",
			"set output \n"	
		];
		Close[GNUout];
		g
	];

End[] (* Private *);

Attributes[GnuDisplay]={Protected,ReadProtected};
EndPackage[]
