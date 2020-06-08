#!/bin/bash

if [ "$3" = "" ]; then echo Missing results directory, environment, and dateZ arguments ; exit 1 ; fi

# Configuration parameters

export version=0.1
export libGoogle=https://docs.google.com/spreadsheets/d/1Hh9g4FJPp4R_K1Mj0dtF2k9ALBXpsT-YexQH56PgS3A
export docGoogle=https://docs.google.com/spreadsheets/d/11l-Rl-TS_JuxqVOthHqdF9hn1FsC96Bxl_YDWsk5BsA
export copyright="Subset copyright not asserted; Portions copyright &#169; OASIS Open"
export configDirectory=DemoUBL21Subset
export UBLversion=2.1
export title="Demonstration subset of UBL 2.1"
export package=Demonstration-subset-UBL-2.1
export subsetColumn=SubsetMyProf1
export subsetDocsRegex="(^UBL-(Invoice|ApplicationResponse)-2.1$)"

bash subsetUBLSchemas-common.sh "$1" "$2" "$3" "$4"

exit 0 # always be successful so that github returns ZIP of results
