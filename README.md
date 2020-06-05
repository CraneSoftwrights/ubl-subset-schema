# README

The build process in this repository creates the suite of subset schema artefacts distilled from either UBL 2.2, or UBL 2.3 CSPRD02. It leverages [free developer tools made available by Crane Softwrights Ltd.](http://CraneSoftwrights.com/links/res-git.htm)

The demonstration environment provided in this repository is included courtesy of the [DBE Core Oy Finland https://DBEcoreDemo.com](https://dbecore.com) project, with my many thanks.

## Contributions

Contributions are welcome provided that they can be incorporated into the repository within the constraints of the [license and disclaimer information](https://github.com/CraneSoftwrights/ubl-subset-schema/blob/master/LICENSE.md).

## Licensing

Please see the [LICENSE](https://github.com/CraneSoftwrights/ubl-subset-schema/blob/master/LICENSE.md) file for the description of the license terms and disclaimers.

## The role of UBL subset schemas 

This diagram outlines the role of a subset of UBL schemas in the generation of XML documents, independent of the role of the full UBL schemas when ingesting XML documents:

![The role of a UBL subset schema](README-subset.png "The role of a UBL subset schema")

The three sets of artefacts identified in the diagram are numbered as follows:

1. The full UBL schemas without being subset.
1. The subset UBL schemas supporting only the constructs needed for XML generation, optionally used to structurally-validate the output before it is sent to the recipient.
1. The additional value constraints expressed in XSLT and authored using technologies such as ISO/IEC 19757-3 Schematron, OASIS Context/Value Association (CVA), OASIS genericode, or other means, used both to pre-validate the value constraints before the document is sent to the recipient, and to validate the value constraints after the document is received by the recipient.

A presentation outlining the distinctions between structural and value validation, and the distinctions between W3C Schema and ISO/IEC Schematron is found [here](https://docs.google.com/presentation/d/1KWxFI8Niimv1hoB50L9bDsuMgN_vCjzUDXbct6QG-DA/view).

## Further Description of this Repository

Fork this repository in order to create subset XSD and JSON validation artefacts (XSD and JSON) and documentation for either UBL 2.2 or UBL 2.3 CSPRD02 from a subset specification found in online UBL Google spreadsheets:
  - genericode serialization
  - XSD schemas
  - JSON schemas
  - ODS and XLS spreadsheets
  - HTML summary reports with and without indicating excluded UBL components

Engage GitHub Workflow Actions for this repository by going to the "Actions" tab in your repository and giving GitHub permission to run the repository's actions.

Copy the [`subsetUBLSchemas-DBEcoreDemo.sh`](subsetUBLSchemas-DBEcoreDemo.sh) file to create your own subset generation invocation file along the lines of `subsetUBLSchemas-myProject.sh`.

Modify the [`subsetUBLSchemas-github.sh`](subsetUBLSchemas-github.sh) invocation to point to your subset generation invocation file `subsetUBLSchemas-myProject.sh` (or whatever it is that you chose).

Do an initial push of these changes to trigger the creation of the DBEcoreDemo 0.1 subset schemas and documentation in order to ensure that the process is running before changing your invocation for your own files. After less than 15 minutes download the generated package of schemas and inspect `archive-only-not-in-final-distribution/artefacts.exitcode.*.txt` for successful completion the console report in `archive-only-not-in-final-distribution/artefacts.console.*.txt` for successful completion.

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

`configDirectory=DBEcoreDemo`
- the subdirectory in which your configuration files are placed

`title=DBEcoreDemo subset of UBL 2.2`
- the title of your project to put at the top of the HTML documentation reports

`package=DBEcoreDemo-subset-UBL-2.2`
- the package name of your project to use in file name composition

`subsetColumn=DBEcoreDemoSubset`
- the name of the column of your spreadsheets that specifies the particular subset being built

`subsetDocsRegex="(^UBL-(RequestForQuotation|Quotation|Order|OrderResponse|OrderChange|OrderCancellation|ApplicationResponse)-2.2$)"`
- the regular expression against which the documents are checked to be included in the subset generation (note that the document names begin with "UBL-" and end with the UBL version number)

The configuration file must be edited to reflect...

To determine if the generation was successful, look in the `archive-only-not-in-final-distribution` directory for these files summarizing any problems with the process:
- `artefacts.exitcode.{label}.txt` - exit code from the execution of the Ant build script
- `artefacts.console.{label}.txt` - console log of the execution of the Ant build script
- `check-{package}-{label}-ubl-{UBL-version}.html` - report of any problems with your choices in making the specification

If there are no errors then the XSD schemas, JSON schemas, and HTML reports all will be generated and found in the ZIP file.

---

Documentation INCOMPLETE!!!

---

## Contact

Please send questions or comments about 
[Crane's GitHub repositories](http://CraneSoftwrights.com/links/res-git.htm) 
to [Crane's Administrator](mailto:info@CraneSoftwrights.com).
