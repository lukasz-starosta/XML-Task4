<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0"
                xmlns:xls="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="xml"/>

    <xsl:template match="electronics-shop">
        <fo:root>

            <fo:layout-master-set>
                <fo:simple-page-master master-name="Report" page-height="29.7cm" page-width="21cm" margin-bottom="0.5cm" margin-top="0.5cm" margin-left="1cm" margin-right="1cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="5cm"/>
                </fo:simple-page-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="Report">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block font-size="7pt" linefeed-treatment="preserve" text-align-last="justify">
                        <xsl:for-each select="document-information/authors/author">
                            <xsl:value-of select="concat(normalize-space(.), ' ')"/>
                        </xsl:for-each>
                        <fo:leader leader-pattern="space"/>
                        <xsl:value-of select="document-information/date-of-the-report"/>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-size="20pt" margin-bottom="0.5cm">Supporting XML Summary</fo:block>
                    <fo:table-and-caption>
                        <fo:table>
                            <xsl:for-each select="products-list/product/*">
                                <xsl:choose>
                                    <xsl:when test="name() = 'name'">
                                        <fo:table-column column-width="20mm"/>
                                    </xsl:when>
                                    <xsl:when test="name() = 'price'">
                                        <fo:table-column column-width="10mm"/>
                                    </xsl:when>
                                    <xsl:when test="name() = 'on-sale'">
                                        <fo:table-column column-width="11mm"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <fo:table-column column-width="18mm"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            <fo:table-header text-align="center" background-color="silver">
                                <fo:table-row>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Name</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Price</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">On Sale</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Release date</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Warranty</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Specification</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">User rating</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">In stock</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Free delivery</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt"> Additional information</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid 1pt black" padding="1mm">
                                        <fo:block font-weight="bold" font-size="7pt">Aggregate value</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-header>
                            <fo:table-body>
                               <xsl:for-each select="products-list/product">
                                    <fo:table-row>
                                        <xsl:for-each select="current()/*">
                                            <fo:table-cell border="solid 1pt black">
                                                <fo:block font-size="6pt" text-align="center" padding="1mm">
                                                    <xls:value-of select="normalize-space(current()/.)"/>
                                                </fo:block>
                                            </fo:table-cell>
                                        </xsl:for-each>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:table-and-caption>
                    <fo:block margin-top="0.25cm"  font-size="8pt">
                        Total number of different products:
                        <xsl:value-of select="summary/total-number-of-different-products"/>
                    </fo:block>
                    <fo:block font-size="8pt">
                        Total number of products:
                        <xsl:value-of select="summary/total-number-of-products"/>
                    </fo:block>
                    <fo:block font-size="8pt">
                        Average product price:
                        <xsl:value-of select="concat(summary/average-product-price, ' pln')"/>
                    </fo:block>
                    <fo:block font-size="8pt">
                        Average product rating:
                        <xsl:value-of select="summary/average-product-rating"/>
                    </fo:block>
                    <fo:block font-size="8pt" font-weight="bold" margin-top="0.2cm">Number of products by manufacturer:</fo:block>
                    <fo:block font-size="8pt" linefeed-treatment="preserve">
                    <xsl:for-each select="summary/number-of-products-by-manufacturer/*">
                        <xsl:value-of select="concat(current()/@manufacturer-name, ': ', ., '&#xA;')"/>
                    </xsl:for-each>
                    </fo:block>
                    <fo:block font-size="8pt" font-weight="bold" margin-top="0.2cm">Number of products by category:</fo:block>
                    <fo:block font-size="8pt" linefeed-treatment="preserve">
                        <xsl:for-each select="summary/number-of-products-by-category/*">
                            <xsl:value-of select="concat(current()/@category-name, ': ', ., '&#xA;')"/>
                        </xsl:for-each>
                    </fo:block>
                    <fo:block font-size="8pt" font-weight="bold" margin-top="0.2cm">Products with free delivery:</fo:block>
                    <fo:block font-size="8pt" linefeed-treatment="preserve" color="green">
                        <xsl:for-each select="summary/products-with-free-delivery/product-name">
                            <xsl:value-of select="concat(., '&#xA;')"/>
                        </xsl:for-each>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>

</xsl:stylesheet>