<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- Подключение переменных -->
    <xsl:import href="variables.xsl"/>

    <xsl:template name="insertStaticContent">
        <!-- Верхние колонтитулы разворота -->
        <!-- Верхний левый -->
        <fo:static-content flow-name="header-left">
            <fo:block text-align="left" font-size="10pt">
                <fo:external-graphic src="url('resources/images/logo.svg')" content-height="8mm"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="key('fullname')"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="key('model')"/>
            </fo:block>
        </fo:static-content>
        <!-- Верхний правый -->
        <fo:static-content flow-name="header-right">
            <fo:block text-align="right" font-size="10pt">
                <xsl:value-of select="key('fullname')"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="key('model')"/>
                <xsl:text> </xsl:text>
                <fo:external-graphic src="url('resources/images/logo.svg')" content-height="8mm"/>
            </fo:block>
        </fo:static-content>

        <!-- Нижние колонтитулы -->
        <!-- Нижний левый -->
        <fo:static-content flow-name="footer-left">
            <fo:block text-align="left" font-size="10pt" border-top="0.5pt solid black">
                <fo:page-number/>
            </fo:block>
        </fo:static-content>
        <!-- Нижний правый -->
        <fo:static-content flow-name="footer-right">
            <fo:block text-align="right" font-size="10pt" border-top="0.5pt solid black">
                <fo:page-number/>
            </fo:block>
        </fo:static-content>
    </xsl:template>

</xsl:stylesheet>