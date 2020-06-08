#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, environment, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export version=0.1
export libGoogle=https://docs.google.com/spreadsheets/d/1WSxDbt-VkjHHOZ6iX6PnjfCa4p76lEoPW-mKC1DR-IM
export docGoogle=https://docs.google.com/spreadsheets/d/1I4Auuk_TS7oowpTcHwhSqEEmr8aYmz-i5UNmPG4CUro
export copyright="Subset copyright not asserted; Portions copyright &#169; OASIS Open"
export configDirectory=UBL-2.3-CSPRD02-Demo
export UBLversion=2.3-CSPRD02
export title="Demonstration subset of UBL 2.3 CSPRD02"
export package=Demonstration-subset-UBL-2.3-CSPRD02
export subsetColumn=Subset
export subsetDocsRegex="(^UBL-(Invoice|ApplicationResponse)-2.3$)"

sh subsetUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
