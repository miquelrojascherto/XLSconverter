<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:aid5="http://ns.adobe.com/AdobeInDesign/5.0" 
	xmlns:aid="http://ns.adobe.com/AdobeInDesign/4.0/">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="families">
	<Root>
		<xsl:variable name="nfamiles" select="count(//familia)+2" />
		<xsl:value-of select="$nfamiles"/>

		<Table aid:table="table" aid5:tablestyle="Table Style 1" aid:trows="{$filas}" aid:tcols="5">
<!--			<head aid:table="cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="80">Imagen</head>			
			<head aid:table="cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="130">Título</head>			
			<head aid:table="cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="130">Autor</head>
			<head aid:table="cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="50">Año Pub.</head>
			<head aid:table="cell" aid:theader="" aid:crows="1" aid:ccols="1" aid:ccolwidth="80">ISBN</head>
			<xsl:for-each select="libro">
				<cell aid:table="cell" aid:crows="1" aid:ccols="1" aid:ccolwidth="80">
					<xsl:element name="imagen">
						<xsl:attribute name="href">file:///Z:/GRUPS DE TREBALL/ETIQUETATGE CLP/IMAGES/<xsl:value-of select="foto"/>.jpg</xsl:attribute>
					</xsl:element>
				</cell>			
				<cell aid:table="cell" aid:crows="1" aid:ccols="1" aid:ccolwidth="130">
					<xsl:value-of select="titulo"/>
				</cell>			
				<cell aid:table="cell" aid:crows="1" aid:ccols="1" aid:ccolwidth="130">
					<xsl:value-of select="autor"/>
				</cell>			
				<cell aid:table="cell" aid:crows="1" aid:ccols="1" aid:ccolwidth="50">
					<xsl:value-of select="anno-pub"/>
				</cell>			
				<cell aid:table="cell" aid:crows="1" aid:ccols="1" aid:ccolwidth="80">
					<xsl:value-of select="isbn"/>
				</cell>			
			</xsl:for-each>	
			<foot aid:table="cell" aid:tfooter="" aid:crows="1" aid:ccols="4">Peu de Pàgina</foot>
					-->
		</Table>

	</Root>
	</xsl:template>
	
</xsl:stylesheet>