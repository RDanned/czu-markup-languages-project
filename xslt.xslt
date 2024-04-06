<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:template match="/restaurant">
        <xsl:text>{</xsl:text>
        <xsl:text>"name": "</xsl:text><xsl:value-of select="name"/><xsl:text>",</xsl:text>
        <xsl:text>"contacts": {</xsl:text>
            <xsl:apply-templates select="contacts"/>
        <xsl:text>},</xsl:text>
        <xsl:text>"menu": {</xsl:text>
            <xsl:apply-templates select="menu"/>
        <xsl:text>},</xsl:text>
        <xsl:text>"team": [</xsl:text>
            <xsl:apply-templates select="team/member"/>
        <xsl:text>],</xsl:text>
        <xsl:text>"reviews": [</xsl:text>
            <xsl:apply-templates select="reviews/review"/>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="contacts">
        <xsl:text>"address": {</xsl:text>
        <xsl:apply-templates select="address"/>
        <xsl:text>},</xsl:text>
        <xsl:text>"schedule": {</xsl:text>
        <xsl:apply-templates select="schedule/day"/>
        <xsl:text>},</xsl:text>
        <xsl:text>"phone": "</xsl:text><xsl:value-of select="phone"/><xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="address">
        <xsl:text>"street": "</xsl:text><xsl:value-of select="street"/><xsl:text>",</xsl:text>
        <xsl:text>"city": "</xsl:text><xsl:value-of select="city"/><xsl:text>",</xsl:text>
        <xsl:text>"zip": "</xsl:text><xsl:value-of select="zip"/><xsl:text>"</xsl:text>
    </xsl:template>

    <xsl:template match="schedule/day">
        <xsl:text>"day": {</xsl:text>
        <xsl:text>"name": "</xsl:text><xsl:value-of select="name"/><xsl:text>",</xsl:text>
        <xsl:text>"from": "</xsl:text><xsl:value-of select="from"/><xsl:text>",</xsl:text>
        <xsl:text>"to": "</xsl:text><xsl:value-of select="to"/><xsl:text>"</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="menu">
        <xsl:text>"currency": "</xsl:text><xsl:value-of select="@currency"/><xsl:text>",</xsl:text>
        <xsl:text>"dishes": [</xsl:text>
            <xsl:for-each select="dish">
                <xsl:if test="position() != 1"><xsl:text>,</xsl:text></xsl:if>
                <xsl:text>{</xsl:text>
                <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>",</xsl:text>
                <xsl:text>"name": "</xsl:text><xsl:value-of select="name"/><xsl:text>",</xsl:text>
                <xsl:text>"price": </xsl:text><xsl:value-of select="price"/><xsl:text>,</xsl:text>
                <xsl:text>"description": "</xsl:text><xsl:value-of select="description"/><xsl:text>"</xsl:text>
                <xsl:text>}</xsl:text>
            </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

TODO

</xsl:stylesheet>