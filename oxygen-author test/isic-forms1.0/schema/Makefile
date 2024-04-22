P5ROOT=http://www.tei-c.org/release/xml
LANGUAGE=en

schema: compiled
	xmllint --noent --xinclude tei-epidoc.xml > tei-epidoc-full.xml
	 roma2 	--localsource=p5subset.xml tei-epidoc-full.xml .
	rm tei-epidoc-full.xml

html:	xml
	for i in ${LANGUAGE} ; do  \
	saxon  -o tei-epidoc_$$i.html \
	tei-epidoc.xml.compiled epidoc-html.xsl  \
	 lang=$$i \
	 doclang=$$i \
	 documentationLanguage=$$i; done 
	rm tei-epidoc.xml.compiled

compiled:
	curl -s -o odd2odd.xsl ${P5ROOT}/tei/stylesheet/odds2/odd2odd.xsl
	curl -s -o p5subset.xml ${P5ROOT}/tei/odd/p5subset.xml
	xmllint --xinclude tei-epidoc.xml | \
	saxon  -o tei-epidoc.xml.compiled - \
		odd2odd.xsl \
	    TEIC=true \
	    localsource=`pwd`/p5subset.xml 

xml: compiled
	saxon -o tei-epidoc-Guidelines.xml  \
	tei-epidoc.xml.compiled ${P5ROOT}/tei/stylesheet/odds2/odd2lite.xsl	  \
	    autoToc=true \
	    lang=${LANGUAGE} \
	    doclang=${LANGUAGE} \
	    documentationLanguage=${LANGUAGE} 

pdftex: xml
	saxon -o tei-epidoc.tex \
	tei-epidoc-Guidelines.xml \
	epidoc-latex.xsl lang=${LANGUAGE} doclang=${LANGUAGE} documentationLanguage=${LANGUAGE} 
	perl -p -i -e 's+http://www.tei-c.org/release/doc/tei-p5-doc/en/html/Images/++' tei-epidoc.tex

pdf: pdftex
	-xelatex tei-epidoc
	-xelatex tei-epidoc
	makeindex -s tei-epidoc.ist tei-epidoc
	-xelatex tei-epidoc
	-xelatex tei-epidoc
	mv tei-epidoc.pdf referenceManual.pdf

examples-schema: compiled
	xsltproc makeexnames.xsl  tei-epidoc.xml.compiled > exnames.xml
	xsltproc --stringparam TEIC true odd2exodd.xsl tei-epidoc.xml.compiled > tei-epidoc-ex.odd
	xsltproc --xinclude --stringparam outputDir ./ --stringparam TEIC true /usr/share/xml/tei/stylesheet/odds/odd2relax.xsl tei-epidoc-ex.odd

validate:
	xmllint --noent --xinclude tei-epidoc.xml > tei-epidoc-full.xml
	onvdl epidoc.nvdl tei-epidoc-full.xml

clean:
	-rm tei-epidoc.xml.compiled exnames.xml tei-epidoc-ex.odd tei-epidoc-examples.rng p5subset.xml tei-epidoc-Guidelines.xml
	-rm odd2odd.xsl p5subset.xml tei-epidoc-full.xml subset.xsl tei-epidoc_en.html