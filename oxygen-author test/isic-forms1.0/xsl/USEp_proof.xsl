<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      exclude-result-prefixes="xs"
      xmlns:usep="http://www.tei-c.org/ns/1.0"
      version="2.0">
    
<!-- line break in output file; improves human readability of xml output -->
<xsl:variable name="newline"><xsl:text>
</xsl:text></xsl:variable>
    
    <xsl:output method="xml" 
        />
        
         <xsl:include href="epidoc-xsl/start-edition.xsl"/>    

    <xsl:template match="/">     
        <html>
            <head><xsl:text disable-output-escaping="yes">&lt;/meta&gt;</xsl:text><title>USEpigraphy Transcription Summary</title>
            <link rel="stylesheet" type="text/css" href="http://dev.stg.brown.edu/projects/usepigraphy/new/global.css" />
	        <link rel="stylesheet" type="text/css" href="http://dev.stg.brown.edu/projects/usepigraphy/new/global-parameters.css" />
</head>
            <body>
                <xsl:apply-templates/>
                     <xsl:apply-templates select="/TEI/text/body/div[@type='edition']"/>

            </body>
        </html>
    </xsl:template>
   
   <xsl:template match="usep:teiHeader">
   
   <h2>Proofreading Output for <xsl:value-of select="usep:fileDesc/usep:titleStmt/usep:title"/></h2>
   
   <p>This page will show you the values you have encoded for inscription metadata and transcription, in a format that makes proofreading easier. Please make sure that your file is valid before proofreading. The proofreading script does not check for validity. Also, note that all items in the list below that are preceded by an asterisk (*) are <i>required</i>. If nothing shows up in the proofreading page, you should go back and check your xml file, and either add missing information or, if the information is there, make sure that it is encoded correctly. 
   </p>

      <hr />
       
        <p>
           <b>*Title: </b> <xsl:value-of select="usep:fileDesc/usep:titleStmt/usep:title"/>
               <br />
           <b>*Machine-Readable (safe) Title: </b><xsl:value-of select="usep:fileDesc/usep:publicationStmt/usep:idno/@xml:id"/>
        </p>     
       <hr />
       
        <p>
            <b><i>Source Description</i></b>
               <br />
            <b>*State: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msIdentifier/usep:region" />
               <br />
            <b>*City: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msIdentifier/usep:settlement" />
               <br />
            <b>*Institution: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msIdentifier/usep:institution" />
               <br />
            <b>Repository: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msIdentifier/usep:repository" />
               <br />
            <b>*Institutional Identifier: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msIdentifier/usep:idno" />
        </p>
       
      <hr />
       
       <p>
           <b><i>Contents</i></b>:
               <br />
           <b>*Genre: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msContents/usep:msItem/@class" />
               <br />
           <b>*Short Description of Content: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:msContents/usep:msItem/usep:p" />
       </p> 
       
      <hr />
       
       <p>
           <b><i>Physical Description</i></b>
               <br />
           <b>*Object Type</b>: <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/@ana" />
               <br />
               <br />
           <b>*Material</b>: <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/@ana" />
               <br />
           <b>*Short description of support: </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:support/usep:p" />
               <br />
               <br />
           <b>*Dimensions: </b> 
           Height - <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:support/usep:dimensions/usep:height" /> / 
           Width - <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:support/usep:dimensions/usep:width" /> / 
           Depth - <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:support/usep:dimensions/usep:depth" />
               <br />
               <br />
           <b>*Condition</b>: <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:condition/@ana" />
           <br />
           <b>Condition gloss:</b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:supportDesc/usep:condition/usep:p" />
       </p>  
       
      <hr />       
       
       <p>
           <b><i>Layout Description</i></b>
               <br />
           <b>*Columns: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:layoutDesc/usep:layout/@columns" />
               <br />
           <b>*Written Lines: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:layoutDesc/usep:layout/@writtenLines" />
               <br />
           <b>Layout Note </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:objectDesc/usep:layoutDesc/usep:layout/usep:p" />
       </p>  
       
      <hr />     
       
       <p>
           <b><i>Hand(s)</i></b>
               <br />
           <b>*Method of writing: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:handDesc/usep:handNote/@ana" />
               <br />
           <b>Note: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:handDesc/usep:handNote/usep:p" />
       </p>       
       
      <hr />     
       
       <p>
           <b><i>Decoration Description</i></b>
               <br />
            <b>*Decoration Note: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:physDesc/usep:decoDesc/usep:decoNote/usep:p" />           
       </p>      
       
      <hr />     
       
       <p>
           <b><i>History</i></b>
               <br />
           <b>Summary: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:summary/usep:note" />
               <br />
               <br />
           <b><i>Origin: </i></b>
               <br />
           <b>*Date: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:origin/usep:date" /> [<b>NotBefore </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:origin/usep:date/@notBefore" /> - <b>NotAfter </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:origin/usep:date/@notAfter" />]
               <br />    
           <b>*PlaceName: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:origin/usep:placeName/text()" /> [<b>ref: </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:origin/usep:placeName/@ref" />]             
               <br />
               <br />
           <b><i>Subsequent Location: </i></b>
               <br />
       <xsl:for-each select="provenance">
           <b>Date: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:date" /> [<b>NotBefore </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:date/@notBefore" /> - <b>NotAfter </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:date/@notAfter" />]
           <br />
           <b>PlaceName: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:placeName/text()" /> [<b>ref: </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:placeName/@ref" />]
           <br />
       </xsl:for-each>
        <xsl:if test="exists(acquisition)">
            <b><i>Acquisition Information:</i></b>
            <br />
            <b>Date: </b><xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:acquisition/usep:date" /> [<b>When </b> <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:provenance/usep:date/@when" />]
            <br />
            <xsl:value-of select="usep:fileDesc/usep:sourceDesc/usep:msDesc/usep:history/usep:acquisition/usep:p"  />]
        </xsl:if>
       </p>   
       
      <hr />     
       
       <p>
           <b><i>*Bibliography</i></b>
           
           <xsl:for-each select="usep:fileDesc/usep:sourceDesc/usep:listBibl/usep:bibl">
           <br /><br />
           <b>ID of work cited: </b><xsl:value-of select="usep:ptr/@target" />
               <br />
           <b>pages for citation: </b><xsl:value-of select="usep:biblScope/text()" />
           </xsl:for-each>    
                     
       </p>      
       
      <hr />     
       
       <p>
           <b><i>*Revision Description</i></b>
               <br />
               <xsl:for-each select="usep:revisionDesc/usep:change">
           <b>Who: </b><xsl:value-of select="@who" />; 
           <b>When: </b><xsl:value-of select="@when" />; 
           <b>Change: </b><xsl:value-of select="text()" />
           </xsl:for-each>
       </p>         
       
      <hr />         
       
   </xsl:template>
    
    <xsl:template match="usep:facsimile">
        
        <p>
            <b><i>Facsimile</i></b>
            
            <xsl:for-each select="usep:graphic">
                    <br />    
                <b>Graphic URL: </b><xsl:value-of select="@url" />
            </xsl:for-each> 
            
            
            <xsl:for-each select="usep:surface">
                    <br />
                    <br />
                <b><i>Surface: </i></b>
                    <br />
                <b>Desc: </b><xsl:value-of select="usep:desc/text()" /> 
                    <br />    
                <b>Graphic URL: </b><xsl:value-of select="usep:graphic/@url" />             
            </xsl:for-each> 
        </p>  
        
       <hr />              
         
    </xsl:template>
    
    <xsl:template match="usep:div[@type='bibliography']">
        <!-- don't do anything -->
    </xsl:template>
    
<!-- 
    <xsl:template match="/usep:TEI/usep:text/usep:body/usep:div">
        <p>               
            
        <xsl:choose>        
        <xsl:when test="@type = 'apparatus'">
            <br />
            <br />
            <b>Apparatus: </b> <xsl:value-of select="usep:p"/>
            <br />
            <br />            
        </xsl:when>
        <xsl:otherwise>
            <br />
            <b>Transcripion </b>
            <br />
            <br />            
            <xsl:apply-templates/>
        </xsl:otherwise>            
        </xsl:choose> 
            
        </p>        
    </xsl:template>
    
    <xsl:template match="//usep:del">
        <xsl:text>[[</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text>]]</xsl:text>
    </xsl:template>
      
    <xsl:template match="//usep:add">
        <xsl:choose>
            <xsl:when test="@place = 'overstrike'">
                <xsl:text>&lt;&lt;</xsl:text>
                <xsl:apply-templates/>
                <xsl:text>&gt;&gt;</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>&apos;</xsl:text>
                <xsl:apply-templates/> 
                <xsl:text>&apos;</xsl:text>                
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//usep:lb">
        <xsl:if test="@type = 'worddiv'">
            <xsl:text>=</xsl:text>
            <xsl:value-of select="$newline"/>
            <xsl:value-of select="$newline"/>
        </xsl:if>
        <xsl:if test="@rend = 'right-to-left'">
            <xsl:text disable-output-escaping="yes">&#x2190;</xsl:text>            
        </xsl:if>
        <br />
    </xsl:template>
       
    <xsl:template match="//usep:g">
        <xsl:choose>
            <xsl:when test="name(..) = 'am'">
                <xsl:value-of select="@type"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>((</xsl:text>
                <xsl:value-of select="@type"/>
                <xsl:text>))</xsl:text>              
            </xsl:otherwise>
        </xsl:choose>        
    </xsl:template>
    
    <xsl:template match="//usep:sic">
        <xsl:if test="name(..) != 'choice'">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates/> 
                <xsl:text>}</xsl:text> 
        </xsl:if>     
    </xsl:template>
    
    <xsl:template match="//usep:corr">
        <xsl:text disable-output-escaping="yes">&#8988;</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text disable-output-escaping="yes">&#x231D;</xsl:text>      
    </xsl:template>
    
    <xsl:template match="//usep:name">
        <xsl:choose>
            <xsl:when test="string-length(@type) != 0">
                <xsl:apply-templates/> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:text disable-output-escaping="yes">[-]</xsl:text>
            </xsl:otherwise>    
        </xsl:choose>            
        
    </xsl:template>
    
    <xsl:template name="gap" match="//usep:gap">
		<xsl:param name="count" select="number(@extent)"/> 
        <xsl:choose>
        	<xsl:when test="@reason = 'illegible'">       
        		<xsl:if test="$count > 0">
	            	<xsl:text>+</xsl:text>
            		<xsl:call-template name="gap">
                		<xsl:with-param name="count" select="$count - 1"/>
            		</xsl:call-template>
        		</xsl:if>    
        	</xsl:when>
            <xsl:when test="@reason = 'ellipsis'">       
                <xsl:text>...</xsl:text>   
            </xsl:when>
            <xsl:when test="@reason = 'omitted'">       
                <xsl:text>(- - -)</xsl:text>   
            </xsl:when>
            <xsl:when test="@reason = 'lost'">       
                <xsl:if test="@unit = 'character' or @unit = 'chars' or @unit = 'char'">
                    <xsl:if test="$count = number(@extent) and (substring(@id,0,4) = 'gap' or substring(@xml:id,0,4) = 'gap')">
                        <xsl:text>[</xsl:text>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="substring(@id,0,4) = 'gap' or substring(@xml:id,0,4) = 'gap'">
                            <xsl:choose>
                                <xsl:when test="@extent = 'unknown'">
                                    <xsl:text>[- - -]</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:if test="$count > 0">
                                        <xsl:text>-</xsl:text>
                                        <xsl:call-template name="gap">
                                            <xsl:with-param name="count" select="$count - 1"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>[-c.</xsl:text><xsl:value-of select="$count"/><xsl:text>-]</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>  
                    <xsl:if test="$count &lt;= 0">
                        <xsl:text>]</xsl:text>
                    </xsl:if>
                </xsl:if> 
                <xsl:if test="@unit = 'line'">
                    <xsl:if test="@extent != 'unknown'">
                        <xsl:text>[</xsl:text>
                    </xsl:if>
                    <xsl:text>- - - - - </xsl:text> 
                    <xsl:if test="substring(@id,0,4) = 'gap' or substring(@xml:id,0,4) = 'gap'">
                        <xsl:text>?</xsl:text>
                    </xsl:if>
                    <xsl:if test="substring(@id,0,4) != 'gap' and substring(@xml:id,0,4) != 'gap'">
                        <xsl:text>-</xsl:text>
                    </xsl:if>
                    <xsl:if test="@extent != 'unknown'">
                        <xsl:text>]</xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:when>
        </xsl:choose>  
    </xsl:template>
    
    <xsl:template match="//usep:abbr">
        <xsl:choose>
            <xsl:when test="name(..) != 'expan'">
                <xsl:apply-templates/> 
                <xsl:text>(- - -)</xsl:text> 
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/> 
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//usep:ex">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="//usep:supplied">
        <xsl:choose>
            <xsl:when test="@reason = 'omitted'">
                <xsl:text>&lt;</xsl:text>
                <xsl:apply-templates/> 
                <xsl:text>&gt;</xsl:text>
            </xsl:when>
            <xsl:when test="@reason = 'lost'">
                <xsl:text>[</xsl:text>
                <xsl:apply-templates/> 
                <xsl:text>]</xsl:text>
            </xsl:when>  
            <xsl:when test="@reason = 'subaudible'">
                <xsl:text>(scil. </xsl:text>
                <xsl:text disable-output-escaping="yes">&lt;span style="font-style:italic"&gt;</xsl:text>
                <xsl:apply-templates/> 
                <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
                <xsl:text>)</xsl:text>
            </xsl:when>            
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="//usep:note">
        <xsl:text>(</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text>)</xsl:text>        
    </xsl:template>
    
    <xsl:template match="//usep:space">
        <xsl:choose>
            <xsl:when test="@extent = 'unknown'">
                <xsl:text>(vac.?)</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>(vac.</xsl:text>
                <xsl:value-of select="@extent"/>                    
                <xsl:text>)</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="unclear" match="//usep:unclear">
        <xsl:param name="count" select="0"/>
        <xsl:if test="$count &lt; number(string-length(.))">
            <xsl:value-of select="substring(.,$count+1,1)"/>
            <xsl:text>&#x0323;</xsl:text>
            <xsl:call-template name="unclear">
                <xsl:with-param name="count" select="$count + 1"/>
            </xsl:call-template>
        </xsl:if> 
    </xsl:template>
    
    <xsl:template name="hi" match="//usep:hi">        
        <xsl:param name="count" select="0"/>
        <span style="font:13pt">        
        <xsl:if test="substring(normalize-space(.),$count+1,1) != ' ' and normalize-space(substring(normalize-space(.),$count+1,1)) != ''">
        <xsl:if test="child::node()/@rend = 'tall' or child::node()/@rend = 'longa'">
            <xsl:attribute name="style">
                <xsl:text disable-output-escaping="yes">font:14pt bold;</xsl:text>
            </xsl:attribute> 
        </xsl:if>
        <xsl:choose>
            <xsl:when test="@rend = 'supraline'">
                <xsl:if test="$count &lt; number(string-length(normalize-space(.)))"> 
                    <xsl:choose>                    
                        <xsl:when test="child::node()/@rend = 'tall' or child::node()/@rend = 'longa'">
                            <xsl:value-of select="upper-case(substring(normalize-space(.),$count+1,1))"/>
                            <xsl:text>&#x0305;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring(normalize-space(.),$count+1,1)"/>
                            <xsl:text>&#x0305;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if> 
            </xsl:when>
            <xsl:when test="@rend = 'ligature'">
                <xsl:if test="$count &lt; number(string-length(normalize-space(.)))">
                    <xsl:choose>                    
                        <xsl:when test="child::node()/@rend = 'tall' or child::node()/@rend = 'longa'">
                            <xsl:value-of select="upper-case(substring(normalize-space(.),$count+1,1))"/>
                            <xsl:if test="($count mod 2) = 0">
                                <xsl:text>&#x0361;</xsl:text>
                            </xsl:if> 
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring(normalize-space(.),$count+1,1)"/>
                            <xsl:if test="($count mod 2) = 0">
                                <xsl:text>&#x0361;</xsl:text>
                            </xsl:if> 
                        </xsl:otherwise>
                    </xsl:choose>                 
                </xsl:if> 
            </xsl:when>  
            <xsl:when test="@rend = 'apex'">
                <xsl:if test="$count &lt; number(string-length(normalize-space(.)))">
                    <xsl:choose>                    
                        <xsl:when test="child::node()/@rend = 'tall' or child::node()/@rend = 'longa'">
                            <xsl:value-of select="upper-case(substring(normalize-space(.),$count+1,1))"/>
                            <xsl:text>&#x0301;</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring(normalize-space(.),$count+1,1)"/>
                            <xsl:text>&#x0301;</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@rend = 'tall' or @rend = 'longa'">
                <xsl:attribute name="style">
                    <xsl:text disable-output-escaping="yes">font:14pt bold;</xsl:text>
                </xsl:attribute>   
                <xsl:if test="$count &lt; number(string-length(normalize-space(.)))">
                    <xsl:value-of select="upper-case(substring(normalize-space(.),$count+1,1))"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="@rend = 'superscript'">
                <xsl:attribute name="style">
                    <xsl:text disable-output-escaping="yes">vertical-align:super;</xsl:text>
                </xsl:attribute> 
                <xsl:if test="$count &lt; number(string-length(normalize-space(.)))">
                    <xsl:value-of select="substring(normalize-space(.),$count+1,1)"/>
                </xsl:if>
            </xsl:when>            
        </xsl:choose>            
        <xsl:choose>
            <xsl:when test="name(child::*[1]) != 'hi' and name(child::*[1]) != ''">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:when test="name(child::*[1]) = 'hi'">
                <xsl:choose>
                    <xsl:when test="child::*[1]/@rend = 'supraline' and $count &lt; number(string-length(child::*[1]))">
                        <xsl:text>&#x0305;</xsl:text>
                    </xsl:when>
                    <xsl:when test="child::*[1]/@rend = 'ligature' and $count &lt; number(string-length(child::*[1])) and ($count mod 2) = 0">
                        <xsl:text>&#x0361;</xsl:text>
                    </xsl:when>  
                    <xsl:when test="child::*[1]/@rend = 'apex' and $count &lt; number(string-length(child::*[1]))">
                        <xsl:text>&#x0301;</xsl:text>
                    </xsl:when>
                    <xsl:when test="child::*[1]/@rend = 'superscript' and $count &lt; number(string-length(child::*[1]))">
                        <xsl:attribute name="style">
                            <xsl:text disable-output-escaping="yes">vertical-align:super;</xsl:text>
                        </xsl:attribute>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
        </xsl:if>            
        </span>  
        <xsl:if test="$count &lt; number(string-length(normalize-space(.)))">
            <xsl:call-template name="hi">
                <xsl:with-param name="count" select="$count + 1"/>
            </xsl:call-template>
        </xsl:if> 
    </xsl:template>
    
    <xsl:template match="//usep:orig">
        <xsl:text disable-output-escaping="yes">&lt;span style="font-style:italic" &gt;</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>
    </xsl:template>
    
    <xsl:template match="//usep:lem">
        <xsl:text disable-output-escaping="yes">&lt;span style="text-decoration:underline" &gt;</xsl:text>
        <xsl:apply-templates/> 
        <xsl:text disable-output-escaping="yes">&lt;/span&gt;</xsl:text>        
    </xsl:template> 
    
 -->
    
    
</xsl:stylesheet>
