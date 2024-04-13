<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/">
        <xsl:text>{</xsl:text>
        <xsl:text>"descriptions": [</xsl:text>
        <xsl:for-each select="restaurant/descriptions/description">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"language": "</xsl:text>
            <xsl:value-of select="@language"/>
            <xsl:text>", "name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "slogan": "</xsl:text>
            <xsl:value-of select="slogan"/>
            <xsl:text>"</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="/contacts">
        <xsl:text>{</xsl:text>

        <xsl:text>"address": {</xsl:text>
        <xsl:text>"latitude": "</xsl:text>
        <xsl:value-of select="address/@latitude"/>
        <xsl:text>", "longitude": "</xsl:text>
        <xsl:value-of select="address/@longtitue"/>
        <xsl:text>", "street": "</xsl:text>
        <xsl:value-of select="address/street"/>
        <xsl:text>", "city": "</xsl:text>
        <xsl:value-of select="address/city"/>
        <xsl:text>", "zip": "</xsl:text>
        <xsl:value-of select="address/zip"/>
        <xsl:text>", "email": "</xsl:text>
        <xsl:value-of select="address/email"/>
        <xsl:text>"}",</xsl:text>

        <xsl:text>"schedule": [</xsl:text>
        <xsl:for-each select="schedule/day">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "from": "</xsl:text>
            <xsl:value-of select="from"/>
            <xsl:text>", "to": "</xsl:text>
            <xsl:value-of select="to"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>],</xsl:text>

        <xsl:text>"phones": [</xsl:text>
        <xsl:for-each select="phones/phone">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"countryCode": "</xsl:text>
            <xsl:value-of select="@countryCode"/>
            <xsl:text>", "stationary": "</xsl:text>
            <xsl:value-of select="@stationary"/>
            <xsl:text>", "number": "</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>],</xsl:text>

        <xsl:text>"socialMedias": [</xsl:text>
        <xsl:for-each select="socialMedias/socialMedia">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"platform": "</xsl:text>
            <xsl:value-of select="@platform"/>
            <xsl:text>", "name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "url": "</xsl:text>
            <xsl:value-of select="url"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>

        <xsl:text>}</xsl:text>
    </xsl:template>

     <xsl:template match="/menu">
        <xsl:text>{ "menu": [</xsl:text>
        <xsl:for-each select="dish">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"id": "</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>", "language": "</xsl:text>
            <xsl:value-of select="@language"/>
            <xsl:text>", "happyTime": </xsl:text>
            <xsl:value-of select="@happyTime"/>
            <xsl:text>, "vegan": </xsl:text>
            <xsl:value-of select="@vegan"/>
            <xsl:text>, "category": "</xsl:text>
            <xsl:value-of select="@category"/>
            <xsl:text>", "name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "price": {"currency": "</xsl:text>
            <xsl:value-of select="price/@currency"/>
            <xsl:text>", "amount": </xsl:text>
            <xsl:value-of select="price"/>
            <xsl:text>}, "description": "</xsl:text>
            <xsl:value-of select="description"/>
            <xsl:text>", "properties": {"ingrodients": [</xsl:text>
            <xsl:for-each select="properties/ingrodients/ingrodient">
                <xsl:if test="position() != 1">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"</xsl:text>
            </xsl:for-each>
            <xsl:text>], "calories": </xsl:text>
            <xsl:value-of select="properties/calories"/>
            <xsl:text>}</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="/team">
        <xsl:text>{ "team": [</xsl:text>
        <xsl:for-each select="member">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "position": "</xsl:text>
            <xsl:value-of select="position"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="/reviews">
        <xsl:text>{ "reviews": [</xsl:text>
        <xsl:for-each select="review">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"rating": "</xsl:text>
            <xsl:value-of select="@rating"/>
            <xsl:text>", "author": "</xsl:text>
            <xsl:value-of select="author"/>
            <xsl:text>", "position": "</xsl:text>
            <xsl:value-of select="position"/>
            <xsl:text>", "comment": "</xsl:text>
            <xsl:value-of select="comment"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="/reservations">
        <xsl:text>{ "reservations": [</xsl:text>
        <xsl:for-each select="reservation">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"id": "</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>", "date": "</xsl:text>
            <xsl:value-of select="@date"/>
            <xsl:text>", "time": "</xsl:text>
            <xsl:value-of select="@time"/>
            <xsl:text>", "customer": {</xsl:text>
            <xsl:text>"name": "</xsl:text>
            <xsl:value-of select="customer/name"/>
            <xsl:text>", "phone": {"countryCode": "</xsl:text>
            <xsl:value-of select="customer/phone/@countryCode"/>
            <xsl:text>", "number": "</xsl:text>
            <xsl:value-of select="customer/phone"/>
            <xsl:text>"}, "email": "</xsl:text>
            <xsl:value-of select="customer/email"/>
            <xsl:text>"}", "partySize": </xsl:text>
            <xsl:value-of select="partySize"/>
            <xsl:text>, "specialRequests": "</xsl:text>
            <xsl:value-of select="specialRequests"/>
            <xsl:text>"</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>
</xsl:stylesheet>
