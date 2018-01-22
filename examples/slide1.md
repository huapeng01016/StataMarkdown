% Stata slide show example
% Hua Peng
% 15Jan2005

# Reproducible research in Stata is easy

```
<<dd_do>>
sysuse auto
regress weight displacement
<</dd_do>>
```

# Include Stata results

<<dd_do:quietly>>
matrix define eb = e(b)
<</dd_do>>

For every unit increase in displacement, a <<dd_display:%9.4f eb[1,1]>> unit increase in weight is predicted.

# Graph

<<dd_do:quietly>>
scatter weight displacement, mcolor(%30)
<</dd_do>>

<<dd_graph: sav(gr1.svg) replace markdown>>

