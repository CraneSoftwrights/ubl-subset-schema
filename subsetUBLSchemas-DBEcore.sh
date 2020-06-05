#!/bin/bash

if [ -f artefacts.console.$3.txt ]; then rm artefacts.console.$3.txt ; fi

if [ "$3" = "" ]; then echo Missing results directory, environment, and dateZ arguments ; exit 1 ; fi

version=0.1
libGoogle=https://docs.google.com/spreadsheets/d/1bWAhvsb83PvkdGeMvFXiVVSWKCIZXsoiCMLhgUrHFzY
docGoogle=https://docs.google.com/spreadsheets/d/1Q_-5hKiUkshJP-3yEI00NTmIf0r5I091nYRNWxxksPQ

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile subsetUBLschemas.xml "-Dtitle=DBEcore subset of UBL 2.2" -DUBLversion=2.2 -DUBLstage=os  -Ddir=$1 -Dpackage=DBEcore-subset-UBL-2.2 -Dversion=$version -Dstamp=$3 "-Dsubset-model-regex=(^UBL-(RequestForQuotation|Quotation|Order|OrderResponse|OrderChange|OrderCancellation|ApplicationResponse)-2.2$)" -Dsubset-column-name=DBECoreSubset -DlibraryGoogle=$libGoogle -DdocumentsGoogle=$docGoogle "-Dcopyright=Subset copyright not asserted; Portions copyright &#169; OASIS Open" -Dconfigdir=DBEcore    | tee artefacts.console.$3.txt
serverReturn=${PIPESTATUS[0]}

if [ ! -d $1 ]; then mkdir $1 ; fi
if [ ! -d $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3 ]; then mkdir $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3 ; fi
if [ ! -d $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3/archive-only-not-in-final-distribution/ ]; then mkdir $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3/archive-only-not-in-final-distribution/ ; fi
mv artefacts.console.$3.txt $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3/archive-only-not-in-final-distribution/
echo $serverReturn >$1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3/archive-only-not-in-final-distribution/artefacts.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
pushd $1
7z a artefacts-DBEcore-subset-UBL-2.2-v$version-$3.zip artefacts-DBEcore-subset-UBL-2.2-v$version-$3
popd

if [ "$1" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $1/artefacts-DBEcore-subset-UBL-2.2-v$version-$3.zip .
rm -r -f $1

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
