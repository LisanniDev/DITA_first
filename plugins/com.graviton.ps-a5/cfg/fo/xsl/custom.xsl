<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:cfg="http://www.dita-ot.org/cfg"
                version="2.0">

  <!-- Импортируем стандартный XSL для PDF2, чтобы наши шаблоны переопределяли его -->
  <xsl:import href="plugin:org.dita.pdf2:xsl/fo/topic.xsl"/>

<!-- Тиульный лист -->
<xsl:template name="createDefaultLayoutMasters">
  <!-- Сначала стандартные мастера -->
  <xsl:apply-imports/>
  <!-- Затем наш мастер для обложки -->
  <fo:simple-page-master master-name="cover" 
                          page-width="148mm" 
                          page-height="210mm">
    <fo:region-body margin="0mm"/>
  </fo:simple-page-master>
</xsl:template>
<xsl:template name="createFrontMatter">
<!-- Определение переменных ключей -->
  <xsl:variable name="fullname">
    <xsl:call-template name="getVariable">
      <xsl:with-param name="id" select="'fullname'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="model">
    <xsl:call-template name="getVariable">
      <xsl:with-param name="id" select="'model'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="doc_name">
    <xsl:call-template name="getVariable">
      <xsl:with-param name="id" select="'doc_name'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="okpd2">
    <xsl:call-template name="getVariable">
      <xsl:with-param name="id" select="'okpd2'"/>
    </xsl:call-template>
  </xsl:variable>
  <xsl:variable name="company">
    <xsl:call-template name="getVariable">
      <xsl:with-param name="id" select="company"/>
    </xsl:call-template>
  </xsl:variable>

  <fo:page-sequence master-reference="cover">
    <fo:flow flow-name="xsl-region-body">
      <!-- Логотип (высота 26 мм, по центру) -->
      <fo:block text-align="center">
        <fo:external-graphic src="url('../../common/artwork/logo-main.svg')" width="100%" height="26mm"/>
      </fo:block>
      <!-- Центральный блок с переменными -->
      <fo:block space-before="50%" text-align="center" font-size="14pt">
        <xsl:value-of select="$fullname"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$model"/>
      </fo:block>
      <fo:block text-align="center" font-size="14pt">
        <xsl:value-of select="$doc_name"/>
      </fo:block>
      <!-- Блок снизу -->
      <fo:block space-before="auto" text-align="center">
        <fo:external-graphic src="url('../../common/artwork/eac.svg')" width="100%" height="15mm"/>
        <fo:block>ОКПД2 <xsl:value-of select="$okpd2"/></fo:block>
        <fo:block><xsl:value-of select="$company"/></fo:block>
      </fo:block>
    </fo:flow>
  </fo:page-sequence>
</xsl:template>
<!--
<!- Регистрация шрифтов Roboto ->
<xsl:variable name="font-dir" select="'file:' || $plugin-dir || '/cfg/common/fonts/'"/>

<xsl:attribute-set name="__fop__roboto-regular">
  <xsl:attribute name="font-family">Roboto</xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="src" select="concat($font-dir, 'Roboto-Regular.ttf')"/>
</xsl:attribute-set>

<xsl:attribute-set name="__fop__roboto-bold">
  <xsl:attribute name="font-family">Roboto</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-style">normal</xsl:attribute>
  <xsl:attribute name="src" select="concat($font-dir, 'Roboto-Bold.ttf')"/>
</xsl:attribute-set>

<xsl:attribute-set name="__fop__roboto-italic">
  <xsl:attribute name="font-family">Roboto</xsl:attribute>
  <xsl:attribute name="font-weight">normal</xsl:attribute>
  <xsl:attribute name="font-style">italic</xsl:attribute>
  <xsl:attribute name="src" select="concat($font-dir, 'Roboto-Italic.ttf')"/>
</xsl:attribute-set>

<xsl:attribute-set name="__fop__roboto-bolditalic">
  <xsl:attribute name="font-family">Roboto</xsl:attribute>
  <xsl:attribute name="font-weight">bold</xsl:attribute>
  <xsl:attribute name="font-style">italic</xsl:attribute>
  <xsl:attribute name="src" select="concat($font-dir, 'Roboto-BoldItalic.ttf')"/>
</xsl:attribute-set>
<!- Колонтитулы левого разворота ->
<fo:simple-page-master master-name="body-left" page-width="148mm" page-height="210mm">
  <fo:region-before region-name="header-left" extent="10mm" display-align="before">
    <fo:block text-align="left">
      <fo:external-graphic src="url('../../common/artwork/logo.svg')"/> 
      <xsl:value-of select="key('keyref', 'fullname')"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="key('keyref', 'model')"/>
    </fo:block>
  </fo:region-before>
  <fo:region-after region-name="footer-left" extent="10mm" display-align="after">
    <fo:block text-align="center" border-top="1pt solid black">
      <fo:page-number/>
    </fo:block>
  </fo:region-after>
  <fo:region-body margin-top="15mm" margin-bottom="15mm"/>
</fo:simple-page-master>
<!- Колонтитулы правого разворота ->
<fo:simple-page-master master-name="body-left" page-width="148mm" page-height="210mm">
  <fo:region-before region-name="header-left" extent="10mm" display-align="before">
    <fo:block text-align="right">
      <xsl:value-of select="key('keyref', 'fullname')"/>
      <xsl:text> </xsl:text>
      <xsl:value-of select="key('keyref', 'model')"/>
      <fo:external-graphic src="url('../../common/artwork/logo.svg')"/> 
    </fo:block>
  </fo:region-before>
  <fo:region-after region-name="footer-left" extent="10mm" display-align="after">
    <fo:block text-align="center" border-top="1pt solid black">
      <fo:page-number/>
    </fo:block>
  </fo:region-after>
  <fo:region-body margin-top="15mm" margin-bottom="15mm"/>
</fo:simple-page-master>
<!- Заголовки разделов ->
<xsl:template match="*[contains(@class, ' topic/title ')]">
  <xsl:variable name="level" select="count(ancestor::*[contains(@class, ' topic/topic ')])"/>
  <xsl:if test="$level = 1">
    <fo:block xsl:use-attribute-sets="chapterTitle">
      <xsl:text>Раздел </xsl:text>
      <xsl:number count="*[contains(@class, ' topic/topic ')]" level="any" from="/"/>
      <xsl:text> </xsl:text>
      <xsl:apply-templates/>
    </fo:block>
  </xsl:if>
</xsl:template>
<!- Заголовки подразделов ->
<xsl:template match="*[contains(@class, ' topic/section ')]/*[contains(@class, ' topic/title ')]">
  <fo:block xsl:use-attribute-sets="subChapterTitle">
    <xsl:number count="*[contains(@class, ' topic/topic ')]" level="any" from="/"/>
    <xsl:text>.</xsl:text>
    <xsl:number count="*[contains(@class, ' topic/section ')]" level="any" from="ancestor::*[contains(@class, ' topic/topic ')][1]"/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template>
<!- Примечание ->
<xsl:template match="*[contains(@class, ' topic/note ')]">
  <fo:block xsl:use-attribute-sets="noteBlock">
    <xsl:text>Примечание – </xsl:text>
    <xsl:apply-templates/>
  </fo:block>
</xsl:template> -->

</xsl:stylesheet>