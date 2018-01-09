*! version 1.0.0  03jan2018

program stpandoc
	version 15
	
	syntax anything, SAVing(string) [		///
				REPlace				///
				nomsg				///
				from(string)		///
				to(string)			///
				path(string)		///
				pargs(string asis)	///
				]

	tokenize `"`anything'"'
	local srcfile `"`1'"'
	local fn2 `"`2'"'
	if ("`fn2'"!="") {
		di "invalid syntax"
		exit 198
	}
	confirm file `"`srcfile'"'
	
	local destfile = strtrim("`saving'")

	mata: (void)pathresolve("`c(pwd)'", "`destfile'", "destfile") 
	
	local issame = 0
	mata: (void)filesarethesame("`srcfile'", "`destfile'", "issame")
	
	if ("`issame'" == "1") {
di in error "target file can not be the same as the source file"
		exit 602			
	}
		
	if ("`replace'" == "") {
		confirm new file `"`destfile'"'
	}

	local cmd = "pandoc"
	if ("`path'" != "") {
		mata: (void)pathresolve("`path'", "`pandoc'", "cmd") 
	}
	
	if ("`from'" == "") {
		mata:find_markup_format("`srcfile'", "from")
		if ("`from'" == "" | "`from'" == "unknown") {
			local from = "markdown"
		}
	}
	
	if ("`to'" == "") {
		mata:find_markup_format("`destfile'", "to")
		if ("`to'" == "" | "`to'" == "unknown") {		
			local to = "html"
		}
	}

    tempfile tmpfile		
	if (strlower("`to'") == "pdf") {
		local tmpfile = "`tmpfile'.pdf"	
		local to = "latex"
	}
	
	local execmd = `"`cmd' `srcfile' -s -o `tmpfile' -f `from' -t `to' `pargs'"'
	qui shell `execmd'	
	qui copy "`tmpfile'" "`destfile'", replace
	cap erase "`tmpfile'"
	
    if ("`msg'" == "") {
		if(substr("`destfile'", 1, 1)=="/") {
			local flink = subinstr("file:`destfile'", " ", "%20", .)			
		}
		else {
			local flink = subinstr("file:/`destfile'", " ", "%20", .)
		}    
di in smcl `"successfully converted {browse "`destfile'"}"'             
    }
end

mata:
string scalar _find_markup_format(string scalar file)
{
	string scalar suff
	
	suff = pathsuffix(file)
	
	if(suff == "" || suff==".") {
		return("")
	}
	
	suff = strtrim(strlower(suff))

	if(suff == ".html") {
		return("html")
	}	
	
	if(suff == ".pdf") {
		return("pdf")
	}		
	
	if(suff == ".docx") {
		return("docx")
	}

	if(suff == ".tex") {
		return("latex")
	}
	
	return("unknown")	
}

void find_markup_format(string scalar file, string scalar out)
{
	string scalar fmt
	
	fmt = _find_markup_format(file)
	st_local(out, fmt)
}
end

exit
