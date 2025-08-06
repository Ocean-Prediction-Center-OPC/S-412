<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:decimal-format name="dformat" decimal-separator="." grouping-separator=","/>

  <!--Include templates/rules for: attributes-->
  <xsl:include href="attributeRules.xsl"/>

  <!--Include templates/rules for: styles-->
  <xsl:include href="textStyle.xsl"/>
  <xsl:include href="simpleLineStyle.xsl"/>

  <!--Include templates/rules for: features-->
  <xsl:include href="windWarning.xsl"/>

  <xsl:param name="transparency"/>

  <xsl:template match="/">
    <p:displayList xmlns:p="http://www.iho.int/S100Presentation/5.1">
      <xsl:apply-templates select="Dataset/Features/*"/>
    </p:displayList>
  </xsl:template>
</xsl:transform>

