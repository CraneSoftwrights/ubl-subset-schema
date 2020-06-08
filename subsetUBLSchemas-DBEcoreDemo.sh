#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, environment, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export version=0.1
export libGoogle=https://docs.google.com/spreadsheets/d/1bWAhvsb83PvkdGeMvFXiVVSWKCIZXsoiCMLhgUrHFzY
export docGoogle=https://docs.google.com/spreadsheets/d/1Q_-5hKiUkshJP-3yEI00NTmIf0r5I091nYRNWxxksPQ
export copyright="Subset copyright not asserted; Portions copyright &#169; OASIS Open"
export configDirectory=DBEcoreDemo
export UBLversion=2.2
export title="DBEcoreDemo subset of UBL 2.2"
export package=DBEcoreDemo-subset-UBL-2.2
export subsetColumn=DBEcoreDemoSubset
export subsetDocsRegex="(^UBL-(RequestForQuotation|Quotation|Order|OrderResponse|OrderChange|OrderCancellation|ApplicationResponse)-2.2$)"

sh subsetUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
