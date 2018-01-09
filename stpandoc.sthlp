{smcl}
{* *! version 1.0.0  01jan2018}{...}
{vieweralsosee "dynpandoc" "help dynpandoc"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[P] markdown" "mansection P markdown"}{...}
{vieweralsosee "[P] dynamic tags" "help dynamic tags"}{...}
{vieweralsosee "[P] dyndoc" "help dyndoc"}{...}
{vieweralsosee "[P] dyntext" "help dyntext"}{...}
{viewerjumpto "Syntax" "stpandoc##syntax"}{...}
{viewerjumpto "Description" "stpandoc##description"}{...}
{viewerjumpto "Options" "stpandoc##options"}{...}
{viewerjumpto "Remarks" "stpandoc##remarks"}{...}
{p2colset 1 14 31 2}{...}
{p2col:{bf:stpandoc} {hline 2}}Convert file in one markup format to another using {bf:pandoc}{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:stpandoc} {it:srcfile}{cmd:,}
{opth sav:ing(filename:targetfile)}
[{it:options}]

{phang}
{it:srcfile} is the file to be converted.

{marker stpandoc_options}{...}
{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent :* {opth sav:ing(filename:targetfile)}}specify the target file to
be saved{p_end}
{synopt :{opt rep:lace}}replace the target file if it already exists{p_end}
{synopt :{opt nomsg}}suppress message of a link to {it:targetfile}{p_end}
{synopt :{opt from}}specify the markup format of {it:srcfile}{p_end}
{synopt :{opt to}}specify the markup format of {it:targetfile}{p_end}
{synopt :{opt path}}specify the directory where the {bf:pandoc} executable is located{p_end}
{synopt :{opt pargs}}specify the extra arguments for {bf:pandoc}{p_end}
{synoptline}
{p2colreset}{...}
{p 4 6 2}* {opt saving(targetfile)} is required.


{marker description}{...}
{title:Description}

{pstd}
{opt stpandoc} converts file in one markup format to another using {bf:pandoc}.

{marker options}{...}
{title:Options}

{phang}
{opth saving:(filename:targetfile)} specifies the target file to be saved.
{opt saving()} is required.

{phang}
{opt replace} specifies that the target file be replaced if it already exists.

{phang}
{opt nomsg} suppresses the message that contains a link to the target file.  

{phang}
{opt from} specifies the markup format of the {it:srcfile}.

{phang}
{opt to} specifies the markup format of the {it:targetfile}.

{phang}
{opt path} specifies the directory where the {bf:pandoc} executable is located.

{phang}
{opt pargs} specifies the extra arguments for {bf:pandoc}.

{marker remarks}{...}
{title:Remarks}

{pstd}
{cmd:stpandoc} file in one markup format to another using {bf:pandoc}. 
{bf:pandoc} must be installed before use {cmd:stpandoc}.  You can install
{bf:pandoc} follow the {browse "https://pandoc.org/installing.html":instructions}.

{pstd}
{cmd:stpandoc} calls {bf:pandoc} using {cmd:shell} command.  You may use the 
{opt:path} to specify the location of the {bf:pandoc} if it can not be located 
through {cmd:shell}.  Another option is to use user written command 
{bf:whereis} to specify the {bf:pandoc}'s location.  

{pstd}
Options {opt from} and {opt to} specify the format of {it:srcfile} and 
{it:targetfile}.  For examples, the combination may be 
from {bf:markdown} to {bf:HTML}, from {bf:markdown} to {bf:latex}, or 
from {bf:HTML} to {bf:docx}.  Note that {bf:pandoc} uses {bf:LaTex} to 
generate {bf:pdf} output which requires a {bf:LaTex} process engine.  See 
{browse "https://pandoc.org/MANUAL.html#general-options": pandoc options} 
for details of supported formats.

{marker examples}{...}
{title:Examples}

{pstd}
Convert {it:stpandoc_ex1.md} to {it:stpandoc_ex1.html}. 
{phang2}{cmd:. stpandoc stpandoc_ex1.md, saving(stpandoc_ex1.html)}

{pstd}
Convert {it:stpandoc_ex1.md} to {it:stpandoc_ex1.docx}. 
{phang2}{cmd:. stpandoc stpandoc_ex1.md, saving(stpandoc_ex1.docx) to(docx)}

{p_end}
