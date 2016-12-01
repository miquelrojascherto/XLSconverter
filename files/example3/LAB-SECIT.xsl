<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aid5="http://ns.adobe.com/AdobeInDesign/5.0" 
	xmlns:aid="http://ns.adobe.com/AdobeInDesign/4.0/">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
    <FAMILIES>
      
      <xsl:apply-templates select="FAMILIES/FAMILIA">
      	
      </xsl:apply-templates>   
    </FAMILIES>
</xsl:template>

<xsl:template match="FAMILIA">
   <FAMILIA>
      <xsl:apply-templates select="NOM_FAMILIA" />
   </FAMILIA>
</xsl:template>

<xsl:template match="NOM_FAMILIA">
	<Table aid:table="table" aid:trows="1" aid:tcols="1" aid5:tablestyle="enzymTable">
		<Celda aid:table="cell" aid:pstyle="nfami" aid5:cellstyle="fami_cell" aid:theader="" aid:crows="1" aid:ccols="1" align="left" aid:ccolwidth="523.3">
			<xsl:value-of select = "." />
		</Celda>
	</Table>
</xsl:template>

</xsl:stylesheet>