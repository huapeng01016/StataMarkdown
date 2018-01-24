# dynpandoc

**dynpandoc** combines Stata's **dyntext** with **pandoc** to convert a file in one 
markup format to another. It also process Stata's **dynamic tags** to run Stata 
commands, include Stata results, outputs, and graphs.
  
## A dynamic document [example1.md](examples/example1.md)

### Produce html file [ex1.html](examples/ex1.html):

```
dynpandoc example1.md, sav(ex1.html) replace pargs("--self-contained")
```

Note that "--self-contained" is a **pandoc** option to produce a standalone HTML file with no external 
dependencies. 

On Mac OS X:

```
dynpandoc example1.md, sav(ex1.html) replace pargs("--self-contained") path(/usr/local/bin/pandoc)
```

if **pandoc** is installed at /usr/local/bin and can not be located through Stata's **shell** command.


### Produce docx file [ex1.docx](examples/ex1.docx):

```
dynpandoc example1.md, sav(ex1.docx) replace
```


### Produce pdf file [ex1.pdf](examples/ex1.pdf):

```
dynpandoc example1.md, sav(ex1.pdf) replace
```

Note that **LaTex** must be installed to generate **pdf** file.

On Mac OS X, **pdflatex** may not be found in the **PATH** from Stata launched shell.
In that case, launching Stata from terminal may solve the problem. For a older version
of **pandoc** which supports option --latex-engine, you may use pargs(--latex-engine=fullpath).
For the latest **pandoc**, although the documentation suggests that you may specify full 
path in the --pdf-engine option, it does not seem to work.

## A dynamic document with Stata estimation results [example2.md](examples/example2.md) 

### Produce html file [ex2.html](examples/ex2.html):

```
dynpandoc example2.md, sav(ex2.html) replace pargs("--self-contained")
```

### Produce docx file [ex2.docx](examples/ex2.docx):

```
dynpandoc example2.md, sav(ex2.docx) replace
```

Note in the default settings, the estimation table lines are wrapped in the generated 
[ex2.docx](examples/ex2.docx). We can solve the problem by using a 
[reference.docx](examples/reference.docx) to set the margin size to be narrow.
 
```
dynpandoc example2.md, sav(ex2better.docx) pargs("--reference-doc=reference.docx") replace
```
 
There are no wrapped lines in the generated [ex2better.docx](examples/ex2better.docx)  
You may use reference.docx to change the styles of other elements in the docx file, 
for example, Body Text, First Paragraph, Title, Subtitle, Headings, etc. See 
the **docx** section in [pandoc documentation](https://pandoc.org/MANUAL.html) for details.   
 
## A dynamic slide show [slide1.md](examples/slide1.md)

### Produce html slide deck [sd.html](examples/sd.html) using **slidy**:

```
dynpandoc slide1.md, sav(sd.html) to(slidy) replace pargs("--self-contained")
```
