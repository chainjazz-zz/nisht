#!/bin/sh
#
#	pkg-eval(uator)
#	 a CLI front-end to pkg written in FreeBSD "sh"
#	 in style of object-oriented paradigm
# 	 method access pseudo-operator convention:  "_" (trippin' out)
#
#	WHAT TO WATCH FOR IN OO PARADIGM
#		method (function) scope, i.e.
#		local vs class variables, input vs
#		output variables, environment
#		variables, order of REQUIRES and variable
#		declarations/definitions

# REQUIRE (with execution)
#	none

# main ()
{
	readonly PARAM1=$1 # these cannot be accessed from functions
	readonly PARAM2=$2
	
	# instantiate the "pe" class (OO paradigm)
	# and call its "constructor"
	. ./pe.sh ; pe
	pe_synt # display here-doc syntax
	pe_qfsb # build query format string from input
	pe_evsb # build filter expression from input
	
	# sanity check, elaborate on this
	echo "$COMMAND '$EFORM' $QFORM"
	echo
	read -p "Press Enter to continue." FOOBA
	echo
	
	readonly PE_IPARAM1="HITHERE"
	pe_strlen
	
	pe_run # go
}