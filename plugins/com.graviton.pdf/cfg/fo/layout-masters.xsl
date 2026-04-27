<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">
    
<!-- COVER -->
<fo:simple-page-master master-name="cover"
    page-width="148mm" page-height="210mm"
    margin-top="15mm" margin-bottom="15mm"
    margin-left="10mm" margin-right="10mm">
    <fo:region-body/>
</fo:simple-page-master>

<!-- LEFT -->
<fo:simple-page-master master-name="body-left"
    page-width="148mm" page-height="210mm"
    margin-top="15mm" margin-bottom="15mm"
    margin-left="15mm" margin-right="10mm">

    <fo:region-before extent="12mm"/>
    <fo:region-after extent="12mm"/>
    <fo:region-body/>
</fo:simple-page-master>

<!-- RIGHT -->
<fo:simple-page-master master-name="body-right"
    page-width="148mm" page-height="210mm"
    margin-top="15mm" margin-bottom="15mm"
    margin-left="10mm" margin-right="15mm">

    <fo:region-before extent="12mm"/>
    <fo:region-after extent="12mm"/>
    <fo:region-body/>
</fo:simple-page-master>

<!-- Alternating -->
<fo:page-sequence-master master-name="body">
    <fo:repeatable-page-master-alternatives>
        <fo:conditional-page-master-reference master-reference="body-right" odd-or-even="odd"/>
        <fo:conditional-page-master-reference master-reference="body-left" odd-or-even="even"/>
    </fo:repeatable-page-master-alternatives>
</fo:page-sequence-master>

</xsl:stylesheet>