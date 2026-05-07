<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <!-- Размер страницы -->
    <xsl:variable name="page-width">148mm</xsl:variable>
    <xsl:variable name="page-height">210mm</xsl:variable>

    <!-- Поля документа -->
    <xsl:variable name="page-margin-inside">15mm</xsl:variable>
    <xsl:variable name="page-margin-outside">10mm</xsl:variable>
    <xsl:variable name="page-margin-top">20mm</xsl:variable>
    <xsl:variable name="page-margin-bottom">20mm</xsl:variable>

    <!-- Стандартный размер шрифта -->
    <xsl:variable name="base-font-size">10pt</xsl:variable>

    <!-- Стандартный шрифт -->
    <!-- <xsl:variable name="base-font-family">Roboto</xsl:variable> -->

    <!-- Выравнивание текста по ширине -->
    <xsl:attribute-set name="p" use-attribute-sets="common.block">
        <xsl:attribute name="text-align">justify</xsl:attribute>
    </xsl:attribute-set>

    <!-- Выравнивание подписей изображений -->
    <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>