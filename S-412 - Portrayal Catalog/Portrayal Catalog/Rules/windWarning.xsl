<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:gml="http://www.opengis.net/gml/3.2" version="1.0">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="windWarning" priority="1">
		<xsl:variable name="threshold" select="./windWarningThreshold"/>
		<xsl:variable name="vg">
			<xsl:choose>
				<xsl:when test="$threshold= '1'">29001</xsl:when>
				<xsl:when test="$threshold= '2'">29002</xsl:when>
				<xsl:when test="$threshold= '3'">29003</xsl:when>
				<xsl:when test="$threshold= '4'">29004</xsl:when>
				<xsl:otherwise>29000</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="color">
			<xsl:choose>
				<xsl:when test="$threshold= '1'">CHYLW</xsl:when>
				<xsl:when test="$threshold= '2'">UINFO</xsl:when>
				<xsl:when test="$threshold= '3'">CHRED</xsl:when>
				<xsl:when test="$threshold= '4'">CHMGD</xsl:when>
				<xsl:otherwise>UINFO</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<lineInstruction suppression="false">
			<featureReference><xsl:value-of select="@id"/></featureReference>
			<viewingGroup><xsl:value-of select="$vg"/></viewingGroup>
			<displayPlane>UnderRADAR</displayPlane>
			<drawingPriority>9</drawingPriority>
			<xsl:call-template name="simpleLineStyle">
				<xsl:with-param name="style">solid</xsl:with-param>
				<xsl:with-param name="width">0.32</xsl:with-param>
				<xsl:with-param name="colour">CHBLK</xsl:with-param>
				<xsl:with-param name="transparency"><xsl:value-of select="$transparency"/></xsl:with-param>
			</xsl:call-template>
		</lineInstruction>
		<areaInstruction>
			<featureReference><xsl:value-of select="@id"/></featureReference>
			<viewingGroup><xsl:value-of select="$vg"/></viewingGroup>
			<displayPlane>UnderRADAR</displayPlane>
			<drawingPriority><xsl:value-of select="$threshold"/></drawingPriority>
			<colorFill>
				<color>
					<xsl:attribute name="transparency"><xsl:value-of select="$transparency"/></xsl:attribute>
					<xsl:value-of select="$color"/>
				</color>
			</colorFill>
		</areaInstruction>
		<!-- Example of referencing an associated information type
		<textInstruction>
			<featureReference>
				<xsl:value-of select="@id"/>
			</featureReference>
			<viewingGroup>29000</viewingGroup>
			<displayPlane>UNDERRADAR</displayPlane>
			<drawingPriority>18</drawingPriority>
			<textPoint horizontalAlignment="Center">
				<element>
					<text>
						<xsl:apply-templates select="//InformationTypes/dataProvider[@id=current()/DataProviderAssociation/@informationRef]/contactInformation/webAddress" mode="text"/>
					</text>
					<xsl:call-template name="textStyle">
						<xsl:with-param name="style">default</xsl:with-param>
					</xsl:call-template>
				</element>
				<offset>
					<x>0</x>
					<y>0</y>
				</offset>
				<areaPlacement placementMode="VisibleParts"/>
			</textPoint>
		</textInstruction>
		-->
	</xsl:template>	
</xsl:transform>