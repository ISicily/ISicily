XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
XXX      README.txt for EpiDoc ODD and schema              XXX
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

What it is:

	The EpiDoc RelaxNG schema and the TEI ODD file from which it is generated.

	**Temporary notice**:
	There are two copies of the ODD in this directory: tei-epidoc-full.xml,
	which is the version that will work with the online Roma tool
	(http://www.tei-c.org/Roma/), and tei-epidoc.xml, which currently does
	not work with Roma because it contains only the `<schemaSpec>` and is
	designed to be x-included to the full ODD (to include Guidelines
	etc.)
	WHENEVER YOU MAKE A CHANGE TO THE FILE tei-epidoc-full.xml (WHICH SHOULD BE
	CONSIDERED THE MASTER VERSION), PLEASE ALSO COPY THE `<schemaSpec>` OVER
	INTO THE FILE tei-epidoc.xml SO THAT FILE IS ALSO UP-TO-DATE.

License:

	The TEI Schema is copyright the TEI Consortium
	(http://www.tei-c.org/Guidelines/access.xml#body.1_div.2).
	To the extent that the EpiDoc ODD and schema have been customized and
	amount to transformative versions of the original schema, they are
	copyright Gabriel Bodard and the other contributors (as listed in
	tei:revisionDesc). See LICENSE.txt for license details.

Technical Requirements:

	The ODD requires the Roma tool (and associated dependencies) to generate
	the RelaxNG schema. The schema (whose canonical released versions live at
	http://www.stoa.org/epidoc/schema/) may be used by any XML editor or
	processing environment to validate EpiDoc XML files.

How to use it:

     1.  To validate your EpiDoc files in an editor:
               If using Oxygen or similar editor to edit XML files, processing instructions such as:

               <?xml-model href="http://www.stoa.org/epidoc/schema/8.21/tei-epidoc.rng"
                         schematypens="http://relaxng.org/ns/structure/1.0"?>
               <?xml-model href="http://www.stoa.org/epidoc/schema/8.21/tei-epidoc.rng"
                         schematypens="http://purl.oclc.org/dsdl/schematron"?>

               at the top of the XML file (above the <TEI> element but below the <?xml?>
               declaration) will instruct the editor to validate against this schema
               (as RelaxNG and Schematron respectively).

               You may also point at a local copy of the tei-epidoc.rng file.

      2. To generate a new version of the schema from the ODD:
               1. edit the ODD (tei-epidoc-full.xml) to make any changes to the EpiDoc schema.
               *NB* that as a matter of policy the EpiDoc schema should be a conformant
               subset of the latest TEI schema (only exceptions being when the dev TEI ODD
               contains changes that will not make it into the TEI release for 1-6 months).
               2. Go to http://www.tei-c.org/Roma/ and "Open existing customization".
               Select tei-epidoc-full.xml from your local file system.
               3. Select "Start".
               4. Select "Schema".
               5. Select "RELAX NG schema (XML syntax)".
               6. Save to your local file system as tei-epidoc.rng (or a project-specific variant).
               7. Test thoroughly (and ask for support on Markup to test) before committing as
               canonical new EpiDoc schema.

      3. How to decide which schema to use:
               1. if your project is complete and more or less static, it is recommend you use
               the most recent numbered release of the schema as of your publication,
               because this file will remain stable indefinitely;
               2. if your project is in active development and you are comfortable following
               the changes in the community fora such as the MARKUP list, and updating
               your XML if the schema changes, you should use the /latest/ release
               (http://www.stoa.org/epidoc/schema/latest/tei-epidoc.rng)
               which will be updated whenever a new schema is released.

See https://sourceforge.net/p/epidoc/wiki/Schema/ for more information on the EpiDoc schema and how to use it.
