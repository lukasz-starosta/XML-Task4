<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/2000/svg">

    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" 
            xmlns:xlink="http://www.w3.org/1999/xlink" width="100vw" height="260vh">

            <a xlink:href="#rect-graph-product-by-manufacturer">
                <text x="39vw" y="40" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Number of products by manufacturer</tspan>
                </text>
            </a>
            <a xlink:href="#rect-graph-product-by-category">
                <text x="39vw" y="65" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Number of products by category</tspan>
                </text>
            </a>
            <a xlink:href="#pie-chart-manufacturer-contribution">
                <text x="39vw" y="90" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Manufacturers' contribution</tspan>
                </text>
            </a>
            <a xlink:href="#pie-chart-category-contribution">
                <text x="39vw" y="115" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Categories' contribution</tspan>
                </text>
            </a>
            <a xlink:href="#rect-graph-product-ratings">
                <text x="39vw" y="140" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Graph of product ratings</tspan>
                </text>
            </a>
            <a xlink:href="#rect-graph-product-prices">
                <text x="39vw" y="165" font-family="sans-serif" font-size="1.2em" font-weight="normal" fill="#9bc1ff" text-decoration="underline">
                    <tspan>Graph of product prices</tspan>
                </text>
            </a>

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
                <linearGradient id="rect-bar-rating" x1="0%" y1="0%" x2="0%" y2="100%" spreadMethod="pad">
                    <stop offset="0%" stop-color="#72ff00" stop-opacity="1"/>
                    <stop offset="50%" stop-color="#a8e0b7" stop-opacity="1"/>
                    <stop offset="80%" stop-color="#ffd15e" stop-opacity="1"/>
                    <stop offset="100%" stop-color="#e07678" stop-opacity="1"/>
                </linearGradient>
                <linearGradient id="rect-bar-price" x1="0%" y1="100%" x2="0%" y2="0%" spreadMethod="pad">
                    <stop offset="0%" stop-color="#72ff00" stop-opacity="1"/>
                    <stop offset="50%" stop-color="#a8e0b7" stop-opacity="1"/>
                    <stop offset="80%" stop-color="#ffd15e" stop-opacity="1"/>
                    <stop offset="100%" stop-color="#e07678" stop-opacity="1"/>
                </linearGradient>

                <!-- Base chart definitions -->
                <g id="rect-graph-base">
                    <line fill="none" stroke-width="2" x1="20" y1="0" x2="20" y2="340" stroke="#000" />
                    <line fill="none" stroke-width="2" x1="0" y1="320" x2="500" y2="320" stroke="#000" />
                </g>
                <g id="rect-graph-base-wide">
                    <line fill="none" stroke-width="2" x1="20" y1="0" x2="20" y2="340" stroke="#000" />
                    <line fill="none" stroke-width="2" x1="0" y1="320" x2="1600" y2="320" stroke="#000" />
                </g>
                <g id="rect-graph-base-wide-high">
                    <line fill="none" stroke-width="2" x1="20" y1="0" x2="20" y2="840" stroke="#000" />
                    <line fill="none" stroke-width="2" x1="0" y1="820" x2="1600" y2="820" stroke="#000" />
                </g>
            </defs>

            <!-- Charts -->
            <svg id="rect-graph-product-by-manufacturer" x="10vw" y="15vh">

                <!-- Graph title -->
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text id="products-by-manufacturer">Number of products by manufacturer. Total number of products: </xsl:text>
                    <xsl:value-of select="/electronics-shop/summary/total-number-of-different-products"/>
                </text>

                <!-- Using the base axes -->
                <use href="#rect-graph-base" x="0" y="30"/>

                <!-- Create horizontal bars and text  -->
                <xsl:for-each select="/electronics-shop/summary/number-of-products-by-manufacturer/*">

                    <!-- Bars -->
                    <rect x="{65 * position()}" y="{30 + 318 - 70 * .}" width="10" height="{ 70 * . }" style="fill:url(#rect-bar-blue)"/>

                    <!-- X axis text -->
                    <text x="{65 * position()}" y="368" style="text-anchor: middle; font-family: sans-serif; font-size: 0.7em;">
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

                <!-- Y axis text and lines-->
                <xsl:call-template name="draw-lines-and-text">
                    <xsl:with-param name="i">1</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="$max" />
                    </xsl:with-param>
                    <xsl:with-param name="template-variant">
                        <xsl:value-of select="name(/electronics-shop/summary/number-of-products-by-manufacturer)" />
                    </xsl:with-param>
                </xsl:call-template>
            </svg>

            <svg id="rect-graph-product-by-category" x="60vw" y="15vh">
                <!-- Graph title -->
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text>Number of products by category. Total number of products: </xsl:text>
                    <xsl:value-of select="/electronics-shop/summary/total-number-of-different-products"/>
                </text>

                <!-- Using the base axes -->
                <use href="#rect-graph-base" y="30"/>

                <!-- Create horizontal bars and text  -->
                <xsl:for-each select="/electronics-shop/summary/number-of-products-by-category/*">

                    <!-- Bars -->
                    <rect x="{60 * position()}" y="{348 - 60 * .}" width="10" height="{ 60 * . }" style="fill:url(#rect-bar-green)"/>

                    <!-- X axis text -->
                    <text x="{61 * position()}" y="378" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
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

                <!-- Y axis text and lines-->
                <xsl:call-template name="draw-lines-and-text">
                    <xsl:with-param name="i">1</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="$max" />
                    </xsl:with-param>
                    <xsl:with-param name="template-variant">
                        <xsl:value-of select="name(/electronics-shop/summary/number-of-products-by-category)" />
                    </xsl:with-param>
                </xsl:call-template>
            </svg>

            <svg id="pie-chart-manufacturer-contribution" x="10vw" y="65vh">
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text>Product by manufacturer contribution to total (hover over legend circles)</xsl:text>
                </text>
                <xsl:call-template name="draw-donut-chart-manufacturer">
                    <xsl:with-param name="i">1</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="count(/electronics-shop/summary/number-of-products-by-manufacturer/*)"/>
                    </xsl:with-param>
                    <xsl:with-param name="offset">
                        <xsl:value-of select="0"/>
                    </xsl:with-param>
                    <xsl:with-param name="length">
                        <xsl:value-of select="0"/>
                    </xsl:with-param>
                </xsl:call-template>
            </svg>

            <svg id="pie-chart-category-contribution" x="60vw" y="65vh">
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text>Product by category contribution to total (hover over legend circles)</xsl:text>
                </text>

                <circle id="circleRotateStart" cx="10" cy="40" r="8" fill="lightgreen" cursor="pointer"/>
                <circle id="circleRotateEnd" cx="28" cy="40" r="8" fill="lightcoral" cursor="pointer"/>
                <xsl:call-template name="draw-donut-chart-category">
                    <xsl:with-param name="i">1</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="count(/electronics-shop/summary/number-of-products-by-category/*)"/>
                    </xsl:with-param>
                    <xsl:with-param name="offset">
                        <xsl:value-of select="0"/>
                    </xsl:with-param>
                    <xsl:with-param name="length">
                        <xsl:value-of select="0"/>
                    </xsl:with-param>
                </xsl:call-template>
            </svg>

            <svg id="rect-graph-product-ratings" x="5vw" y="110vh">

                <!-- Graph title -->
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text id="products-ratings">Products and their ratings compared to the average rating</xsl:text>
                </text>

                <!-- Using the base widened axes -->
                <use href="#rect-graph-base-wide" x="10" y="30"/>

                <!-- Create horizontal bars and text  -->
                <xsl:for-each select="//product">

                    <!-- Bars -->
                    <rect x="{70 * position()}" y="{348 - 60 * ./user-rating }" width="10" height="{ 60 * ./user-rating }" style="fill:url(#rect-bar-rating)"/>

                    <!-- X axis text -->
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 0">
                            <text x="{70 * position()}" y="388" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
                                <xsl:value-of select="./name" />
                            </text>
                        </xsl:when>
                        <xsl:otherwise>
                            <text x="{70 * position()}" y="368" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
                                <xsl:value-of select="./name" />
                            </text>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:for-each>

                <!-- Variable for the max rating -->
                <xsl:variable name="max">
                    <xsl:for-each select="//product/user-rating">
                        <xsl:sort select="." data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <!-- Y axis text and lines-->
                <xsl:call-template name="draw-lines-and-text">
                    <xsl:with-param name="i">1</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="$max" />
                    </xsl:with-param>
                    <xsl:with-param name="template-variant">
                        <xsl:value-of select="name(//average-product-rating)"/>
                    </xsl:with-param>
                </xsl:call-template>

                <!-- Avg rating -->
                <text x="1500" y="{ 420 - //average-product-rating * 75 }" style="font-family: sans-serif; font-size: 0.9em; font-weight: bolder;">
                    <xsl:text>avg = </xsl:text>
                    <xsl:value-of select="//average-product-rating"/>
                </text>
                <line fill="none" stroke-width="3" x1="30" y1="{ 424 - //average-product-rating * 75 }" x2="1600" y2="{ 424 - //average-product-rating * 75 }" stroke="green" stroke-dasharray="2"/>
            </svg>

            <svg id="rect-graph-product-prices" x="5vw" y="165vh">

                <!-- Graph title -->
                <text x="20" y="20" style="font-weight: bold; font-family: sans-serif; font-size: 0.9em;">
                    <xsl:text>Products and their prices compared to the average price (PLN)</xsl:text>
                </text>

                <!-- Using the base widened axes -->
                <use href="#rect-graph-base-wide-high" x="20" y="30"/>

                <!-- Variable for the max price -->
                <xsl:variable name="max">
                    <xsl:for-each select="//product/price">
                        <xsl:sort select="." data-type="number" order="descending"/>
                        <xsl:if test="position() = 1">
                            <xsl:value-of select="."/>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:variable>

                <!-- Y axis text and lines-->
                <xsl:call-template name="draw-lines-and-text">
                    <xsl:with-param name="i">0</xsl:with-param>
                    <xsl:with-param name="count">
                        <xsl:value-of select="$max" />
                    </xsl:with-param>
                    <xsl:with-param name="template-variant">
                        <xsl:value-of select="name(//average-product-price)"/>
                    </xsl:with-param>
                </xsl:call-template>
                <!-- Create horizontal bars and text  -->
                <xsl:for-each select="//product">

                    <!-- Bars -->
                    <rect x="{70 * position()}" y="30" width="30" height="818" style="fill:url(#rect-bar-price)"/>
                    <rect id="{position()}" x="{70 * position()}" y="{848 - ./price div 10 }" width="30" height="5" fill="#727272" cursor="pointer"/>

                    <!-- X axis text -->
                    <xsl:choose>
                        <xsl:when test="position() mod 2 = 0">
                            <text x="{20 + 70 * position()}" y="888" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
                                <xsl:value-of select="./name" />
                            </text>
                        </xsl:when>
                        <xsl:otherwise>
                            <text x="{20 + 70 * position()}" y="868" style="text-anchor: middle; font-family: sans-serif; font-size: 0.65em;">
                                <xsl:value-of select="./name" />
                            </text>
                        </xsl:otherwise>
                    </xsl:choose>

                    <!-- Display details on click -->
                    <script type="text/ecmascript"><![CDATA[
                        window.onload = () => {
                            for (let i = 1; i <= 22; i++) {
                                const element = document.getElementById(i);
                                element.onclick = function () {
                                    const tooltip = document.getElementById(`price-tooltip-${element.id}`);
                                    const text = document.getElementById(`price-text-${element.id}`);

                                    if (tooltip.getAttribute('transform') === 'scale(0)') {
                                        tooltip.setAttribute('transform', 'scale(1)');
                                        text.setAttribute('transform', 'scale(1)');
                                    } else {
                                        tooltip.setAttribute('transform', 'scale(0)');
                                        text.setAttribute('transform', 'scale(0)');
                                    }
                                }
                            }
                        }
                        
                        ]]>
                    </script>

                    <rect id="price-tooltip-{position()}" x="{-20 + 70 * position()}" y="{858 - ./price div 10 }" height="40" width="100" fill="#f0f0f0" transform="scale(0)" style="transition: transform .5s ease-in-out;" />
                    <text id="price-text-{position()}" transform="scale(0)" x="{-20 + 70 * position()}" y="{883 - ./price div 10 }" style="font-family: sans-serif; font-size: 0.8em; font-weight: bold; transition: transform .5s ease-in-out;">
                        <tspan>Price: </tspan>
                        <xsl:value-of select="./price"/>
                        <xsl:value-of select="./price/@currency"/>
                    </text>
                </xsl:for-each>
                <!-- Avg price -->
                <text x="1520" y="{ 840 - //average-product-price div 10 }" style="font-family: sans-serif; font-size: 0.9em; font-weight: bolder;">
                    <xsl:text>avg = </xsl:text>
                    <xsl:value-of select="//average-product-price"/>
                </text>
                <line fill="none" stroke-width="3" x1="40" y1="{ 850 - //average-product-price div 10 }" x2="1620" y2="{ 850 - //average-product-price div 10 }" stroke="green" stroke-dasharray="2"/>
            </svg>
        </svg>
    </xsl:template>

    <!-- For loop drawing donut charts for manufacturer -->
    <xsl:template name="draw-donut-chart-manufacturer">
        <xsl:param name="i" />
        <xsl:param name="count" />
        <xsl:param name="offset" />
        <xsl:param name="length" />

        <!-- The actual looping -->
        <xsl:if test="$i &lt;= $count">
            <!-- Length is current number of products over total number of products * 100-->
            <xsl:variable name="this-length">
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i] div sum(/electronics-shop/summary/number-of-products-by-manufacturer/*) * 100"/>
            </xsl:variable>
            <xsl:variable name="this-offset">
                <xsl:value-of select="100 - $length"/>
            </xsl:variable>

            <!-- Colors -->
            <xsl:variable name="color">
                <xsl:choose>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Acer'">
                        <xsl:value-of select="'#baffa5'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Apple'">
                        <xsl:value-of select="'#f6ffa4'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Asus'">
                        <xsl:value-of select="'#84b3ff'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Dell'">
                        <xsl:value-of select="'#dbdbdb'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'OnePlus'">
                        <xsl:value-of select="'#727272'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Razer'">
                        <xsl:value-of select="'#b77cff'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name = 'Samsung'">
                        <xsl:value-of select="'#ff5990'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>

            <!-- Draw a circle with specified attributes -->
            <!-- Stroke-dasharray first attribute - length of the color, second attribute - lenght of the space between them -->
            <!-- Radius - 100 / 2pi -->
            <!-- Offset + 25 ensures circle starts from the top (0*) - not from the right (90*) -->

            <svg viewBox="0 0 42 42" width="350" height="350" y="30">
                <circle fill="none" stroke="{$color}" stroke-width="8" cx="21" cy="21" r="15.91549430918954" stroke-dasharray="{$this-length} {100 - $this-length}" stroke-dashoffset="{25 + $this-offset}">
                    <animateTransform attributeName="transform" begin="0s" dur="60s" type="rotate" from="0 21 21" to="360 21 21" repeatCount="indefinite" />
                </circle>
            </svg>

            <!-- Legend -->
            <circle id="{/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name}" fill="{$color}" stroke="black" stroke-width="0.1" cx="400" cy="{30 + 40 * $i}" r="10"/>
            <text x="420" y="{ 35 + 40 * $i }" style="font-family: sans-serif; font-size: 0.8em; font-weight: bold;">
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name"/>
            </text>
            <rect x="500" y="{ 10 + 40 * $i }" height="40" width="100" fill="#ececec" fill-opacity="0.7" visibility="hidden">
                <set attributeName="visibility" from="hidden" to="visible" begin="{/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name}.mouseover" end="{/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name}.mouseout"/>
            </rect>
            <text visibility="hidden" x="515" y="{35 + 40 * $i }" style="font-family: sans-serif; font-size: 0.8em; font-weight: bold;">
                <xsl:text>Products: </xsl:text>
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]"/>
                <set attributeName="visibility" from="hidden" to="visible" begin="{/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name}.mouseover" end="{/electronics-shop/summary/number-of-products-by-manufacturer/*[position() = $i]/@manufacturer-name}.mouseout"/>
            </text>
            <!-- Loop, increase offset -->
            <xsl:call-template name="draw-donut-chart-manufacturer">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="$count"/>
                </xsl:with-param>
                <xsl:with-param name="offset">
                    <xsl:value-of select="$offset + $this-offset"/>
                </xsl:with-param>
                <xsl:with-param name="length">
                    <xsl:value-of select="$length + $this-length"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- For loop drawing donut charts for category -->
    <xsl:template name="draw-donut-chart-category">
        <xsl:param name="i" />
        <xsl:param name="count" />
        <xsl:param name="offset" />
        <xsl:param name="length" />

        <!-- The actual looping -->
        <xsl:if test="$i &lt;= $count">
            <xsl:variable name="this-length">
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-category/*[position() = $i] div sum(/electronics-shop/summary/number-of-products-by-category/*) * 100"/>
            </xsl:variable>
            <xsl:variable name="this-offset">
                <xsl:value-of select="100 - $length"/>
            </xsl:variable>

            <!-- Colors -->
            <xsl:variable name="color">
                <xsl:choose>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Notebook'">
                        <xsl:value-of select="'#baffa5'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Smartphone'">
                        <xsl:value-of select="'#f6ffa4'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Monitor'">
                        <xsl:value-of select="'#84b3ff'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Accesory'">
                        <xsl:value-of select="'#dbdbdb'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'TV'">
                        <xsl:value-of select="'#727272'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Keyboard'">
                        <xsl:value-of select="'#b77cff'"/>
                    </xsl:when>
                    <xsl:when test="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name = 'Mouse'">
                        <xsl:value-of select="'#ff5990'"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>

            <!-- Draw a circle with specified attributes -->
            <!-- Stroke-dasharray first attribute - length of the color, second attribute - lenght of the space between them -->
            <!-- Radius - 100 / 2pi -->
            <svg viewBox="0 0 42 42" width="350" height="350" y="30">
                <circle fill="none" stroke="{$color}" stroke-width="8" cx="21" cy="21" r="15.91549430918954" stroke-dasharray="{$this-length} {100 - $this-length}" stroke-dashoffset="{25 + $this-offset}">
                    <animateTransform attributeName="transform" begin="circleRotateStart.click" end="circleRotateEnd.click" dur="60s" type="rotate" from="0 21 21" to="360 21 21" repeatCount="indefinite" />
                </circle>
            </svg>
            <circle id="{/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name}" fill="{$color}" stroke="black" stroke-width="0.1" cx="400" cy="{30 + 40 * $i}" r="10"/>
            <text x="420" y="{ 35 + 40 * $i }" style="font-family: sans-serif; font-size: 0.8em; font-weight: bold;">
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name"/>
            </text>
            <rect x="500" y="{ 10 + 40 * $i }" height="40" width="100" fill="#ececec" fill-opacity="0.7" visibility="hidden">
                <set attributeName="visibility" from="hidden" to="visible" begin="{/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name}.mouseover" end="{/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name}.mouseout"/>
            </rect>
            <text visibility="hidden" x="515" y="{35 + 40 * $i }" style="font-family: sans-serif; font-size: 0.8em; font-weight: bold;">
                <xsl:text>Products: </xsl:text>
                <xsl:value-of select="/electronics-shop/summary/number-of-products-by-category/*[position() = $i]"/>
                <set attributeName="visibility" from="hidden" to="visible" begin="{/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name}.mouseover" end="{/electronics-shop/summary/number-of-products-by-category/*[position() = $i]/@category-name}.mouseout"/>
            </text>

            <!-- Loop, increase offset -->
            <xsl:call-template name="draw-donut-chart-category">
                <xsl:with-param name="i">
                    <xsl:value-of select="$i + 1"/>
                </xsl:with-param>
                <xsl:with-param name="count">
                    <xsl:value-of select="$count"/>
                </xsl:with-param>
                <xsl:with-param name="offset">
                    <xsl:value-of select="$offset + $this-offset"/>
                </xsl:with-param>
                <xsl:with-param name="length">
                    <xsl:value-of select="$length + $this-length"/>
                </xsl:with-param>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- For loop drawing graph lines-->
    <xsl:template name="draw-lines-and-text">
        <xsl:param name="i" />
        <xsl:param name="count" />
        <xsl:param name="template-variant" />

        <!-- If i <= count -->
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
                <xsl:when test="$template-variant = name(//average-product-rating)">
                    <xsl:call-template name="draw-product-rating-lines-and-vtext">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$template-variant = name(//average-product-price)">
                    <xsl:call-template name="draw-product-price-lines-and-vtext">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <!-- Additional options go here -->
            </xsl:choose>
        </xsl:if>

        <!-- The actual looping based on template variant-->
        <xsl:if test="$i &lt;= $count">
            <xsl:choose>
                <xsl:when test="$template-variant = name(//average-product-rating)">
                    <xsl:call-template name="draw-lines-and-text">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i + 0.5"/>
                        </xsl:with-param>
                        <xsl:with-param name="count">
                            <xsl:value-of select="$count"/>
                        </xsl:with-param>
                        <xsl:with-param name="template-variant">
                            <xsl:value-of select="$template-variant"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$template-variant = name(//average-product-price)">
                    <xsl:call-template name="draw-lines-and-text">
                        <xsl:with-param name="i">
                            <xsl:value-of select="$i + 500"/>
                        </xsl:with-param>
                        <xsl:with-param name="count">
                            <xsl:value-of select="$count"/>
                        </xsl:with-param>
                        <xsl:with-param name="template-variant">
                            <xsl:value-of select="$template-variant"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
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
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- Text with lines for graphs -->
    <xsl:template name="draw-products-by-manufacturer-lines-and-vtext">
        <xsl:param name="i" />
        <text x="0" y="{348 - $i * 68}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>
        <line fill="none" stroke-width="2" x1="20" y1="{348 - $i * 70}" x2="500" y2="{348 - $i * 70}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>

    <xsl:template name="draw-products-by-category-lines-and-vtext">
        <xsl:param name="i" />
        <text x="0" y="{348 - $i * 58}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>
        <line fill="none" stroke-width="2" x1="20" y1="{348 - $i * 60}" x2="500" y2="{348 - $i * 60}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>

    <xsl:template name="draw-product-rating-lines-and-vtext">
        <xsl:param name="i" />
        <text x="0" y="{408 - $i * 70}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>
        <line fill="none" stroke-width="2" x1="30" y1="{424 - $i * 75}" x2="1600" y2="{424 - $i * 75}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>

    <xsl:template name="draw-product-price-lines-and-vtext">
        <xsl:param name="i" />

        <text x="0" y="{850 - $i div 10}" style="font-family: sans-serif; font-size: 0.9em;">
            <xsl:value-of select="$i"/>
        </text>

        <line fill="none" stroke-width="2" x1="40" y1="{850 - $i div 10}" x2="1620" y2="{850 - $i div 10}" stroke="#000" stroke-dasharray="2 6"/>
    </xsl:template>
    <!-- Additional lines with text for graphs go here -->

</xsl:stylesheet>