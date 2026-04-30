<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- Импорт стандартного модуля -->
    <xsl:import href="plugin:org.dita.pdf2:xsl/fo/topic2fo.xsl"/>

    <!-- Подключение кастомных модулей -->
    <xsl:import href="fonts.xsl"/>
    <xsl:import href="variables.xsl"/>
    <xsl:import href="numbering.xsl"/>
    <xsl:import href="commons.xsl"/>
    <xsl:import href="front-matter.xsl"/>
    <xsl:import href="static-content.xsl"/>


</xsl:stylesheet>