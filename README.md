# README

The build process in this repository creates the suite of subset schema artefacts distilled from either UBL 2.2, or UBL 2.3 CSPRD02.

The demonstration environment provided in this repository is included courtesy of the [DBE Core Oy Finland https://dbecore.com](https://dbecore.com) project, with my many thanks.

## Contributions

Contributions are welcome provided that they can be incorporated into the repository within the constraints of the [license and disclaimer information](https://github.com/CraneSoftwrights/ubl-subset-schema/blob/master/LICENSE.md).

## Licensing

Please see the [LICENSE](https://github.com/CraneSoftwrights/ubl-subset-schema/blob/master/LICENSE.md) file for the description of the license terms and disclaimers.

## Further Description of this Repository

Fork this repository in order to create subset XSD and JSON validation artefacts (XSD and JSON) and documentation for either UBL 2.2 or UBL 2.3 CSPRD02 from a subset specification found in online UBL Google spreadsheets:
  - genericode serialization
  - XSD schemas
  - JSON schemas
  - ODS and XLS spreadsheets
  - HTML summary reports with and without indicating excluded UBL components

Engage GitHub Workflow Actions for this repository by going to the "Actions" tab in your repository and giving GitHub permission to run the repository's actions.

Copy the [`subsetUBLSchemas-DBEcore.sh`](subsetUBLSchemas-DBEcore.sh) file to create your own subset generation invocation file along the lines of `subsetUBLSchemas-myProject.sh`.

Modify the [`subsetUBLSchemas-github.sh`](subsetUBLSchemas-github.sh) invocation to point to your subset generation invocation file `subsetUBLSchemas-myProject.sh` (or whatever it is that you chose).

Do an initial push of these changes to trigger the creation of the DBEcore 0.1 subset schemas and documentation in order to ensure that the process is running before changing your invocation for your own files. After less than 15 minutes download the generated package of schemas and inspect `archive-only-not-in-final-distribution/artefacts.exitcode.*.txt` for successful completion the console report in `archive-only-not-in-final-distribution/artefacts.console.*.txt` for successful completion.

There are configuration environment variables to set:

`version=0.1`
- your package version

`UBLversion=2.2`
- the version of UBL (either "2.2" or "2.3") that you are subsetting

`libGoogle=`[`https://docs.google.com/spreadsheets/d/1bWAhvsb83PvkdGeMvFXiVVSWKCIZXsoiCMLhgUrHFzY`](https://docs.google.com/spreadsheets/d/1bWAhvsb83PvkdGeMvFXiVVSWKCIZXsoiCMLhgUrHFzY)
- the URL of yur Google spreadsheet for the common library (be sure not to include the "/edit..." at the end of the browser bar)

`docGoogle=`[`https://docs.google.com/spreadsheets/d/1Q_-5hKiUkshJP-3yEI00NTmIf0r5I091nYRNWxxksPQ`](https://docs.google.com/spreadsheets/d/1Q_-5hKiUkshJP-3yEI00NTmIf0r5I091nYRNWxxksPQ)
- the URL of your Google spreadsheet for the documents (be sure not to include the "/edit..." at the end of the browser bar)

`copyright="Subset copyright not asserted; Portions copyright &#169; OASIS Open"`
- a copyright statement asserted regarding the subset being created

`configDirectory=DBEcore`
- the subdirectory in which your configuration files are placed

`title=DBEcore subset of UBL 2.2`
- the title of your project to put at the top of the HTML documentation reports

`package=DBEcore-subset-UBL-2.2`
- the package name of your project to use in file name composition

`subsetColumn=DBECoreSubset`
- the name of the column of your spreadsheets that specifies the particular subset being built

`subsetDocsRegex="(^UBL-(RequestForQuotation|Quotation|Order|OrderResponse|OrderChange|OrderCancellation|ApplicationResponse)-2.2$)"`
- the regular expression against which the documents are checked to be included in the subset generation (note that the document names begin with "UBL-" and end with the UBL version number)

To determine if the generation was successful, look in the `archive-only-not-in-final-distribution` directory for these files summarizing any problems with the process:
- `artefacts.exitcode.{label}.txt` - exit code from the execution of the Ant build script
- `artefacts.console.{label}.txt` - console log of the execution of the Ant build script
- `check-{package}-{label}-ubl-{UBL-version}.html` - report of any problems with your choices in making the specification

If there are no errors then the XSD schemas, JSON schemas, and HTML reports all will be generated and found in the ZIP file.

---

Documentation INCOMPLETE!!!

---

## Offline use for production purposes by project editors

The document model genericode files are generated from the ODS files, preserved in this Git repository for archived reference, and copied to the results directory:
- [`UBL-Entities-2.3.gc`]( UBL-Entities-2.3.gc )
- [`UBL-Signature-Entities-2.3.gc`]( UBL-Signature-Entities-2.3.gc )

Each revision is described by the following configuration files:
- target identification when converting ODS to genericode
  - [`ident-UBL.xml`]( ident-UBL.xml ) 
  - [`ident-UBL-Signature.xml`]( ident-UBL-Signature.xml )
- XSD and JSON schema configuration
  - [`config-UBL.xml`]( config-UBL.xml )
    - IMPORTANT NOTE: there is version information in a comment at the top of this configuration file that, when changed, must be manually added to comments in the eight `UBL-*.xsd` XSD schema fragments found in the directory [`raw/xsd/common`]( raw/xsd/common )
    - `  Library:           OASIS Universal Business Language (UBL) 2.3 *VERSION*`
    - `                     http://docs.oasis-open.org/ubl/*VERSION*-UBL-2.3/`
    - `  Release Date:      *DATE*`
  - [`config-UBL-Signature.xml`]( config-UBL-Signature.xml )
- CVA master file for code list second-pass validation
  - [`UBL-CVA-Skeleton.cva`]( UBL-CVA-Skeleton.cva )
- shell wrapper for generated CVA Schematron pattern
  - [`UBL-DefaultDTQ-shell.sch`]( UBL-DefaultDTQ-shell.sch )
- spell-check word list (each line is a word not in the dictionary that is allowed to be in UBL, including misspellings from previous versions of UBL that cannot be repaired due to backward compatibility)
  - [`spellcheck-UBL.txt`]( spellcheck-UBL.txt )
- Google bug-avoidance model name massage directives
  - [`massageModelName.xml`]( massageModelName.xml )
- documentary ODS template skeleton for generating spreadsheet results
  - [`skeletonDisplayEditSubset.ods`]( skeletonDisplayEditSubset.ods )

Installed software requirements invoked from Ant script using `exec`:
- `soffice` - LibreOffice, OpenOffice, or equivalent
- `aspell` - spell checker
- `sh`, `tee`, `wc`, `grep`, `sed` - typical POSIX applications

Subdirectories:
- [`os-UBL-2.0`]( os-UBL-2.0 ) - code list subdirectory copied from released version of UBL 2.0
- [`os-UBL-2.1`]( os-UBL-2.1 ) - code list subdirectory copied from released version of UBL 2.1
- [`os-UBL-2.2`]( os-UBL-2.2 ) - code list subdirectory copied from released version of UBL 2.2
- [`raw`]( raw ) - pre-populated content of the results directory with skeleton contents
  - [`raw/cl`]( raw/cl ) - code list content from having run the code list tooling and results here:
    - https://www.oasis-open.org/committees/document.php?document\_id=67039 - tooling
    - https://www.oasis-open.org/committees/document.php?document\_id=67038 - results
    - the `master-code-list-UBL-*.xml` file records the input information to the code list generation 
  - [`raw/json`]( raw/json ) - sample JSON instances converted from the sample XML instances
  - [`raw/json-schema`]( raw/json-schema ) - hand-authored JSON Schema fragments
  - [`raw/mod`]( raw/mod ) - hand-authored model documentation fragments
  - [`raw/val`]( raw/val ) - demonstration validation environment and validation of the XML samples
  - [`raw/xml`]( raw/xml ) - sample XML instances
  - [`raw/xsd`]( raw/xsd ) - hand-authored XML Schema fragments
- [`utilities`]( utilities ) - tools used to generate outputs

Comparisons to old versions of UBL are generated as DocBook files for inclusion in the hub document. These old versions are the final genericode models for the particular version being compared. So, for UBL 2.3 csprd03 the comparisons are to:
- [`UBL-Entities-2.3-csprd02.gc`]( UBL-Entities-2.3-csprd02.gc )
- [`UBL-Signature-Entities-2.3-csprd02.gc`]( UBL-Signature-Entities-2.3-csprd02.gc )
- [`UBL-Entities-2.2.gc`]( UBL-Entities-2.2.gc )
- [`UBL-Signature-Entities-2.2.gc`]( UBL-Signature-Entities-2.2.gc )

Outputs:
- model check of naming and design rules against previous release of 2.3 and against 2.2
  - `check-ubl-2.3-*-ubl-2.3-csprd02.html`
  - `check-ubl-2.3-*-ubl-2.2.html`
- model check of naming and design rules for the signature extension
  - `check-ubl-signature-2.3-*.html`
- differences between versions of document models expressed as DocBook for inclusion in the hub document
  - `old2newDocBook-UBL-2.3-*-UBL-2.3-csprd02-documents-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.3-csprd02-library-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.2-documents-ent.xml`
  - `old2newDocBook-UBL-2.3-*-UBL-2.2-library-ent.xml`
  - `old2newDocBook-UBL-Signature-documents-ent.xml`
  - `old2newDocBook-UBL-Signature-library-ent.xml`
- summary use of words in Dictionary Entry Names (each line is the word followed by the version of UBL in which the word is used)
  - `wordlist-UBL.txt`
- diagnostic list of DEN words not found in the dictionaries or spell check supplement (should be empty)
  - `unexpectedWords.txt`
- conversion of genericode to ODS and from ODS to XLS
  - `mod/UBL-Entities-2.3.ods`
  - `mod/UBL-Entities-2.3.xls`
  - `mod/UBL-Signature-Entities-2.3.ods`
  - `mod/UBL-Signature-Entities-2.3.xls`
- generated documentation of all of the document models
  - `mod/summary/reports/`
- generated OASIS Context/Value Association expression of code list validation and its documentation
  - `cva/UBL-DefaultDTQ-2.3.cva`
  - `cva/UBL-DefaultDTQ-2.3.html`
- generated complete suite of XML schemas (combined with authored fragments)
  - `xsd/`
- generated runtime copy of XML schemas (no annotations in the generated fragments)
  - `xsdrt/`

The build process runs the [`produceUBLschemas.xml`]( produceUBLschemas.xml ) Ant script and is invoked as follows when running offline (using timestamp checking for selective building) and not on git:
- `sh produceUBLSchemas-2.3.sh ../results stage label`
  - pre-existing target directory (without trailing "/")
  - stage (e.g. "csd02wd03", "csprd01", "os", etc.; note that the stage "github" is for interim use and triggers on GitHub a build of everything without checking timestamps)
  - label (e.g. "CCyymmdd-HHMMz" UTC time as in "20200406-1450z")

When git runs the build process these invocation arguments are used to build everything (no timestamp checking on github):
- `sh produceUBLSchemas-2.3.sh target github CCyymmdd-HHMMz`

Note that because the stage variable is used in the naming of files, the final work product cannot be built using git. Only interim test work products can be built using git. The final work product must be made offline using the appropriate stage string value.

The build result (after about 25 minutes on GitHub) in the target directory:
- `artefacts-UBL-2.3-{stage}-{label}/` - distribution artefacts
- `artefacts-UBL-2.3-{stage}-{label}/archive-only-not-in-final-distribution/` - archive artefacts

Note that in the archive directory are the files:
- `artefacts.console.{label}.txt` - console log of the execution of the Ant build script
- `artefacts.exitcode.{label}.txt` - exit code from the execution of the Ant build script

Diagnostic execution triggered by the creating text files (contents are irrelevant; delete the file to restore normal operation):
- `skip-gc.txt` - use the UBL-Entities-2.3.gc file as given without regenerating it (saves 12 minutes)
- `skip-html.txt` - skip the creation of the HTML reports (saves 240Mb and 10 minutes)

## Housekeeping

The return ZIP file is doubly-zipped, once on the web site to reduce storage costs (300Mb down to 30Mb), and once by GitHub to return the artefacts from the server. Once downloaded, please delete the download artefact off of GitHub to reduce storage costs.

## Contact

Please send questions or comments about 
[OASIS TC GitHub repositories](https://www.oasis-open.org/resources/tcadmin/github-repositories-for-oasis-tc-members-chartered-work) 
to the [OASIS TC Administrator](mailto:tc-admin@oasis-open.org).  For questions about content in this 
repository, please contact the TC Chair or Co-Chairs as listed on the the UBL TC's 
[home page](https://www.oasis-open.org/committees/ubl/).
