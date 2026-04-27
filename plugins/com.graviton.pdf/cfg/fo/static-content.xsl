<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<!-- LEFT HEADER -->
<fo:static-content flow-name="xsl-region-before-left">
    <fo:block text-align="left">
        <fo:external-graphic src="url('resources/images/logo.svg')" content-height="8mm"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="key('fullname')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="key('model')"/>
    </fo:block>
</fo:static-content>

<!-- RIGHT HEADER -->
<fo:static-content flow-name="xsl-region-before-right">
    <fo:block text-align="right">
        <xsl:value-of select="key('fullname')"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="key('model')"/>
        <xsl:text> </xsl:text>
        <fo:external-graphic src="url('resources/images/logo.svg')" content-height="8mm"/>
    </fo:block>
</fo:static-content>

<!-- FOOTER -->
<fo:static-content flow-name="xsl-region-after-left">
    <fo:block text-align="left" border-top="0.5pt solid black">
        <fo:page-number/>
    </fo:block>
</fo:static-content>

<fo:static-content flow-name="xsl-region-after-right">
    <fo:block text-align="right" border-top="0.5pt solid black">
        <fo:page-number/>
    </fo:block>
</fo:static-content>

</xsl:stylesheet>