<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    <!-- Настройка стилей -->

    <!-- Шрифты -->
    <!-- Основной -->
    <xsl:param name="body.font.family">Roboto</xsl:param>
    <!-- Моноширинный (найти шрифт!) -->
    <xsl:param name="monospace.font.family">Roboto Mono</xsl:param>
    <!-- Базовый размер -->
    <xsl:param name="body.font.size">10pt</xsl:param>


    <!-- Тело -->
    <xsl:attribute-set name="__body">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.font.family">
        </xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:value-of select="$body.font.size">
        </xsl:attribute>
        <xsl:attribute name="line-height">1.2</xsl:attribute>
    </xsl:attribute-set>

    <!-- Заголовки разделов -->
    <!-- Уровень 1 -->
    <xsl:attribute-set name="h1.title">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.font.family">
        </xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-after.optimum">10pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- Уровень 2 -->
    <xsl:attribute-set name="h2.title">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.font.family">
        </xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before.optimum">6pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">4pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- Уровень 3+ (ниже заимствуют) -->
    <xsl:attribute-set name="h3.title">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$body.font.family">
        </xsl:attribute>
        <xsl:attribute name="font-size">10pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="space-before.optimum">4pt</xsl:attribute>
        <xsl:attribute name="space-after.optimum">2pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>