<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- Присвоение стилей уровням заголовков -->
    <xsl:template match="*[contains(@class, ' topic/title ')]" priority="10">
    <fo:block>
        <xsl:variable name="level"
            select="count(ancestor::*[contains(@class, ' topic/topic ')])"/>
        <xsl:choose>

            <!-- Уровень 1 -->
            <xsl:when test="$level = 1">
                <fo:block xsl:use-attribute-sets="h1.title">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>

            <!-- Уровень 2 -->
            <xsl:when test="$level = 2">
                <fo:block xsl:use-attribute-sets="h2.title">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:when>

            <!-- Уровень 3+ -->
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="h3.title">
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
    </fo:block>
</xsl:template>

</xsl:stylesheet>