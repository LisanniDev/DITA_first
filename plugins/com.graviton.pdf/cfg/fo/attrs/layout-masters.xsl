<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
    <!-- Титульный лист -->
    <fo:simple-page-master master-name="front-matter"
        page-width="148mm" page-height="210mm"
        margin-top="15mm" margin-bottom="15mm"
        margin-left="10mm" margin-right="10mm">
        <fo:region-body/>
    </fo:simple-page-master>

    <!-- Левый разворот -->
    <fo:simple-page-master master-name="body-left"
        page-width="148mm" page-height="210mm"
        margin-top="15mm" margin-bottom="15mm"
        margin-left="15mm" margin-right="10mm">
        <!-- Обьявление колонтитулов (находятся внутри полей отступов) -->
        <fo:region-before name="header-left" extent="12mm"/>
        <fo:region-body/>
        <fo:region-after name="footer-left" extent="12mm"/>

    </fo:simple-page-master>

    <!-- Правый разворот -->
    <fo:simple-page-master master-name="body-right"
        page-width="148mm" page-height="210mm"
        margin-top="15mm" margin-bottom="15mm"
        margin-left="10mm" margin-right="15mm">
        <!-- Обьявление колонтитулов (находятся внутри полей отступов) -->
        <fo:region-before name="header-right" extent="12mm"/>
        <fo:region-body/>
        <fo:region-after name="footer-right" extent="12mm"/>

    </fo:simple-page-master>

    <!-- Логика разворотов -->
    <fo:page-sequence-master master-name="body">
        <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="body-right" odd-or-even="odd"/>
            <fo:conditional-page-master-reference master-reference="body-left" odd-or-even="even"/>
        </fo:repeatable-page-master-alternatives>
    </fo:page-sequence-master>

</xsl:stylesheet>