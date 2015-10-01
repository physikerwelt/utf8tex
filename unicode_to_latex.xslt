<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="1.0">
<xsl:template match="/charlist">
    <xsl:text>
unicode_to_latex = {
</xsl:text>
    <xsl:for-each select="character">
        <xsl:variable name="codepoint" select="./@id"/>
        <xsl:if test="string-length(latex)&gt;1">
        <xsl:text>    u"\u</xsl:text><xsl:value-of select="substring($codepoint, 3)" /><xsl:text>": "</xsl:text><xsl:value-of select="replace(replace(latex, '\\', '\\\\'), '&quot;', '\\&quot;')"/><xsl:text>",
</xsl:text>
        </xsl:if>
    </xsl:for-each>
    <xsl:text>}
</xsl:text>
</xsl:template>
</xsl:stylesheet>
