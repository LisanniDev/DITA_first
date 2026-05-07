<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="1.0">

    <!-- Заголовок раздела -->
    <xsl:template match="*[contains(@class, ' topic/title ')]" priority="10">

        <fo:block xsl:use-attribute-sets="topic.title">

            <!-- исключаем frontmatter и введение -->
            <xsl:if test="
            not(ancestor::*[contains(@class, ' frontmatter ')]) and
            not(ancestor::*[contains(@outputclass, 'no-number')])">
                <xsl:variable name="level"
                select="count(ancestor::*[contains(@class, ' topic/topic ')])"/>

                <!-- Уровень 1 -->
                <xsl:choose>
                    <xsl:when test="$level = 1">
                        <xsl:text>Раздел </xsl:text>
                        <xsl:number level="single" count="*[contains(@class, ' topic/topic ')]"/>
                        <xsl:text> </xsl:text>
                    </xsl:when>

                    <!-- Уровни 2-4 -->
                    <xsl:otherwise>
                    <xsl:number
                    level="multiple"
                    count="*[contains(@class, ' topic/topic ')]"
                    format="1.1.1.1"/>
                    <xsl:text> </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <!-- Текст заголовка -->
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Таблица -->
    <xsl:template match="*[contains(@class, ' topic/table ')]/*[contains(@class, ' topic/title ')]" priority="10">

        <fo:block xsl:use-attribute-sets="table.title">

            <xsl:text>Таблица </xsl:text>
            <xsl:number level="any" count="*[contains(@class, ' topic/table ')]"/>
            <xsl:text> - </xsl:text>
            <!-- Текст заголовка -->
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Рисунок -->
    <xsl:template match="*[contains(@class, ' topic/fig ')]/*[contains(@class, ' topic/title ')]" priority="10">

        <fo:block xsl:use-attribute-sets="fig.title">

            <xsl:text>Рисунок </xsl:text>
            <xsl:number level="any" count="*[contains(@class, ' topic/fig ')]"/>
            <xsl:text> - </xsl:text>
            <!-- Текст заголовка -->
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <!-- Нумерация перекрестных ссылок -->
    <xsl:template match="*[contains(@class, ' topic/xref ')]" priority="20">
        <fo:basic-link internal-destination="{@href}">
            <!-- target id -->
            <xsl:variable name="id" select="substring-after(@href, '#')"/>
            <xsl:variable name="target" select="key('id', $id)"/>
            <!-- Таблица -->
            <xsl:choose>
                <xsl:when test="$target[contains(@class, ' topic/table ')]">
                    <xsl:number
                        select="$target"
                        level="any"
                        count="*[contains(@class, ' topic/table ')]"/>
                </xsl:when>

                <!-- Рисунок -->
                <xsl:when test="$target[contains(@class, ' topic/fig ')]">
                    <xsl:number
                        select="$target"
                        level="any"
                        count="*[contains(@class, ' topic/fig ')]"/>
                </xsl:when>

                <!-- Раздел -->
                <xsl:when test="$target[contains(@class, ' topic/topic ')]">
                    <xsl:variable name="level"
                        select="count($target/ancestor::*[contains(@class, ' topic/topic ')])"/>
                    <xsl:choose>
                        <xsl:when test="$level = 1">
                            <xsl:number
                                select="$target"
                                level="single"
                                count="*[contains(@class, ' topic/topic ')]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:number
                                select="$target"
                                level="multiple"
                                count="*[contains(@class, ' topic/topic ')]"
                                format="1.1.1.1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                
                <!-- Иное -->
                <xsl:otherwise>
                    <xsl:value-of select="$id"/>
                </xsl:otherwise>
            </xsl:choose>
        </fo:basic-link>
    </xsl:template>

</xsl:stylesheet>