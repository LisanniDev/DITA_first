<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<!-- Верхний логотип -->
<xsl:template match="*[contains(@outputclass,'cover-logo-top')]">
    <fo:block text-align="center">
        <fo:external-graphic src="{image/@href}" content-height="26mm"/>
    </fo:block>
</xsl:template>

<!-- Центр -->
<xsl:template match="*[contains(@outputclass,'cover-center')]">
    <fo:block text-align="center" margin-top="40mm" font-size="14pt" font-weight="bold">
        <xsl:apply-templates/>
    </fo:block>
</xsl:template>

<!-- Низ -->
<xsl:template match="*[contains(@outputclass,'cover-bottom')]">
    <fo:block text-align="center" margin-top="10mm">
        <xsl:apply-templates/>
    </fo:block>
</xsl:template>
<!-- Заголовок раздела -->
<xsl:template match="*[contains(@class,' topic/title ')]">
    <fo:block font-weight="bold">
        <xsl:text>Раздел </xsl:text>
        <xsl:number level="multiple" count="topic"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="."/>
    </fo:block>
</xsl:template>
<!-- Заголовок подраздела -->
<xsl:template match="*[contains(@class,' topic/section ')]/*[contains(@class,' topic/title ')]">
    <fo:block font-weight="bold">

        <xsl:number level="multiple" count="topic|section"/>

        <xsl:text> </xsl:text>

        <xsl:value-of select="."/>

    </fo:block>
</xsl:template>
<!-- Примечание -->
<xsl:template match="*[contains(@class,' topic/note ')]">
    <fo:block>
        <fo:inline font-weight="bold">Примечание - </fo:inline>
        <xsl:apply-templates/>
    </fo:block>
</xsl:template>

</xsl:stylesheet>