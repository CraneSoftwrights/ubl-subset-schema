#!/bin/bash

if [ ! -d $1 ]; then mkdir $1 ; fi
if [ ! -d $1/artefacts-$package-v$version-$3 ]; then mkdir $1/artefacts-$package-v$version-$3 ; fi
if [ ! -d $1/artefacts-$package-v$version-$3/archive-only-not-in-final-distribution/ ]; then mkdir $1/$package-v$version-$3/archive-only-not-in-final-distribution/ ; fi

echo Building package...
java -Dant.home=utilities/ant -classpath utilities/saxon/saxon.jar:utilities/ant/lib/ant-launcher.jar:utilities/saxon9he/saxon9he.jar:. org.apache.tools.ant.launch.Launcher -buildfile subsetUBLschemas.xml "-Dtitle=$title" "-DUBLversion=$UBLversion" -DUBLstage=os -Ddir=$1 "-Dpackage=$package" -Dversion=$version -Dstamp=$3 "-Dsubset-model-regex=$subsetDocsRegex" "-Dsubset-column-name=$subsetColumn" "-DlibraryGoogle=$libGoogle" "-DdocumentsGoogle=$docGoogle" "-Dcopyright=$copyright" "-Dconfigdir=$configDirectory" | tee $1/artefacts.console.$3.txt
serverReturn=${PIPESTATUS[0]}

mv $1/artefacts.console.$3.txt $1/artefacts-$package-v$version-$3/archive-only-not-in-final-distribution/
echo $serverReturn >$1/artefacts-$package-v$version-$3/archive-only-not-in-final-distribution/artefacts.exitcode.$3.txt

# reduce GitHub storage costs by zipping results and deleting intermediate files
pushd $1
7z a artefacts-$package-v$version-$3.zip artefacts-$package-v$version-$3
popd

if [ "$1" = "target" ]
then
if [ "$2" = "github" ]
then
if [ "$4" = "DELETE-REPOSITORY-FILES-AS-WELL" ] #secret undocumented failsafe
then
# further reduce GitHub storage costs by deleting repository files

find . -not -name target -not -name .github -maxdepth 1 -exec rm -r -f {} \;
mv $1/artefacts-$package-v$version-$3.zip .
rm -r -f $1

fi
fi
fi

exit 0 # always be successful so that github returns ZIP of results
