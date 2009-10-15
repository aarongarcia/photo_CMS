<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
<xsl:import href="../utilities/master.xsl"/>
    
<xsl:output method="xml"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />



<xsl:template match="data">
    <xsl:for-each select="/data/about/entry[@id = 10]">
        <div class="column_left">
            <xsl:value-of select="body"/>
            <ul id="bio_meta">
                <li><xsl:value-of select="phone-number"/></li>
                <li><xsl:value-of select="email"/></li>
                <li><a href="{link-1-url}"><xsl:value-of select="link-1-title"/></a></li>
                <li><a href="{link-2-url}"><xsl:value-of select="link-2-title"/></a></li>
            </ul>
        </div>
         <div class="column_right">
            <img src="{$root}/workspace/portfolio/{photo/filename}" alt="{description}" />
        </div>
    </xsl:for-each>
    
    <xsl:for-each select="/data/about/entry[@id = 12]">
        <div class="column_left">
            <div id="clients">
                <h3><xsl:value-of select="heading"/></h3>
                <xsl:copy-of select="body"/>
            </div>
        </div>
    </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
