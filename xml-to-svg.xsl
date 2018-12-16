<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/2000/svg">

    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100vw" height="200vh">

            <use href="#rect-graph-product-by-manufacturer" x="2vw" y="5vh"/>
            <use href="#rect-graph-product-by-category" x="52vw" y="5vh"/>
            <use href="#pie-chart-manufacturer-contribution" />
            <use href="#pie-chart-category-contribution" />
            <use href="#rect-graph-product-ratings" />
            <use href="#rect-graph-product-prices" />

            <!-- Variables -->
            <xsl:variable name="price" select="."/>

            <defs>

                <!-- Linear gradients -->
                <linearGradient id="rect-bar-blue" x1="0%" y1="0%" x2="0%" y2="100%" spreadMethod="pad">
                    <stop offset="0%" stop-color="#7db9e8" stop-opacity="1"/>
                    <stop offset="50%" stop-color="#2989d8" stop-opacity="1"/>
                    <stop offset="100%" stop-color="#1e5799" stop-opacity="1"/>
                </linearGradient>
                <linearGradient id="rect-bar-green" x1="0%" y1="0%" x2="0%" y2="100%" spreadMethod="pad">
                    <stop offset="0%" stop-color="#96f444" stop-opacity="1"/>
                    <stop offset="50%" stop-color="#80c217" stop-opacity="1"/>
                    <stop offset="100%" stop-color="#7cbc0a" stop-opacity="1"/>
                </linearGradient>

                <!-- Base chart definitions -->
                <g id="rect-graph-base">
                    <line fill="none" stroke-width="2" x1="20" y1="0" x2="20" y2="340" stroke="#000" />
                    <line fill="none" stroke-width="2" x1="0" y1="320" x2="500" y2="320" stroke="#000" />
                </g>
                <g id="pie-chart-base">
                    <ellipse fill="none" stroke="#000" stroke-width="2" cx="125" cy="125" rx="125" ry="125" />
                </g>

                <!-- Charts -->
                <g id="rect-graph-product-by-manufacturer">

                    <!-- Graph title -->
                    <text x="20" y="-10" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                        <xsl:text>Number of products by manufacturer. Total number of products: </xsl:text>
                        <xsl:value-of select="/electronics-shop/summary/total-number-of-different-products"/>
                    </text>

                    <!-- Using the base axes -->
                    <use href="#rect-graph-base"/>

                    <!-- Create horizontal bars and text  -->
                    <xsl:for-each select="/electronics-shop/summary/number-of-products-by-manufacturer/*">

                        <!-- Bars -->
                        <rect x="{65 * position()}" y="{318 - 70 * .}" width="10" height="{ 70 * . }" style="fill:url(#rect-bar-blue)"/>

                        <!-- X axis text -->
                        <text x="{65 * position()}" y="338" style="text-anchor: middle; font-family: sans-serif; font-size: 0.7em;">
                            <xsl:value-of select="./@manufacturer-name" />
                        </text>

                    </xsl:for-each>

                    <!-- Variable for the max number of products -->
                    <xsl:variable name="max">
                        <xsl:for-each select="/electronics-shop/summary/number-of-products-by-manufacturer/*">
                            <xsl:sort select="." data-type="number" order="descending"/>
                            <xsl:if test="position() = 1">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                    <!-- Y axis text -->
                    <xsl:call-template name="draw-lines-and-text">
                        <xsl:with-param name="i">1</xsl:with-param>
                        <xsl:with-param name="count">
                            <xsl:value-of select="$max" />
                        </xsl:with-param>
                        <xsl:with-param name="template-variant">
                            <xsl:value-of select="name(/electronics-shop/summary/number-of-products-by-manufacturer)" />
                        </xsl:with-param>
                    </xsl:call-template>
                </g>

                <g id="rect-graph-product-by-category">
                    <!-- Graph title -->
                    <text x="20" y="-10" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                        <xsl:text>Number of products by category. Total number of products: </xsl:text>
                        <xsl:value-of select="/electronics-shop/summary/total-number-of-different-products"/>
                    </text>

                    <!-- Using the base axes -->
                    <use href="#rect-graph-base"/>

                    <!-- Create horizontal bars and text  -->
                    <xsl:for-each select="/electronics-shop/summary/number-of-products-by-category/*">

                        <!-- Bars -->
                        <rect x="{60 * position()}" y="{318 - 60 * .}" width="10" height="{ 60 * . }" style="fill:url(#rect-bar-green)"/>

                        <!-- X axis text -->
                        <text x="{61 * position()}" y="338" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
                            <xsl:value-of select="./@category-name" />
                        </text>

                    </xsl:for-each>

                    <!-- Variable for the max number of products -->
                    <xsl:variable name="max">
                        <xsl:for-each select="/electronics-shop/summary/number-of-products-by-category/*">
                            <xsl:sort select="." data-type="number" order="descending"/>
                            <xsl:if test="position() = 1">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:variable>

                    <!-- Y axis text -->
                    <xsl:call-template name="draw-lines-and-text">
                        <xsl:with-param name="i">1</xsl:with-param>
                        <xsl:with-param name="count">
                            <xsl:value-of select="$max" />
                        </xsl:with-param>
                        <xsl:with-param name="template-variant">
                            <xsl:value-of select="name(/electronics-shop/summary/number-of-products-by-category)" />
                        </xsl:with-param>
                    </xsl:call-template>
                </g>

                <g id="pie-chart-manufacturer-contribution">
                    <use href="#pie-chart-base" x="2vw" y="52vh" />
                </g>
                <g id="pie-chart-category-contribution">
                    <use href="#pie-chart-base" x="52vw" y="52vh" />
                </g>
                <g id="rect-graph-product-ratings">
                    <use href="#rect-graph-base" x="2vw" y="102vh" />
                </g>
                <g id="rect-graph-product-prices">
                    <use href="#rect-graph-base" x="52vw" y="102vh" />
                </g>
            </defs>
        </svg>
    </xsl:template>

    <!-- For loop drawing graph lines-->
    <xsl:template name="draw-lines-and-text">
        <xsl:param name="i" />
        <xsl:param name="count" />
        <xsl:param name="template-variant" />

        <!-- If i < count> -->
        <xsl:if test="$i &lt;= $count">
            <xsl:choose>
                <xsl:when test="$template-variant = name(/electronics-shop/summary/number-of-products-by-manufacturer)">
                    <xsl:call-template name="draw-products-by-manufacturer-lines-and-vtext">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$template-variant = name(/electronics-shop/summary/number-of-products-by-category)">
                    <xsl:call-template name="draw-products-by-category-lines-and-vtext">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <!-- Additional options go here -->
            </xsl:choose>
        </xsl:if>

        <!-- The actual looping -->
        <xsl:if test="$i &lt;= $count">
            <xsl:call-template name="draw-lines-and-text">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="$count"/>
                </xsl:with-param>
                <xsl:with-param name="template-variant">
                    <xsl:value-of select="$template-variant"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- Text with lines for graphs -->
    <xsl:template name="draw-products-by-manufacturer-lines-and-vtext">
        <xsl:param name="i" />
        <text x="0" y="{318 - $i * 68}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>
        <line fill="none" stroke-width="2" x1="20" y1="{318 - $i * 70}" x2="500" y2="{318 - $i * 70}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>

    <xsl:template name="draw-products-by-category-lines-and-vtext">
        <xsl:param name="i" />
        <text x="0" y="{318 - $i * 58}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>
        <line fill="none" stroke-width="2" x1="20" y1="{318 - $i * 60}" x2="500" y2="{318 - $i * 60}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>
    <!-- Additional lines with text for graphs go here -->

</xsl:stylesheet>