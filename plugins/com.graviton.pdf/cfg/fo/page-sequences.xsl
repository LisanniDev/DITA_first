<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

<xsl:template name="createCover">
    <fo:page-sequence master-reference="cover">

        <fo:flow flow-name="xsl-region-body">

            <!-- Верх -->
            <fo:block text-align="center">
                <fo:external-graphic src="url('resources/images/logo-main.svg')" content-height="26mm"/>
            </fo:block>

            <!-- Центр -->
            <fo:block margin-top="80mm" text-align="center">
                <fo:block font-size="14pt" font-weight="bold">
                    <xsl:value-of select="key('fullname')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="key('model')"/>
                </fo:block>

                <fo:block>
                    <xsl:value-of select="key('doc_name')"/>
                </fo:block>
            </fo:block>

            <!-- Низ -->
            <fo:block margin-top="80mm" text-align="center">
                <fo:external-graphic src="url('resources/images/eac.svg')" content-height="15mm"/>

                <fo:block>
                    ОКПД2 <xsl:value-of select="key('okpd2')"/>
                </fo:block>

                <fo:block>
                    <xsl:value-of select="key('company')"/>
                </fo:block>
            </fo:block>

        </fo:flow>
    </fo:page-sequence>
</xsl:template>

<xsl:template match="*[contains(@outputclass,'cover')]">
    <fo:page-sequence master-reference="cover" initial-page-number="1">

        <!-- без колонтитулов -->

        <fo:flow flow-name="xsl-region-body">
            <xsl:apply-templates/>
        </fo:flow>

    </fo:page-sequence>
</xsl:template>
<xsl:template match="/">
    <fo:root>

        <!-- COVER -->
        <xsl:apply-templates select="//topic[@outputclass='cover']"/>

        <!-- BODY -->
        <fo:page-sequence master-reference="body" initial-page-number="2">

            <xsl:call-template name="insertStaticContents"/>

            <fo:flow flow-name="xsl-region-body">
                <xsl:apply-templates/>
            </fo:flow>

        </fo:page-sequence>

    </fo:root>
</xsl:template>

</xsl:stylesheet>