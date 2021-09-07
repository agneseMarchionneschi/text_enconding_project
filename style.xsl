<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output  method="html" encoding="UTF-8" indent="yes"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Progetto Codifica Testi</title>                
            <!-- riferimento ai file css -->
            <link rel="stylesheet" type="text/css" href="stile.css"/>
            <!-- riferimento ai file js -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
            <script type="text/javascript" src="jquery.js"></script>
            <script type="text/javascript" src="script.js"></script>                            
        </head>
        <body>
            <!-- contenitore -->
            <xsl:element name="div">
                <xsl:attribute name="id">contenitore</xsl:attribute>
                <xsl:apply-templates/>
                <!-- Immagini -->
                <xsl:element name="div">
                    <xsl:element name="img">
                        <xsl:attribute name="src">img/divide2.png</xsl:attribute>
                        <xsl:attribute name="class">divisore</xsl:attribute>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="h2">
                    <xsl:text>Scegli la cartolina che vuoi scoprire</xsl:text>
                </xsl:element>

                <xsl:element name="div">
                    <xsl:attribute name="class">scegli</xsl:attribute>
                    <xsl:element name="img">                
                        <xsl:attribute name="src">img/174F.jpeg</xsl:attribute>
                    </xsl:element> 
                    <xsl:element name="a">
                        <xsl:attribute name="href">#cart1</xsl:attribute>
                        <xsl:element name="input">
                            <xsl:attribute name="type">button</xsl:attribute>
                            <xsl:attribute name="value">174</xsl:attribute>
                            <xsl:attribute name="id">c1</xsl:attribute>
                            <xsl:attribute name="class">btn</xsl:attribute>
                        </xsl:element>
                    </xsl:element> 
                    <xsl:element name="img">
                        <xsl:attribute name="src">img/178F.jpeg</xsl:attribute>
                    </xsl:element>
                        <xsl:element name="a">
                        <xsl:attribute name="href">#cart2</xsl:attribute>
                        <xsl:element name="input">
                            <xsl:attribute name="type">button</xsl:attribute>
                            <xsl:attribute name="value">178</xsl:attribute>
                            <xsl:attribute name="id">c2</xsl:attribute>
                            <xsl:attribute name="class">btn</xsl:attribute>
                        </xsl:element>                            
                    </xsl:element>
                </xsl:element>
            </xsl:element> 
            <div id="about">     
                <h2>Crediti</h2>
                <div class="boxed">
                    <p><b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:resp"/></b><xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:name"/></p>
                    <xsl:for-each select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt">
                        <p><b><xsl:value-of select="tei:resp"/></b><xsl:text> </xsl:text><xsl:value-of select="tei:name"/></p>   
                    </xsl:for-each>
                </div>
            </div>
        </body>
    </html>
</xsl:template>
    
    <!-- Header-->
    <xsl:template match="tei:teiCorpus/tei:teiHeader">
            <xsl:apply-templates/>
    </xsl:template>

    <!-- Introduzione -->
      <xsl:template match="tei:titleStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="id">intestazione</xsl:attribute>
            <xsl:element name="h1"> 
                <xsl:value-of select="tei:title"/>
            </xsl:element>
            <xsl:element name="p"> 
                <xsl:attribute name="class">nota</xsl:attribute> 
                <xsl:value-of select="//tei:projectDesc"/>   
                <xsl:element name="br"/>
            </xsl:element>  
        </xsl:element>         
    </xsl:template>
    
    <!-- INFORMAZIONI COMUNI -->
    <!-- edizione -->
    <xsl:template match="tei:editionStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="class">info</xsl:attribute>
            <xsl:element name="h4"> 
                <xsl:attribute name="class">sing</xsl:attribute>    
                <xsl:text>EDIZIONE: </xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="*">
                    <xsl:element name="li">
                       <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <!-- pubblicazione -->
    <xsl:template match="tei:publicationStmt">
        <xsl:element name="div"> 
            <xsl:attribute name="class">info</xsl:attribute>
            <xsl:element name="h4"> 
                <xsl:attribute name="class">sing</xsl:attribute>    
                <xsl:text>PUBBLICAZIONE: </xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="*">
                    <xsl:element name="li">
                       <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each> 
            </xsl:element>   
            
        </xsl:element>
    </xsl:template>

    <!-- collocazione, descrizione, personaggi e luoghi -->
    <xsl:template match="tei:sourceDesc[1]">
        <xsl:element name="div">
            <xsl:attribute name="class">info</xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">sing</xsl:attribute>
                <xsl:text>COLLOCAZIONE:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="tei:msDesc[1]//tei:msIdentifier/*">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">info</xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">sing</xsl:attribute>
                <xsl:text>DESCRIZIONE:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="//tei:msContents/* | //tei:condition">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/> 
                    </xsl:element>
                </xsl:for-each>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Dimensioni: </xsl:text>
                    </xsl:element>
                    <xsl:number value="9"/>
                    <xsl:text>x</xsl:text>
                    <xsl:number value="14"/> 
                    <xsl:text>cm</xsl:text>
                </xsl:element>
                <xsl:element name="li">
                    <xsl:element name="b">
                        <xsl:text>Numero testi che compongono il corpus: </xsl:text>
                    </xsl:element>
                    <xsl:number value="2"/>
                </xsl:element>
            </xsl:element>
        </xsl:element>
        <xsl:element name="div">
            <xsl:attribute name="class">info</xsl:attribute>
            <xsl:element name="h4">
                <xsl:attribute name="class">sing</xsl:attribute>
                <xsl:text>PERSONAGGI E LUOGHI:</xsl:text>
            </xsl:element>
            <xsl:element name="ul">
                <xsl:for-each select="//tei:person/* | //tei:place/tei:placeName">
                    <xsl:element name="li">
                        <xsl:apply-templates select="."/>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>


        </xsl:element>
    </xsl:template>

    <!-- Box cartoline -->
    <xsl:template match="//tei:TEI">
        <xsl:element name="div"> 
            <xsl:attribute name="id">
                <xsl:value-of select="concat('cart', '')"/>
                <xsl:number level="any"/> 
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Titolo e introduzione cartoline -->
    <xsl:template match="tei:TEI/tei:teiHeader">
         <xsl:element name="div">
            <xsl:element name="img">
                <xsl:attribute name="src">img/divide.png</xsl:attribute>
                <xsl:attribute name="class">divisore</xsl:attribute>
            </xsl:element>
        </xsl:element>
        <p class="not"><b>Rappresentazione: </b><xsl:value-of select="tei:profileDesc/tei:textClass/tei:keywords/tei:term[3]"/></p>
        <p class="not"><b>Titolo dell'opera sul fronte: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:title"/></p>
        <p class="not"><b>Autore dell'opera sul fronte: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:bibl/tei:author/tei:name/tei:surname"/></p>
        <p class="not"><b>Note: </b><xsl:value-of select="tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc/tei:handDesc/tei:handNote/tei:p"/></p>
        <xsl:element name="h2">
            <xsl:value-of select="tei:sourceDesc//tei:title"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="class">nota</xsl:attribute>
                <xsl:value-of select="tei:notesStmt"/>
        </xsl:element>
    </xsl:template>


    <!-- visualizzazione retro immagine -->
    <xsl:template match="//tei:facsimile/tei:surface">
        <xsl:element name="div">
            <xsl:attribute name="class">contimg</xsl:attribute>
            <xsl:element name="div">
                 <xsl:attribute name="class">img</xsl:attribute>
                <xsl:element name="img">    
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute>     
                <xsl:apply-templates/>        
            </xsl:element>
            <xsl:apply-templates/>
         </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <!-- Fronte  -->
    <xsl:template match="tei:figure">
        <xsl:element name="div">
            <xsl:attribute name="class">fronte</xsl:attribute>
            <xsl:element name="b">
            <xsl:text>FRONTE: </xsl:text> 
            </xsl:element>   
            <xsl:value-of select="tei:figDesc[1]"/>
        </xsl:element>
    </xsl:template>

    <!-- Retro  -->
    <xsl:template match="//tei:div[@type='retro']">
         <xsl:element name="div">
            <xsl:attribute name="class">retro</xsl:attribute>
            <xsl:element name="b">
            <xsl:text>RETRO: </xsl:text> 
            </xsl:element>   
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 

    <!-- Indirizzo -->
    <xsl:template match="//tei:div[@type='destination']/tei:p[@style='indirizzo']">
        <xsl:apply-templates/>
    </xsl:template>



    <!-- Francobollo -->
    <xsl:template match="tei:stamp[@n='1']">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:attribute name="class">francobolli</xsl:attribute>
            <xsl:apply-templates />
        </xsl:element>
    </xsl:template>

    <!-- Collegamenti -->
    <xsl:template match="tei:s">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')" />
            </xsl:attribute>
            <xsl:attribute name="class">contenuto</xsl:attribute>  
            <xsl:apply-templates/>
        </xsl:element>        
    </xsl:template>
    
    <!-- Indirizzo  -->
    <xsl:template match="tei:addrLine ">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template> 
    
    <!-- Data e firma -->
    <xsl:template match="tei:dateline | tei:signed">
        <xsl:element name="div">
            <xsl:attribute name="id">
                <xsl:value-of select="translate(@facs, '#', '')"/>
            </xsl:attribute>
            <xsl:attribute name="class">contenuto_dx</xsl:attribute>  
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!-- Contenuto cartolina -->
    <xsl:template match="tei:div[@type = 'retro']/tei:div[@type = 'message']">
        <xsl:element name="div">
            <xsl:attribute name="class">testo_cartolina</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>            
    </xsl:template>

    <!-- Contenuto cartolina n.178 messaggio fronte -->
    <xsl:template match="tei:div[@type = 'fronte']/tei:div[@type = 'message']">
        <xsl:element name="div">
            <xsl:attribute name="class">text</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>            
    </xsl:template>
    
    <!-- Stampe tipografiche rese invisibili -->
    <xsl:template match="tei:div[@type = 'retro']/tei:div[@type = 'typography']">
        <xsl:element name="div">
            <xsl:attribute name="class">invisibile</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>            
    </xsl:template>

    <!-- Parole in grassetto -->
    <xsl:template match="tei:gi">
        <b>
            <xsl:apply-templates/>
        </b>
    </xsl:template>

    <!-- Parole in grassetto -->
    <xsl:template match="tei:respStmt">
        <b>
            <xsl:value-of select="tei:resp"/>
        </b>
        <xsl:apply-templates select="tei:name"/>
    </xsl:template>

    <!-- Gap reso invisibili -->
    <xsl:template match="tei:gap">
         <xsl:element name="div">
            <xsl:attribute name="class">gap</xsl:attribute>
                <xsl:text>[Illeggibile]</xsl:text> 
            <xsl:apply-templates/>
        </xsl:element>            
    </xsl:template>

    <!-- Blocchi resi invisibili -->
    <xsl:template match="//tei:profileDesc | tei:note[@n='1'] | tei:expan | tei:am | //tei:div[@type = 'codice'] | tei:encodingDesc">
        <xsl:element name="div">
            <xsl:attribute name="class">invisibile</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element> 
    </xsl:template>
   
</xsl:stylesheet>        
