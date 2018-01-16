# dynpandoc

**dynpandoc** combines Stata's **dyntext** with **pandoc** to convert a file in one 
markup format to another. It also process Stata's **dynamic tags** to run Stata 
commands, include Stata results, outputs, and graphs.
  
## Examples

To produce html file [ex1.html](examples/ex1.html) from markdown file [ex1.md](examples/ex1.md):

```
dynpandoc ex1.md, replace pargs("--self-contained")
```

Note the "--self-contained" is a **pandoc** option to produce a standalone HTML file with no external 
dependencies. 

To produce docx file [ex1.docx](examples/ex1.docx) from markdown file [ex1.md](examples/ex1.md):

```
dynpandoc ex1.md, sav(ex1.docx) replace
```

To produce pdf file [ex1.pdf](examples/ex1.pdf) from markdown file [ex1.md](examples/ex1.md):

```
dynpandoc ex1.md, sav(ex1.pdf) replace
```

Note that **LaTex** must be installed to generate **pdf** file.

