<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:kmehr="http://www.ehealth.fgov.be/standards/kmehr/schema/v1"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xsi:schemaLocation="http://www.ehealth.fgov.be/standards/kmehr/schema/v1 http://www.icure.eu/schema/1.4/ehealth-kmehr/XSD/kmehr_elements-1_4.xsd">
    <xsl:output indent="yes"/>
    <xsl:param name="lnkdirectory"/>

    <xsl:template match="/">
        <annexes>
            <xsl:apply-templates select="*"/>
        </annexes>
    </xsl:template>

    <xsl:template match="kmehr:lnk">
        <xsl:variable name="destination">
            <xsl:value-of select="lnkdirectory"/>
            <xsl:if test="local-name(..)='folder'">
                <xsl:text>folder</xsl:text>
            </xsl:if>
            <xsl:if test="../kmehr:cd[@S='CD-TRANSACTION']">
                <xsl:value-of select="../kmehr:cd[@S='CD-TRANSACTION']"/>
            </xsl:if>
            <xsl:if test="../kmehr:id[@S='ID-KMEHR']">
                <xsl:text>-</xsl:text><xsl:value-of select="../kmehr:id[@S='ID-KMEHR']"/>
            </xsl:if>
            <xsl:if test="../kmehr:id[@S='LOCAL' and @SL='GPSMF-ID']">
                <xsl:text>-</xsl:text><xsl:value-of select="../kmehr:id[@S='LOCAL' and @SL='GPSMF-ID']"/>
            </xsl:if>
            <xsl:value-of select="concat('-',position())"/>
            <xsl:choose>
                <xsl:when test="@MEDIATYPE='text/plain'">
                    <xsl:text>.txt</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='text/rtf'">
                    <xsl:text>.rtf</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='text/html'">
                    <xsl:text>.html</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='application/pdf'">
                    <xsl:text>.pdf</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='image/jpeg'">
                    <xsl:text>.jpeg</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='image/png'">
                    <xsl:text>.png</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(@MEDIATYPE,'image/')">
                    <xsl:text>.</xsl:text><xsl:value-of select="substring(@MEDIATYPE,6)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.data</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <annex>
            <xsl:if test="@TYPE">
                <xsl:attribute name="type">
                    <xsl:value-of select="@TYPE"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@MEDIATYPE">
                <xsl:attribute name="media-type">
                    <xsl:value-of select="@MEDIATYPE"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@SIZE">
                <xsl:attribute name="size">
                    <xsl:value-of select="@SIZE"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:attribute name="destination"><xsl:value-of select="$destination"/></xsl:attribute>
            <xsl:value-of select="text()"/>
        </annex>
    </xsl:template>

    <xsl:template match="*">
        <xsl:apply-templates select="*"/>
    </xsl:template>
</xsl:stylesheet>