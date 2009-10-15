<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:param name="css-path" select="concat($workspace, '/assets/css/')"/>
<xsl:param name="js-path" select="concat($workspace, '/assets/js/')"/>

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>

<xsl:template match="/">
	<html>
		<xsl:call-template name="head"/>
		<body id="">
			<div class="content">
				<xsl:call-template name="header"/>
				<div class="content">
					<xsl:apply-templates/>
				</div>
				<div id="footer">
				    <xsl:call-template name="footer"/>
				</div>
			</div>
			<xsl:call-template name="js"/>
			<xsl:call-template name="analytics"/>
		</body>
	</html>
</xsl:template>

<xsl:template name="head">
	<xsl:param name="css"/>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title><xsl:value-of select="$page-title"/> | <xsl:value-of select="$website-name"/></title>
		<xsl:call-template name="css"/>
	</head>
</xsl:template>

<xsl:template name="header">
    <div id="masthead">
    	<h1>
    	    <a id="logo" href="{$root}"></a>
    	</h1>
    	<xsl:apply-templates select="data/navigation"/>
        <div class="border_holder">
            <div class="bottom_border2"></div>
            <div class="bottom_border1"></div>
            <div class="bottom_border3"></div>
        </div>
    </div>
</xsl:template>

<xsl:template name="footer">
    <div class="border_holder">
        <div class="bottom_border2"></div>
        <div class="bottom_border1"></div>
        <div class="bottom_border3"></div>
    </div>
</xsl:template>

<xsl:template name="css">
	<link rel="stylesheet" type="text/css" href="{$css-path}reset.css" media="all" />
	<link rel="stylesheet" type="text/css" href="{$css-path}styles.css" media="all" />
</xsl:template>

<xsl:template name="js">
	<script type="text/javascript" src="{$js-path}jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="{$js-path}jqgalscroll.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#demoOne").jqGalScroll();
        });
    </script>
        
</xsl:template>

<xsl:template name="analytics">

</xsl:template>

</xsl:stylesheet>