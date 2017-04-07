# Argument checking
# RUNNER is the command to run with all its arguments
if( NOT RUNNER )
   message( FATAL_ERROR "Variable RUNNER not defined" )
endif( NOT RUNNER )

# REFERENCE contains the name of the reference output file
if( NOT REFERENCE )
   message( FATAL_ERROR "Variable REFERENCE not defined" )
endif( NOT REFERENCE )

# OUTPUT contains the name of the output file the RUNNER will produce
if( NOT OUTPUT )
   message( FATAL_ERROR "Variable OUTPUT not defined" )
endif( NOT OUTPUT )

# convert the space-separated string to a list
separate_arguments( ARGS )
message( ${ARGS} )

execute_process(
   COMMAND ${RUNNER} ${ARGS}
)
