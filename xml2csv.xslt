<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="/charlist">
    <xsl:text>unicode,latex&#10;</xsl:text>
        <xsl:for-each select="character">
            <xsl:variable name="codepoint" select="./@id"/>
            <xsl:if test="string-length(latex)&gt;1">
                <xsl:value-of select="substring($codepoint, 2)"/>
                <xsl:text>,"</xsl:text>
                <xsl:value-of select="replace(latex, '^\s*(.+?)\s*$', '$1')" disable-output-escaping="yes"/>
                <xsl:text>"&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>