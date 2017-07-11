#/bin/sh
#
# 	Executable header file for pe class script (OO paradigm)

# REQUIRE (with execution)
# 	none

 # partial class pe
{ 

# FIELDS (OO paradigm)
QFREGEX="" # regex for query form
EVREGEX="" # regex for filter expression
PNREGEX="" # regex for listing package names minus version
CMDQUER="" # query stub
CMDLIST="" # list stub
QS="" # get raw query format input
EF="" # get raw filter input
QFORM="" # init query string
EFORM="" # init filter string

# method psuedo-declarations (can fn defs be overriden?)
#  parameter names are names of required input parameters
#  output parameters or internal member fields are not specified
#	 pe (PARAM1, PARAM2) - CONSTRUCTOR
# 	 pe_qfsb () - query string builder
#	 pe_evsb () - filter string builder
#	 pe_synt () - print syntax (here-doc)
#	 pe_run () - run method
} # /CLASS pe (OO paradigm)

return 0 # special "sh" command to return to sourcing module (OO paradigm)