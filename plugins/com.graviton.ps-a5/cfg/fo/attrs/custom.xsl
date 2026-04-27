<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">

  <!-- Импортируем стандартные атрибуты DITA-OT PDF2 -->
  <xsl:import href="../../../../org.dita.pdf2/cfg/fo/attrs/basic-settings.xsl"/>

  <!-- ==============================
       РАЗМЕР СТРАНИЦЫ (A5: 148×210 мм)
       ============================== -->
  <xsl:variable name="page.width">148mm</xsl:variable>
  <xsl:variable name="page.height">210mm</xsl:variable>

  <!-- ==============================
       ШРИФТЫ
       ============================== -->
  <xsl:variable name="sans-font-family">Roboto, Arial, Helvetica, sans-serif</xsl:variable>
  <xsl:variable name="serif-font-family">Roboto Slab, Times New Roman, serif</xsl:variable>

  <!-- Основной размер шрифта 10pt -->
  <xsl:variable name="body-font-size">10pt</xsl:variable>

  <!-- ==============================
       ATTRIBUTE-SETS ДЛЯ ЗАГОЛОВКОВ
       ============================== -->

  <!-- Заголовок "Содержание" -->
  <xsl:attribute-set name="tocTitle">
    <xsl:attribute name="font-family" select="$sans-font-family"/>
    <xsl:attribute name="font-size">16pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-before">10mm</xsl:attribute>
    <xsl:attribute name="space-after">10mm</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
  </xsl:attribute-set>

  <!-- Заголовок главы: "Раздел X Название" -->
  <xsl:attribute-set name="chapterTitle">
    <xsl:attribute name="font-family" select="$sans-font-family"/>
    <xsl:attribute name="font-size">14pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-before">12pt</xsl:attribute>
    <xsl:attribute name="space-after">6pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <!-- Подзаголовок: "X.Y Название" -->
  <xsl:attribute-set name="subChapterTitle">
    <xsl:attribute name="font-family" select="$sans-font-family"/>
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-before">8pt</xsl:attribute>
    <xsl:attribute name="space-after">4pt</xsl:attribute>
    <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
  </xsl:attribute-set>

  <!-- ==============================
       ATTRIBUTE-SETS ДЛЯ ПРИМЕЧАНИЙ
       ============================== -->
  <xsl:attribute-set name="noteBlock">
    <xsl:attribute name="font-family" select="$sans-font-family"/>
    <xsl:attribute name="font-size" select="$body-font-size"/>
    <xsl:attribute name="margin-left">10mm</xsl:attribute>
    <xsl:attribute name="margin-right">10mm</xsl:attribute>
    <xsl:attribute name="margin-top">4pt</xsl:attribute>
    <xsl:attribute name="margin-bottom">4pt</xsl:attribute>
    <xsl:attribute name="padding">4pt</xsl:attribute>
    <xsl:attribute name="border">0.5pt solid #999999</xsl:attribute>
    <xsl:attribute name="background-color">#f5f5f5</xsl:attribute>
  </xsl:attribute-set>

  <!-- ==============================
       ПРОЧИЕ ПОЛЕЗНЫЕ ПЕРЕМЕННЫЕ
       ============================== -->

  <!-- Отступы для основного текста -->
  <xsl:variable name="page-margin-top">15mm</xsl:variable>
  <xsl:variable name="page-margin-bottom">15mm</xsl:variable>
  <xsl:variable name="page-margin-left">15mm</xsl:variable>
  <xsl:variable name="page-margin-right">15mm</xsl:variable>

</xsl:stylesheet>