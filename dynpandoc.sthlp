{smcl}
{* *! version 1.0.0  01jan2018}{...}
{vieweralsosee "stpandoc" "help stpandoc"}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[P] markdown" "mansection P markdown"}{...}
{vieweralsosee "[P] dynamic tags" "help dynamic tags"}{...}
{vieweralsosee "[P] dyndoc" "help dyndoc"}{...}
{vieweralsosee "[P] dyntext" "help dyntext"}{...}
{viewerjumpto "Syntax" "dynpandoc##syntax"}{...}
{viewerjumpto "Description" "dynpandoc##description"}{...}
{viewerjumpto "Options" "dynpandoc##options"}{...}
{viewerjumpto "Remarks" "dynpandoc##remarks"}{...}
{p2colset 1 14 31 2}{...}
{p2col:{bf:dynpandoc} {hline 2}}Convert file with dynamic tags in one markup format to another using {bf:pandoc}{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{cmd:dynpandoc} {it:srcfile}{cmd:,}
{opth sav:ing(filename:targetfile)}
[{it:options}]

{phang}
{it:srcfile} is the file to be converted.

{marker dynpandoc_options}{...}
{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent :* {opth sav:ing(filename:targetfile)}}specify the target file to
be saved{p_end}
{synopt :{opt rep:lace}}replace the target file if it already exists{p_end}
{synopt :{opt nomsg}}suppress message of a link to {it:targetfile}{p_end}
{synopt :{opt nostop}}do not stop when an error occurs{p_end}
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
{opt dynpandoc} converts a file in one markup format containing Stata dynamic 
tags (see {manhelp dynamic_tags P:dynamic tags}) to a file in another markup 
format with dynamic tags replaced with Stata results, outputs, and graphs.

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
{opt nostop} allows the document to continue being processed even if an error
occurs.  

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
{cmd:dynpandoc} converts file in one markup format to another using {bf:pandoc}.  
{bf:pandoc} must be installed before use {cmd:dynpandoc}.  You can install
{bf:pandoc} follow the {browse "https://pandoc.org/installing.html":instructions}.

{pstd}
{cmd:dynpandoc} uses {cmd:dyntext} to process dynamic tags, see {manhelp dynamic_tags P:dynamic tags} 
for details.

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

{pstd}Convert {it:example.smd} to {it:example.html}.{p_end} 
{phang2}{cmd:. dynpandoc example.smd, saving(example.html)}{p_end}

{pstd}Convert {it:example.smd} to {it:example.docx}.{p_end} 
{phang2}{cmd:. dynpandoc example.smd, saving(example.docx) to(docx)}{p_end}
