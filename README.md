# dynpandoc

**dynpandoc** combines Stata's **dyntext** with **pandoc** to convert a file in one 
markup format to another. It also process Stata's **dynamic tags** to run Stata 
commands, include Stata results, outputs, and graphs.
  
## A dynamic document [ex1.md](examples/ex1.md)

### Produce html file [ex1.html](examples/ex1.html):

```
dynpandoc ex1.md, replace pargs("--self-contained")
```

Note the "--self-contained" is a **pandoc** option to produce a standalone HTML file with no external 
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

## A dynamic slide show [sd.md](examples/sd.md)

### Produce html slide deck [sd.html](examples/sd.html) using **slidy**:

```
dynpandoc sd.md, sav(sd.html) to(slidy) replace pargs("--self-contained")
```
