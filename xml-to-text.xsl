<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsle="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8" indent="no"/>

    <xsl:template match="electronics-shop">

        <xsl:text>Authors of the report:&#13;</xsl:text>
        <xsl:for-each select="document-information/authors/author">
            <xsl:value-of select="concat(normalize-space(.), '&#13;')"/>
        </xsl:for-each>

        <xsl:text>&#13;Date of the report: &#13;</xsl:text>
        <xsl:value-of select="concat(document-information/date-of-the-report, '&#13;&#13;')"/>

        <xsl:for-each select="products-list/product">
            <xsl:text>ID: </xsl:text>
            <xsl:value-of select="concat(current()/@product-id, ' ')"/>
            <xsl:text>Category: </xsl:text>
            <xsl:value-of select="concat(current()/@category, ' ')"/>
            <xsl:text>Manufacturer: </xsl:text>
            <xsl:value-of select="concat(current()/@manufacturer, '&#13;')"/>
            <xsl:text>--------------------------------------------------&#13;</xsl:text>
            <xsl:text>Name: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Name: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(name, '&#13;')"/>
            <xsl:text>Price: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Price: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(price,' ', price/@currency, '&#13;')"/>
            <xsl:text>On-sale: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('On-sale: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(on-sale, '&#13;')"/>
            <xsl:text>Release date: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Release date: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(translate(normalize-space(release-date/.), ' ', '/'), '&#13;')"/>
            <xsl:text>Warranty: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Warranty: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(warranty, ' ', warranty/@time-unit, ' &#13;')"/>
            <xsl:text>Weight: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Weight: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(substring-before(specification/weight, 'g'), ' grams&#13;')"/>
            <xsl:text>Color: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Color: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(specification/color, '&#13;')"/>
            <xsl:if test="specification/display-size">
                <xsl:text>Display size: </xsl:text>
                <xsl:call-template name="outputSpace">
                    <xsl:with-param name="i">0</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="string-length('Additional information: ') - string-length('Display size: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:value-of select="concat(substring-before(specification/display-size, 'inch'), ' inch&#13;')"/>
            </xsl:if>
            <xsl:if test="specification/switch">
                <xsl:text>Switch: </xsl:text>
                <xsl:call-template name="outputSpace">
                    <xsl:with-param name="i">0</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="string-length('Additional information: ') - string-length('Switch: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:value-of select="concat(specification/switch, '&#13;')"/>
            </xsl:if>
            <xsl:if test="specification/sensor">
                <xsl:text>Sensor: </xsl:text>
                <xsl:call-template name="outputSpace">
                    <xsl:with-param name="i">0</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="string-length('Additional information: ') - string-length('Sensor: ')"/>
                    </xsl:with-param>
                </xsl:call-template>
                <xsl:value-of select="concat(specification/sensor, '&#13;')"/>
            </xsl:if>
            <xsl:text>User rating: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('User rating: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(user-rating, '&#13;')"/>
            <xsl:text>In stock: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('In stock: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(in-stock, '&#13;')"/>
            <xsl:text>Free delivery: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Free delivery: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsle:value-of select="concat(free-delivery, '&#13;')"/>
            <xsl:if test="string(additional-information)">
                <xsl:text>Additional information: </xsl:text>
                <xsl:value-of select="concat(additional-information, '&#13;')"/>
            </xsl:if>
            <xsl:text>Aggregate value: </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i">0</xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="string-length('Additional information: ') - string-length('Aggregate value: ')"/>
                </xsl:with-param>
            </xsl:call-template>
            <xsl:value-of select="concat(aggregate-value, ' pln&#13;&#13;')"/>
        </xsl:for-each>

        <xsl:text>Supporting XML Summary&#13;&#13;</xsl:text>
        <xsl:text>Total number of different products: </xsl:text>
        <xsl:value-of select="concat(summary/total-number-of-different-products, '&#13;')"/>
        <xsl:text>Total number of products: </xsl:text>
        <xsl:value-of select="concat(summary/total-number-of-products, '&#13;&#13;')"/>
        <xsl:text>Number of products by manufacturer:&#13;</xsl:text>
        <xsl:for-each select="summary/number-of-products-by-manufacturer/*">
            <xsl:value-of select="concat(current()/@manufacturer-name, ': ', ., '&#13;')"/>
        </xsl:for-each>
        <xsl:text>&#13;Number of products by category:&#13;</xsl:text>
        <xsl:for-each select="summary/number-of-products-by-category/*">
            <xsl:value-of select="concat(current()/@category-name, ': ', ., '&#13;')"/>
        </xsl:for-each>
        <xsl:text>&#13;Average product price: </xsl:text>
        <xsl:value-of select="concat(summary/average-product-price, ' pln&#13;')"/>
        <xsl:text>Average product rating: </xsl:text>
        <xsl:value-of select="concat(summary/average-product-rating, '&#13;')"/>
        <xsl:text>&#13;Products with free delivery:&#13;</xsl:text>
        <xsl:for-each select="summary/products-with-free-delivery/product-name">
            <xsl:value-of select="concat(., '&#13;')"/>
        </xsl:for-each>

    </xsl:template>
    <xsl:template name="outputSpace">
        <xsl:param name="i" />
        <xsl:param name="count" />
        <xsl:if test="$i &lt; $count">
            <xsl:text> </xsl:text>
            <xsl:call-template name="outputSpace">
                <xsl:with-param name="i" select="$i + 1" />
                <xsl:with-param name="count" select="$count" />
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>