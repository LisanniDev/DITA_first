<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <xsl:variable name="fullname">
        <xsl:apply-templates select="/" mode="getVariable">
            <xsl:with-param name="id" select="'fullname'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="model">
        <xsl:apply-templates select="/" mode="getVariable">
            <xsl:with-param name="id" select="'model'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="doc_name">
        <xsl:apply-templates select="/" mode="getVariable">
            <xsl:with-param name="id" select="'doc_name'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="okpd2">
        <xsl:apply-templates select="/" mode="getVariable">
            <xsl:with-param name="id" select="'okpd2'"/>
        </xsl:apply-templates>
    </xsl:variable>

    <xsl:variable name="company">
        <xsl:apply-templates select="/" mode="getVariable">
            <xsl:with-param name="id" select="'company'"/>
        </xsl:apply-templates>
    </xsl:variable>

</xsl:stylesheet>