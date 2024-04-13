<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" encoding="utf-8"/>

    <xsl:template match="/restaurant">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="descriptions"/>
        <xsl:text>,</xsl:text>
        <xsl:apply-templates select="contacts"/>
        <xsl:text>,</xsl:text>
        <xsl:apply-templates select="menu"/>
        <xsl:text>,</xsl:text>
        <xsl:apply-templates select="team"/>
        <xsl:text>,</xsl:text>
        <xsl:apply-templates select="reviews"/>
        <xsl:text>,</xsl:text>
        <xsl:apply-templates select="reservations"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="descriptions">
        <xsl:text>"descriptions": [</xsl:text>
        <xsl:for-each select="description">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"language": "</xsl:text>
            <xsl:value-of select="@language"/>
            <xsl:text>", "name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "slogan": "</xsl:text>
            <xsl:value-of select="slogan"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="contacts">
        <xsl:text>"contacts": {</xsl:text>

        <xsl:text>"address": {</xsl:text>
            <xsl:text> "latitude": "</xsl:text> <xsl:value-of select="address/@latitude"/> <xsl:text>",</xsl:text>

            <xsl:text> "longtitue": "</xsl:text> <xsl:value-of select="address/@longtitue"/> <xsl:text>",</xsl:text>

            <xsl:text> "street": "</xsl:text> <xsl:value-of select="address/street"/> <xsl:text>",</xsl:text>

            <xsl:text> "city": "</xsl:text> <xsl:value-of select="address/city"/> <xsl:text>",</xsl:text>

            <xsl:text> "zip": "</xsl:text> <xsl:value-of select="address/zip"/> <xsl:text>",</xsl:text>

            <xsl:text> "email": "</xsl:text> <xsl:value-of select="address/email"/> <xsl:text>",</xsl:text>
        <xsl:text>}</xsl:text>

        <xsl:text>, "schedule": [</xsl:text>
        <xsl:for-each select="schedule/day">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"day": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "from": "</xsl:text>
            <xsl:value-of select="from"/>
            <xsl:text>", "to": "</xsl:text>
            <xsl:value-of select="to"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>], "phones": [</xsl:text>
        <xsl:for-each select="phones/phone">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"countryCode": "</xsl:text>
            <xsl:value-of select="@countryCode"/>
            <xsl:text>", "stationary": </xsl:text>
            <xsl:choose>
                <xsl:when test="@stationary='true'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>false</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>, "number": "</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>], "socialMedias": [</xsl:text>
        <xsl:for-each select="socialMedias/socialMedia">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"platform": "</xsl:text>
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

    <xsl:template match="menu">
        <xsl:text>"menu": [</xsl:text>
        <xsl:for-each select="dish">
            <xsl:sort select="@id" data-type="number" order="ascending"/>
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"id": </xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>, "language": "</xsl:text>
            <xsl:value-of select="@language"/>
            <xsl:text>", "happyTime": </xsl:text>
            <xsl:choose>
                <xsl:when test="@happyTime='true'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>false</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>, "vegan": </xsl:text>
            <xsl:choose>
                <xsl:when test="@vegan='true'">
                    <xsl:text>true</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>false</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>, "category": "</xsl:text>
            <xsl:value-of select="@category"/>
            <xsl:text>", "name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "price": {"currency": "</xsl:text>
            <xsl:value-of select="price/@currency"/>
            <xsl:text>", "amount": "</xsl:text>
            <xsl:value-of select="price"/>
            <xsl:text>"}, "description": "</xsl:text>
            <xsl:value-of select="description"/>

            <xsl:text>", "properties": {"ingrodients": [</xsl:text>
            <xsl:for-each select="properties/ingrodients/ingrodient">
                <xsl:sort select="." data-type="text" order="ascending"/>
                <xsl:if test="position() != 1">
                    <xsl:text>,</xsl:text>
                </xsl:if>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"</xsl:text>
            </xsl:for-each>

            <xsl:text>], "calories": "</xsl:text>
            <xsl:value-of select="properties/calories"/>
            <xsl:text>"}</xsl:text>

            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="team">
        <xsl:text>"team": [</xsl:text>
        <xsl:for-each select="member">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"name": "</xsl:text>
            <xsl:value-of select="name"/>
            <xsl:text>", "position": "</xsl:text>
            <xsl:value-of select="position"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="reviews">
        <xsl:text>"reviews": [</xsl:text>
        <xsl:for-each select="review">
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"rating": </xsl:text>
            <xsl:value-of select="@rating"/>
            <xsl:text>, "author": "</xsl:text>
            <xsl:value-of select="author"/>
            <xsl:text>", "position": "</xsl:text>
            <xsl:value-of select="position"/>
            <xsl:text>", "comment": "</xsl:text>
            <xsl:value-of select="comment"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match="reservations">
        <xsl:text>"reservations": [</xsl:text>
        <xsl:for-each select="reservation">
            <xsl:sort select="@id" data-type="number" order="descending"/>
            <xsl:if test="position() != 1">
                <xsl:text>,</xsl:text>
            </xsl:if>
            <xsl:text>{"id": </xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>, "date": "</xsl:text>
            <xsl:value-of select="@date"/>
            <xsl:text>", "time": "</xsl:text>
            <xsl:value-of select="@time"/>
            <xsl:text>", "customer": {"name": "</xsl:text>
            <xsl:value-of select="customer/name"/>
            <xsl:text>", "phone": {"countryCode": "</xsl:text>
            <xsl:value-of select="customer/phone/@countryCode"/>
            <xsl:text>", "number": "</xsl:text>
            <xsl:value-of select="customer/phone"/>
            <xsl:text>"}, "email": "</xsl:text>
            <xsl:value-of select="customer/email"/>
            <xsl:text>"}, "partySize": </xsl:text>
            <xsl:value-of select="partySize"/>
            <xsl:text>, "specialRequests": "</xsl:text>
            <xsl:value-of select="specialRequests"/>
            <xsl:text>"}</xsl:text>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
    </xsl:template>

</xsl:stylesheet>
