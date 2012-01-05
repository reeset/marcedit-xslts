<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:marc="http://www.loc.gov/MARC21/slim" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" exclude-result-prefixes="marc">
  <xsl:import href="MARC21slimUtils.xsl"/>
  <xsl:output method="text" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>
  <xsl:template match="marc:record">
    <xsl:for-each select="marc:leader">
      <xsl:choose>
        <xsl:when test="substring(., 10,1) = 'a'">=LDR<xsl:text>  </xsl:text><xsl:value-of select="." /><xsl:text>&#13;&#10;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:variable name="ldr" select="." />=LDR<xsl:text>  </xsl:text><xsl:value-of select="substring($ldr,1,9)" /><xsl:text>a</xsl:text><xsl:value-of select="substring($ldr,11)" /><xsl:text>&#13;&#10;</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <!--================================================
          = Create the CONTROLFIELD INFORMATION
          ==============================================-->
    <xsl:for-each select="marc:controlfield">
      <xsl:if test="@tag&lt;10">
        <xsl:if test="normalize-space(.)!=''">
          <xsl:text>=</xsl:text>
          <xsl:value-of select="@tag" />
          <xsl:text>  </xsl:text>
          <xsl:call-template name="replaceText">
            <xsl:with-param name="tstring" select="." />
            <xsl:with-param name="text1" select="'$'" />
            <xsl:with-param name="text2" select="'{dollar}'" />
          </xsl:call-template>
          <xsl:text>&#13;&#10;</xsl:text>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
    <!--================================================
          = Create the GENERAL SUBFIELD INFORMATION
          ==============================================-->
    <xsl:for-each select="marc:datafield">
      <xsl:if test="marc:subfield!=''">
        <xsl:if test="@tag&gt;=10">
          <xsl:variable name="cind1" select="@ind1" />
          <xsl:variable name="cind2" select="@ind2" />

          <xsl:text>=</xsl:text>
          <xsl:value-of select="@tag" />
          <xsl:text>  </xsl:text>
          <xsl:for-each select="@*">
            <xsl:sort select="name()" />
            <xsl:if test="contains(name(), 'ind')">
              <xsl:choose>
                <xsl:when test=".=' '">
                  <xsl:text>\</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:choose>
                      <xsl:when test=".=''">
                         <xsl:text>\</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:value-of select="." />
                      </xsl:otherwise>
                  </xsl:choose>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:for-each>

          <xsl:for-each select="marc:subfield">
            <xsl:text>$</xsl:text>
            <xsl:value-of select="@code" />
            <xsl:call-template name="replaceText">
              <xsl:with-param name="tstring" select="translate(.,'&#13;&#10;&#9;',' ')" />
              <xsl:with-param name="text1" select="'$'" />
              <xsl:with-param name="text2" select="'{dollar}'" />
            </xsl:call-template>
          </xsl:for-each>
        </xsl:if>
        <xsl:text>&#13;&#10;</xsl:text>
      </xsl:if>
    </xsl:for-each>
    <xsl:text>&#13;&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
<!--http://creativecommons.org/licenses/zero/1.0/
  Creative Commons 1.0 Universal
  The person who associated a work with this document has dedicated this work to the 
  Commons by waiving all of his or her rights to the work under copyright law and all 
  related or neighboring legal rights he or she had in the work, to the extent allowable by law. 
-->
