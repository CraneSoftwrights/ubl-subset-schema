@echo off

echo UBL signature extension...
echo ...checking...
java -jar ../saxon9he/saxon9he.jar -o:checkUBL.html -s:mod/UBL-Signature-Entities-2.1.gc -xsl:../Crane-checkgc4obdndr.xsl config-uri=../config-ubl-2.1-ext.xml base-gc-uri=UBL-Entities-2.1.gc base-config-uri=../config-ubl-2.1.xml "title-suffix=Demo UBL Signature" "change-suffix=Demo" common-library-singleton-model-name=UBL-SignatureLibrary-2.1 
if %errorlevel% neq 0 goto :done

echo ...building... 
java -jar ../saxon9he/saxon9he.jar -s:mod/UBL-Signature-Entities-2.1.gc -xsl:../Crane-gc2obdndr.xsl -o:junk.out config-uri=../config-ubl-2.1-ext.xml base-gc-uri=UBL-Entities-2.1.gc base-config-uri=../config-ubl-2.1.xml common-library-singleton-model-name=UBL-SignatureLibrary-2.1 qdt-for-UBL-2.1-only=yes

echo UBL documents...
echo ...checking...
java -jar ../saxon9he/saxon9he.jar -o:checkUBL.html -s:mod/UBL-Entities-2.1.gc -xsl:../Crane-checkgc4obdndr.xsl config-uri=../config-ubl-2.1.xml "title-suffix=Demo UBL" "change-suffix=Demo" old-uri=UBL-Entities-2.0.gc "change-suffix=Version 2.0" docbook-common-uri=summary/diff-2.0-common-db.xml docbook-maindoc-uri=summary/diff-2.0-maindoc-db.xml
if %errorlevel% neq 0 goto :done

echo ...building...
java -jar ../saxon9he/saxon9he.jar -s:mod/UBL-Entities-2.1.gc -xsl:../Crane-gc2obdndr.xsl -o:junk.out config-uri=../config-ubl-2.1.xml qdt-for-UBL-2.1-only=yes
if %errorlevel% neq 0 goto :done

echo ...summarizing...
java -jar ../saxon9he/saxon9he.jar -o:summary/junk.out -s:mod/UBL-Entities-2.1.gc -xsl:../Crane-gc2obdsummary.xsl config-uri=../config-ubl-2.1.xml "title-prefix=Demo UBL"  "subset-model-regex=UBL-Invoice-2.1" "copyright-text=Copyright &#169; OASIS Open"
if %errorlevel% neq 0 goto :done

:done