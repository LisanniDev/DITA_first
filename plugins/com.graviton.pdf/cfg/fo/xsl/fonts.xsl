<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
    <xsl:template name="configureFonts">
        <fo:font-family name="Roboto">
            <fo:font
                embed-url="resources/fonts/Roboto-Light.ttf"
                font-weight="normal"
                font-style="normal"/>
            <fo:font
                embed-url="resources/fonts/Roboto-Regular.ttf"
                font-weight="bold"
                font-style="normal"/>
            <fo:font
                embed-url="resources/fonts/Roboto-Italic.ttf"
                font-style="italic"/>
        </fo:font-family>
    </xsl:template>
</xsl:stylesheet>