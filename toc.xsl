<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:outline="http://wkhtmltopdf.org/outline"
                xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
              indent="yes" />
  <xsl:template match="outline:outline">
    <html>
      <head>
        <title>[[toc_headline]]</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <style>
			body {
				color: #333;
				font-family: "Helvetica Neue", Helvetica, "Segoe UI", Arial, freesans, sans-serif;
				font-size: 14px;
				line-height: 1.6;
			}
			a {
				background: transparent;
			}

			a:active,
			a:hover {
			  outline: 0;
			}
			h1 {
				margin-top: 15px;
				margin-bottom: 15px;
  				line-height: 1.2;
				font-size: 24px;
				page-break-inside: avoid;
  				border-bottom: 1px solid #eee;
			}
			div {border-bottom: 1px dashed #eee; margin: 0 0 5px 0;}
			span {float: right;}
			li {list-style: none; padding: 0; margin: 0;}
			ul {padding: 0; margin: 0; font-size: 14px;}
			ul ul {font-size: 85%; padding-left: 1em;}
        </style>
      </head>
      <body>
        <h1>[[toc_headline]]</h1>
        <ul><xsl:apply-templates select="outline:item/outline:item"/></ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="outline:item">
    <li>
      <xsl:if test="@title!=''">
        <div>
          <a>
            <xsl:if test="@link">
              <xsl:attribute name="href"><xsl:value-of select="@link"/></xsl:attribute>
            </xsl:if>
            <xsl:if test="@backLink">
              <xsl:attribute name="name"><xsl:value-of select="@backLink"/></xsl:attribute>
            </xsl:if>
            <xsl:value-of select="@title" />
          </a>
          <span> <xsl:value-of select="@page" /> </span>
        </div>
      </xsl:if>
      <ul>
        <xsl:comment>added to prevent self-closing tags in QtXmlPatterns</xsl:comment>
        <xsl:apply-templates select="outline:item"/>
      </ul>
    </li>
  </xsl:template>
</xsl:stylesheet>
