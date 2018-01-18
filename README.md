# dynpandoc

**dynpandoc** combines Stata's **dyntext** with **pandoc** to convert a file in one 
markup format to another. It also process Stata's **dynamic tags** to run Stata 
commands, include Stata results, outputs, and graphs.
  
## A dynamic document [ex1.md](examples/ex1.md)

### Produce html file [ex1.html](examples/ex1.html):

```
dynpandoc ex1.md, replace pargs("--self-contained")
```

Note that "--self-contained" is a **pandoc** option to produce a standalone HTML file with no external 
dependencies. 

### Produce docx file [ex1.docx](examples/ex1.docx):

```
dynpandoc ex1.md, sav(ex1.docx) replace
```


### Produce pdf file [ex1.pdf](examples/ex1.pdf):

```
dynpandoc ex1.md, sav(ex1.pdf) replace
```

Note that **LaTex** must be installed to generate **pdf** file.

## A dynamic document with Stata estimation results [ex2.md](examples/ex2.md) 


### Produce html file [ex2.html](examples/ex2.html):

```
dynpandoc ex2.md, replace pargs("--self-contained")
```

### Produce docx file [ex2.docx](examples/ex2.docx):

```
dynpandoc ex2.md, sav(ex2.docx) replace
```

Note in the default settings, the estimation table lines are wrapped in the generated 
[ex2.docx](examples/ex2.docx). We can solve the problem by using a 
[reference.docx](examples/reference.docx) to set the margin size to be narrow.
 
```
dynpandoc ex2.md, sav(ex2better.docx) pargs("--reference-doc=reference.docx") replace
```
 
There are no wrapped lines in the generated [ex2better.docx](examples/ex2better.docx)  
You may use reference.docx to change the styles of other elements in the docx file, 
for example, Body Text, First Paragraph, Title, Subtitle, Headings, etc. See 
the **docx** section in [pandoc documentation](https://pandoc.org/MANUAL.html) for details.   
 
## A dynamic slide show [sd.md](examples/sd.md)

### Produce html slide deck [sd.html](examples/sd.html) using **slidy**:

```
dynpandoc sd.md, sav(sd.html) to(slidy) replace pargs("--self-contained")
```
