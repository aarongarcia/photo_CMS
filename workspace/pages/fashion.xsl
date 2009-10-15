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
    <ul id="demoOne">
        <xsl:for-each select="photos/categories[@link-handle = 'fashion']/entry">
			<li><img src="{$root}/workspace/portfolio/{upload-photo/filename}" alt="{description}" /></li>
        </xsl:for-each>
    </ul>
</xsl:template>

</xsl:stylesheet>