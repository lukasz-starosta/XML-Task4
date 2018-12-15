<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/2000/svg">

    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN" doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />

    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100vw" height="200vh">

            <use href="#rect-graph-product-by-manufacturer"/>
            <use href="#rect-graph-product-by-category" />
            <use href="#pie-chart-manufacturer-contribution" />
            <use href="#pie-chart-category-contribution" />
            <use href="#rect-graph-product-ratings" />
            <use href="#rect-graph-product-prices" />

            <defs>
                <!-- Base chart definitions -->
                <g id="rect-graph-base">
                    <line fill="none" stroke-width="1.5" x1="20" y1="0" x2="20" y2="340" stroke="#000" />
                    <line fill="none" stroke-width="1.5" x1="0" y1="320" x2="500" y2="320" stroke="#000" />
                </g>
                <g id="pie-chart-base">
                    <ellipse fill="none" stroke="#000" stroke-width="1.5" cx="125" cy="125" rx="125" ry="125" />
                </g>

                <!-- Charts -->
                <g id="rect-graph-product-by-manufacturer">
                    <use href="#rect-graph-base" x="2vw" y="2vh" />
                </g>
                <g id="rect-graph-product-by-category">
                    <use href="#rect-graph-base" x="52vw" y="2vh" />
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

</xsl:stylesheet>