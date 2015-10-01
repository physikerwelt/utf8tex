<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        version="2.0">
    <xsl:output method="text" indent="no"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="unicode/charlist">
        <xsl:text>unicode,latex&#10;</xsl:text>
        <xsl:for-each select="character">
            <xsl:variable name="codepoint" select="./@id"/>
            <xsl:if test="string-length($codepoint)=6 and (latex or latexmath)">
                <xsl:value-of select="substring($codepoint, 2)"/>
                <xsl:text>,"</xsl:text>
                <xsl:variable name="tex">
                    <xsl:choose>
                        <xsl:when test="mathlatex/@set=unicode-math">
                            <xsl:value-of select="mathlatex"/>
                        </xsl:when>
                        <xsl:when test="mathlatex">
                            <xsl:value-of select="mathlatex"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="latex"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="replace(
                    replace( $tex, '&quot;', '&quot;&quot;' ),
                    '^\s*(.+?)\s*$', '$1')" disable-output-escaping="yes"/>
                <xsl:text>"&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
