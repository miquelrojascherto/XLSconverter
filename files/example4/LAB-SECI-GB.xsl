<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aid="http://ns.adobe.com/AdobeInDesign/4.0/" xmlns:aid5="http://ns.adobe.com/AdobeInDesign/5.0/" version="1.0">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
   <xsl:template match="/">
      <families>
         <xsl:apply-templates select="FAMILIES/FAMILIA" />
      </families>
   </xsl:template>
   <xsl:template match="FAMILIA">
      <familia>
         <xsl:apply-templates select="NOM_FAMILIA" />
         <xsl:variable name="totalReactius" select="count(REACTIUS/REACTIU)*2 + 1 + count(REACTIUS/REACTIU/ARTICLES/ARTICLE)" />
         <Table aid:table="table" aid:trows="{$totalReactius}" aid:tcols="6" aid5:tablestyle="qcaTable">
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="85.71456692931508" align="right">Product</Celda>
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="94.42716535396818">Reference</Celda>
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="101">Format</Celda>
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="122">Bar Code</Celda>
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="60">Storage</Celda>
            <Celda aid:table="cell" aid:pstyle="head_cell" aid5:cellstyle="head_cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="60">Form</Celda>
            <xsl:apply-templates select="REACTIUS/REACTIU" />
         </Table>
      </familia>
   </xsl:template>
   <xsl:template match="NOM_FAMILIA">
      <Table aid:table="table" aid:trows="1" aid:tcols="1" aid5:tablestyle="enzymTable">
         <Celda aid:table="cell" aid:pstyle="nfami" aid5:cellstyle="fami_cell" aid:theader="" aid:crows="1" aid:ccols="1" align="left" aid:ccolwidth="523.3">
            <xsl:value-of select="." />
         </Celda>
      </Table>
   </xsl:template>
   <xsl:template match="REACTIU">
      <xsl:variable name="positionR" select="position()" />
      <xsl:choose>
         <xsl:when test="$positionR= '1'">
            <Celda aid:table="cell" aid:pstyle="prod_par" aid:crows="1" aid:ccols="4" aid5:cellstyle="prod_cell">
               <xsl:value-of select="NOM_REACTIU" />
            </Celda>
         </xsl:when>
         <xsl:otherwise>
            <Celda aid:table="cell" aid:pstyle="prod_par" aid:crows="1" aid:ccols="4" aid5:cellstyle="prod2_cell">
               <xsl:value-of select="NOM_REACTIU" />
            </Celda>
         </xsl:otherwise>
      </xsl:choose>
      <xsl:variable name="totalFilesImage" select="count(ARTICLES/ARTICLE)+ 2" />
      <Celda aid:table="cell" aid:pstyle="comp" aid:crows="{$totalFilesImage}" aid:ccols="1" aid5:cellstyle="imag_cell">
      <xsl:variable name="temp" select="TEMPERATURA" />
      <xsl:element name="Image">
         <xsl:choose>
           <xsl:when test="$temp= '+15 / +25 ºC'">
             <xsl:attribute name="href">file:///Links/g700.jpg</xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="href">file:///Links/g600.jpg</xsl:attribute>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:element> 

      </Celda>
      <Celda aid:table="cell" aid:pstyle="comp" aid:crows="{$totalFilesImage}" aid:ccols="1" aid5:cellstyle="imag_cell">
         <xsl:variable name="estat" select="EST_FISICO" />
      <xsl:element name="Image">
         <xsl:choose>
           <xsl:when test="$estat='LIQ'">
             <xsl:attribute name="href">file:///Links/g1634.jpg</xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="href">file:///Links/g2200.jpg</xsl:attribute>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:element> 
      </Celda>
      <Celda aid:table="cell" aid:pstyle="tec_par" aid:crows="1" aid:ccols="4" aid5:cellstyle="prod_cell">
         <xsl:apply-templates select="TECNICA" />
      </Celda>
      <xsl:variable name="totalArticles" select="count(ARTICLES/ARTICLE)" />
      <xsl:choose>
         <xsl:when test="$totalArticles= '1'">
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell" />
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="ARTICLES/ARTICLE/REFERENCIA" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="ARTICLES/ARTICLE/FORMAT" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="ARTICLES/ARTICLE/BARCODE" />
            </Celda>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates select="ARTICLES/ARTICLE" />
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="TEMPERATURA">
      <xsl:variable name="temp" select="TEMPERATURA" />
      <xsl:element name="Image">
         <xsl:choose>
           <xsl:when test="$temp= '+15 / +25 ºC'">
             <xsl:attribute name="href">file:///Links/g700.jpg</xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="href">file:///Links/g600.jpg</xsl:attribute>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:element>      
   </xsl:template>

   <xsl:template match="EST_FISICO">
      <xsl:variable name="estat" select="EST_FISICO" />
      <xsl:element name="Image">
         <xsl:choose>
           <xsl:when test="$estat='LIQ'">
             <xsl:attribute name="href">file:///Links/g1634.jpg</xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute name="href">file:///Links/g2200.jpg</xsl:attribute>
           </xsl:otherwise>
         </xsl:choose>
      </xsl:element>  
   </xsl:template>

   <xsl:template match="ARTICLE">
      <xsl:variable name="positionP" select="position()" />
      <xsl:choose>
         <xsl:when test="$positionP = '1'">
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="ref_cell" />
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="ref_cell">
               <xsl:apply-templates select="REFERENCIA" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="ref_cell">
               <xsl:apply-templates select="FORMAT" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="ref_cell">
               <xsl:apply-templates select="BARCODE" />
            </Celda>
         </xsl:when>
         <xsl:otherwise>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell" />
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="REFERENCIA" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="FORMAT" />
            </Celda>
            <Celda aid:table="cell" aid:pstyle="comp" aid:crows="1" aid:ccols="1" aid5:cellstyle="refF_cell">
               <xsl:apply-templates select="BARCODE" />
            </Celda>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:stylesheet>