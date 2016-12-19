<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no"/>
	<xsl:template match="employees">
		<employees>
			<xsl:for-each select="employee">
				<employee>
					<module>
						<name><xsl:value-of select="name"/></name>
						<job><xsl:value-of select="job"/></job>
					</module>
					<module>
						<addressStreet><xsl:value-of select="addressStreet"/></addressStreet>
						<addressCity><xsl:value-of select="addressCity"/></addressCity>
						<addressPostCode><xsl:value-of select="addressPostCode"/></addressPostCode>
						<phone><xsl:value-of select="phone"/></phone>
						<mobile><xsl:value-of select="mobile"/></mobile>
						<email><xsl:value-of select="email"/></email>
						<homepage><xsl:value-of select="homepage"/></homepage>
					</module>
					<module>
						<company><xsl:value-of select="company"/></company>
					</module>
				</employee>
			</xsl:for-each>
		</employees>
	</xsl:template>
</xsl:stylesheet>