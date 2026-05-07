<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- Импорт стандартного модуля -->
    <xsl:import href="plugin:org.dita.pdf2:xsl/fo/topic2fo.xsl"/>

     <xsl:param name="customizationDir"/>

     <!-- Титульный лист -->
  <xsl:template name="createFrontMatter_1.0">
    <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="__force__page__count">
      <fo:flow flow-name="xsl-region-body">

        <fo:table table-layout="fixed" width="100%" height="100%">
                    <<fo:table-body>
                        <!-- Верх - Логотип -->
                        <<fo:table-row height="20%">
                            <<fo:table-cell display-align="before">
                                <fo:block text-align="center">
                                    <fo:external-graphic src="url('{$customizationDir}/images/logo-main.svg')" content-width="40mm"/>
                                </fo:block>
                            </fo:table-cell>>
                        </fo:table-row>>
                        <!-- Центр - Основной текст -->
                        <fo:table-row height="50%">
                            <fo:table-cell display-align="before">
                                <fo:block text-align="center">
                                    <fo:block font-family= "Roboto" font-size="18pt" font-weight="bold" space-after="10pt">
                                        <xsl:text>Наименование изделия</xsl:text>
                                        <!--<xsl:value-of select="$fullname"/>-->
                                        <xsl:text>Модель</xsl:text>
                                        <!--<xsl:value-of select="$model"/>-->
                                    </fo:block>
                                    <fo:block font-family= "Roboto" font-size="16pt" font-weight="bold" space-after="10pt">
                                        <xsl:text>Наименование документа</xsl:text>
                                        <!--<xsl:value-of select="$doc_name"/>-->
                                    </fo:block>
                                </fo:block>
                            <fo:table-cell>
                        </fo:table-row>>
                        <!-- Низ -->
                        <<fo:table-row height="30%">
                            <<fo:table-cell display-align="before">
                                <fo:block text-align="center">
                                    <fo:block space-after="10pt">
                                        <fo:external-graphic src="url('{$customizationDir}/images/eac.svg')" content-width="15mm"/>
                                    </fo:block>
                                    <fo:block space-after="10pt">
                                        <xsl:text>ОКПД2 </xsl:text>

                                        <!--<xsl:value-of select="$okpd2"/>-->
                                    </fo:block>
                                    <fo:block>
                                        <xsl:text>Наименование компании</xsl:text>
                                        <!--<xsl:value-of select="$company"/>-->
                                    </fo:block>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>>
                    </fo:table-body>>
                </fo:table-body>

      </fo:flow>
    </fo:page-sequence>
  </xsl:template>


</xsl:stylesheet>