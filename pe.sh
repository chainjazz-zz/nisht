#!/bin/sh
#
#	Executable definition file for pe class (OO paradigm)

# REQUIRE (with execution)
. ./pe_h.sh # declaration of class "pe" (OO paradigm)

 # partial class pe
{

# METHODS (OO paradigm)
pe () { # Constructor
	CMDQUER="pkg query -e" # front-end stub
	CMDLIST="pkg search -q -g '*'"
	QS=$PARAM1
	EF=$PARAM2
	QFREGEX="[n?v?o?p?m?c?e?w?V?l?s?a?q?k?M?t?R\??#?]"
	EVREGEX="(,|:| )? ?[n?|o?|p?|m?|c?|e?|w?|s?|a?|q?|k?|t?|y?|M?|#?] ?(EQ|LT|NE|IS|IN|GT)? ?[[:alnum:]\*]*"
	PNREGEX="[[:alnum:]_?|-]+[[:alpha:]]{1}[[:alnum:]]+"
	readonly QFREGEX; 
	readonly EVREGEX
} # NOTE: this works because fn defs are executable statements

pe_synt () { # Syntax (here-doc)

	cat <<- "SYNTAX"
	
--------------------
(f)ront(e)end(to)pkg
--------------------

Query (format)
--------------
 SINGLE:
  n(ame) v(ersion) o(rigin) p(refix) m(aint)
 c(omment) d(e)script w(ww) V(ital) l(icense)
  s(ize) a(utomatic) q(arch) loc(k)ed M(essage)
  t(ime) R(epo)
  ?|#[drCFODLUGBbA]
   ? = EXISTS(), # = COUNT()
   d(eps)  r(ev) C(at) F(iles) O(pts) D(irs)
   L(ic) U(sr) G(rp) B(libdep) b(lib) A(nn)
 MULTI (only one of):
 [drCFODLUGBbA][novps] (see above)
   n(ame),o(rig),v(ers),p(ath),s(um)

Evaulation (filter)
-------------------
 SPEC[ ]OP[ ]VAL [,|: ...]
  
  SPEC is one of [nopmcewsaqkMt#] (see above)
  OP is one of IS,IN(glob),EQ,NE,LT,GT(int)
  VAL is glob or int

		SYNTAX
} 

pe_qfsb () { # Builds query format string with regex 
	# NOTE: local variables are exactly local vars and
	# globals before definition will initialize locals and
	# non-locals (input/output) are assumed to exist at runtime
	local QF # string builder
	local QP # token builder 
	local QPP # special tokens builder
	local WORD # regex of raw format string
	 
	 # -o adds IFS, good because spaces are optional
	WORD=$(echo $QS | grep -E -o $QFREGEX)
	
	for I in $WORD; { #or do
		# specifiers with additional flags
		if test ${I} = "s"; 
		then QPP="b"; 
		else QPP=""; 
		fi; 
		
		QP=%${I}${QPP}; # build token
		QF=${QF}${QP}"___"; # build string
	} # or done

	QFORM=$QF # assign built string to actual query format
}

pe_evsb () { # Builds filter string with regex
        local EX # string builder
        local ET # builder token (one for everything)
	local WORD # regex of raw filter string

	# -o adds IFS, good because spaces are optional
	WORD=$(echo $EF | grep -E -o "$EVREGEX");
	EX="%" #  beggining of filter is always a specifier
	
	for I in $WORD; {
		case $I in # in case of operators, else any...
			# token delim is optional in input;
			# operator parsing adds a space  and 
			# concat ops add a space and a %
			#	for the next specifier
				"EQ") EO=" = ";;
				"LT") EO=" < ";;
				"GT") EO=" > ";;
				"NE") EO=" != ";;
				"IS") EO=" ~ ";;
				"IN") EO=" !~ ";;
				",") EO=" && %";;
				":") EO=" || %";;
				*) EO=$I;;
			esac # and that's all folks		
		
		EX="${EX}${EO}"; # build string
        }

        EFORM=$EX; # assign built string to actual filter
}

pe_list () {
# TODO...
}

pe_strlen () {
	PE_OPARAM1=$(echo $PE_IPARAM1 | grep -o -E "." | grep -c -E ".*");
	echo $PE_OPARAM1;
}

pe_run () {
	for I in $(eval "$CMDQUER '$EFORM' $QFORM");
	{
		echo $I;echo;
	}
}



} # /CLASS pe (OO paradigm)


return 0 # special "sh" command to return to sourcing module (OO paradigm)