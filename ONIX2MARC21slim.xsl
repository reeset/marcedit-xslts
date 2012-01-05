<?xml version="1.0" ?>

<!-- Revised to correct error on line 301 (07/02/2007/jer) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.loc.gov/MARC21/slim">
	<xsl:include href="MARC21slimUtils.xsl"/>
	<xsl:output indent="yes"/>
	
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test = "ONIXMessage">
				<xsl:choose>
					<xsl:when test = "/product">
						<collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" >
							<xsl:apply-templates select="product"/>
						</collection>
					</xsl:when>
					<xsl:otherwise>
						<collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" >
							<xsl:apply-templates select="Product"/>
						</collection>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:when test = "product">
				<collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" >
					<xsl:apply-templates select="product"/>
				</collection>
			</xsl:when>
			<xsl:otherwise>
				<collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd" >
					<xsl:apply-templates select="Product"/>
				</collection>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="product">
		<record>
			<leader>
				<!-- 00-04 -->
				<xsl:text>     </xsl:text>
				<!-- 05 -->
				<xsl:choose>
					<xsl:when test="a002=01">n</xsl:when>
					<xsl:when test="a002=02">n</xsl:when>
					<xsl:when test="a002=03">c</xsl:when>
					<xsl:when test="a002=04">c</xsl:when>
					<xsl:when test="a002=05">d</xsl:when>
				</xsl:choose>
				<!-- 06 -->
				<xsl:choose>
					<xsl:when test="starts-with(b012,'A')">j</xsl:when>
					<xsl:when test="starts-with(b012,'B')">a</xsl:when>
					<xsl:when test="starts-with(b012,'C')">e</xsl:when>
					<xsl:when test="starts-with(b012,'F')">g</xsl:when>
					<xsl:when test="starts-with(b012,'M')">a</xsl:when>
					<xsl:when test="starts-with(b012,'V')">g</xsl:when>
					<xsl:when test="starts-with(b012,'W')">p</xsl:when>
					<xsl:when test="starts-with(b012,'X')">r</xsl:when>
					<xsl:when test="starts-with(b012,'Z')">r</xsl:when>
					<xsl:when test="b012='DD'">g</xsl:when>
					<xsl:when test="starts-with(b012,'D')">m</xsl:when>
					<xsl:when test="b012='PH'">o</xsl:when>
					<xsl:when test="b012='PI'">c</xsl:when>
					<xsl:when test="starts-with(b012,'P')">k</xsl:when>
					<xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
				</xsl:choose>
				<!-- 07 -->
				<xsl:choose>
					<xsl:when test="b020">s</xsl:when>
					<xsl:otherwise>m</xsl:otherwise>
				</xsl:choose>
				<!-- 08 -->
				<xsl:text> </xsl:text>
				<!-- 09 -->
				<xsl:text> </xsl:text>
				<!-- 10 -->
				<xsl:text>2</xsl:text>
				<!-- 11 -->
				<xsl:text>2</xsl:text>
				<!-- 12-16 -->
				<xsl:text>     </xsl:text>
				<!-- 17 -->
				<xsl:choose>
					<xsl:when test="a002">
						<xsl:choose>
							<xsl:when test="a002=01 or a002=02">8</xsl:when>
							<xsl:otherwise>4</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>4</xsl:otherwise>
				</xsl:choose>
				
				<!-- 18 -->
				<xsl:text> </xsl:text>
				<!-- 19 -->
				<xsl:text> </xsl:text>
				<!-- 20-23 -->
				<xsl:text>4500</xsl:text>
			</leader>

			<xsl:for-each select="a001">
				<controlfield tag="001"><xsl:value-of select="."/></controlfield>
			</xsl:for-each>
			
			<controlfield tag="003">
				<xsl:choose>
					<xsl:when test="a196">
						<xsl:value-of select="a196"/>
					</xsl:when>
					<xsl:otherwise>XX-XxUND</xsl:otherwise>
				</xsl:choose>
			</controlfield>
			
			<xsl:if test="b020">
				<controlfield tag="006"><xsl:text>sar p       0    0</xsl:text></controlfield>
			</xsl:if>			

			<controlfield tag="007">
				<xsl:choose>
					<xsl:when test="b012='AA'">su uuuuuuuuuuu</xsl:when>
					<xsl:when test="b012='AB'">ss lsnjlbmpnue</xsl:when>
					<xsl:when test="b012='AC'">sd zsngnnmmnud</xsl:when>
					<xsl:when test="b012='AD'">ss lsnjlbmpnud</xsl:when>
					<xsl:when test="b012='AE'">sd zsnunnmmnud</xsl:when>
					<xsl:when test="b012='AZ'">sz zzzzzzzuuzz</xsl:when>
					<xsl:when test="b012='BA'">tu</xsl:when>
					<xsl:when test="b012='BB'">ta</xsl:when>
					<xsl:when test="b012='BC'">ta</xsl:when>
					<xsl:when test="b012='BD'">td</xsl:when>
					<xsl:when test="b012='BE'">ta</xsl:when>
					<xsl:when test="b012='BF'">ta</xsl:when>
					<xsl:when test="b012='BG'">ta</xsl:when>
					<xsl:when test="b012='BH'">tz</xsl:when>
					<xsl:when test="b012='BI'">tz</xsl:when>
					<xsl:when test="b012='BJ'">tz</xsl:when>
					<xsl:when test="b012='BZ'">tz</xsl:when>
					<xsl:when test="b012='CA'">aj cauua</xsl:when>
					<xsl:when test="b012='CB'">aj cauua</xsl:when>
					<xsl:when test="b012='CC'">aj cauua</xsl:when>
					<xsl:when test="b012='CD'">aj cauua</xsl:when>
					<xsl:when test="b012='CE'">du cun</xsl:when>
					<xsl:when test="b012='CZ'">aj cauua</xsl:when>
					<xsl:when test="b012='DA'">cu uuu---uuuuu</xsl:when>
					<xsl:when test="b012='DB'">cm ugu---uuuuu</xsl:when>
					<xsl:when test="b012='DC'">cm ugu---uuuuu</xsl:when>
					<xsl:when test="b012='DD'">vd cvaizu</xsl:when>
					<xsl:when test="b012='DE'">cb cua---uuuuu</xsl:when>
					<xsl:when test="b012='DF'">cj uau---uuuuu</xsl:when>
					<xsl:when test="b012='DG'">tz</xsl:when>
					<xsl:when test="b012='DH'">cr unu---aucuu</xsl:when>
					<xsl:when test="b012='DZ'">cu uuu---uuuuu</xsl:when>
					<xsl:when test="b012='FA'">gt cjuuuu</xsl:when>
					<xsl:when test="b012='FB'">go cjuuu</xsl:when>
					<xsl:when test="b012='FC'">gs cjuufu</xsl:when>
					<xsl:when test="b012='FD'">gt cjuuuc</xsl:when>
					<xsl:when test="b012='FZ'">gz cuuuzu</xsl:when>

				<xsl:otherwise>
					<xsl:if test="b012"><xsl:value-of select="." /></xsl:if>
				</xsl:otherwise>
				</xsl:choose>
			</controlfield>
			
			<controlfield tag="008">
				<xsl:text>      </xsl:text>
				<xsl:choose>
					<xsl:when test="b003 and b087">t</xsl:when>
					<xsl:otherwise>s</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
				<xsl:when test="b003 and b087">
					<xsl:value-of select="substring(b003,1,4)"/>
					<xsl:value-of select="substring(b087,1,4)"/>
				</xsl:when>
				<xsl:when test="b003">
					<xsl:value-of select="substring(b003,1,4)"/>
					<xsl:text>    </xsl:text>
				</xsl:when>
				<xsl:when test="b087">
					<xsl:value-of select="substring(b087,1,4)"/>
					<xsl:text>    </xsl:text>
				</xsl:when>
				<xsl:otherwise><xsl:text>        </xsl:text></xsl:otherwise>
				</xsl:choose>

				<xsl:choose>
					<xsl:when test="b251"></xsl:when>
				<xsl:otherwise><xsl:text>xx </xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:text>|||||||||||| ||||</xsl:text>
				<xsl:choose>
					<xsl:when test="b059">
						<xsl:value-of select="b059"/>
					</xsl:when>
					<xsl:when test="b253=01">
						<xsl:value-of select="b252"/>
					</xsl:when>
				<xsl:otherwise>
					<xsl:text>und</xsl:text>
				</xsl:otherwise>
				</xsl:choose>
				<xsl:text> d</xsl:text>
			</controlfield>

			<xsl:for-each select="b004">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">020</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="b005">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">3</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="b006">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">1</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="b008">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">2</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="b009">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">5</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			
			<xsl:for-each select="b007">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">037</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>


			<xsl:choose>
			<xsl:when test="a196">
				<xsl:for-each select="a196">
					<xsl:call-template name="datafield">
						<xsl:with-param name="tag">040</xsl:with-param>
						<xsl:with-param name="ind1">1</xsl:with-param>
						<xsl:with-param name="subfields">
							<subfield code='a'>
								<xsl:value-of select="."/>
							</subfield>
							<subfield code='c'>
								<xsl:value-of select="."/>
							</subfield>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">040</xsl:with-param>
					<xsl:with-param name="ind1">1</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>XX-XxUND</subfield>
						<subfield code='c'>XX-XxUND</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>				
			</xsl:choose>

		<xsl:for-each select="b064">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">072</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:value-of select="."/>
					</subfield>
					<subfield code="2">
						<xsl:text>basic</xsl:text>
						<xsl:for-each select="../b200">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</subfield>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>

		<xsl:for-each select="b067[text()='01' or text()='02']">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">082</xsl:with-param>
					<xsl:with-param name="ind1">
						<xsl:choose>
						<xsl:when test="text()='01'">0</xsl:when>
						<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>					
					<xsl:with-param name="subfields">
						<subfield code='a'><xsl:value-of select="../b069"/></subfield>
						<subfield code='2'><xsl:value-of select="../b068"/></subfield>
					</xsl:with-param>
				</xsl:call-template>
		</xsl:for-each>

		<xsl:if test="b067=25 or b191=25">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">084</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code='a'><xsl:value-of select="../b069"/></subfield>
					<subfield code='2'>
						<xsl:text>tmisbn</xsl:text>
						<xsl:for-each select="../b068">
							<xsl:text>/</xsl:text>
							<xsl:value-of select="."/>
						</xsl:for-each>
					</subfield>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>
			

		<xsl:for-each select="contributor[b036 or b037 or b040]">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">100</xsl:with-param>
				<xsl:with-param name="ind1">1</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:choose>
						<xsl:when test="b037">
							<xsl:value-of select="b037"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="b040"/>
							<xsl:text>, </xsl:text>
							<xsl:value-of select="b039"/>
						</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="b247">
							<xsl:text> </xsl:text>
							<xsl:value-of select="b247"/>
						</xsl:if>
						<xsl:if test="b041">
							<xsl:text>, </xsl:text>
							<xsl:value-of select="b247"/>
						</xsl:if>
					</subfield>
					<xsl:for-each select="b248">
						<subfield code="c">
							<xsl:value-of select="."/>
						</subfield>
					</xsl:for-each>
					<xsl:for-each select="b043">
						<subfield code="c">
							<xsl:value-of select="."/>
						</subfield>
					</xsl:for-each>
					<xsl:for-each select="b035">
						<subfield code="e">
							<xsl:choose>
								<xsl:when test=".='A01'">author</xsl:when>
								<xsl:when test=".='A12'">illustrator</xsl:when>
							</xsl:choose>
						</subfield>
					</xsl:for-each>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>

			
		<xsl:call-template name="datafield">
			<xsl:with-param name="tag">245</xsl:with-param>
			<xsl:with-param name="ind1">
			<xsl:choose>
			<xsl:when test="b036 or b037 or b040">1</xsl:when>
			<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
			</xsl:with-param>
			<xsl:with-param name="ind2">0</xsl:with-param>
			<xsl:with-param name="subfields">
				<subfield code="a">
					<xsl:value-of select="b028"/>
					<xsl:value-of select="b203"/>
				</subfield>
				<xsl:for-each select="b029">
					<subfield code="b">
						<xsl:value-of select="."/>
					</subfield>
				</xsl:for-each>
				<xsl:for-each select="contributor">
					<subfield code="c">
					<xsl:choose>
						<xsl:when test="b035='A01'">by</xsl:when>
						<xsl:when test="b035='A12'">illustraded by</xsl:when>
					</xsl:choose>
					<xsl:for-each select="b036">
						<xsl:text> </xsl:text><xsl:value-of select="."/>
					</xsl:for-each>
					</subfield>
				</xsl:for-each>
			</xsl:with-param>
		</xsl:call-template>


		<xsl:call-template name="datafield">
			<xsl:with-param name="tag">260</xsl:with-param>
			<xsl:with-param name="subfields">
				<subfield code="a">
					<xsl:choose>
						<xsl:when test="b209">
						<xsl:value-of select="b209"/>
						</xsl:when>
						<xsl:otherwise>[S.l.]</xsl:otherwise>
					</xsl:choose>
				</subfield>
				<subfield code="b">
					<xsl:choose>
						<xsl:when test="b081">
							<xsl:value-of select="b081"/>
						</xsl:when>
						<xsl:when test="b079">
							<xsl:value-of select="b079"/>
						</xsl:when>
						<xsl:otherwise>[s.n.]</xsl:otherwise>
					</xsl:choose>
				</subfield>
				<subfield code="c">
					<xsl:choose>
						<xsl:when test="b003">
							<xsl:value-of select="substring(b003,1,4)"/>
						</xsl:when>
						<xsl:when test="b087">
							<xsl:value-of select="substring(b087,1,4)"/>
						</xsl:when>
						<xsl:otherwise>[?]</xsl:otherwise>
					</xsl:choose>
				</subfield>
				<xsl:if test="b003 and b087 and (substring(b003,1,4) != substring(b087,1,4))">
					<subfield code="c">
						<xsl:value-of select="substring(b087,1,4)"/>
					</subfield>
				</xsl:if>
			</xsl:with-param>
		</xsl:call-template>


		<xsl:if test="b061">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">300</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:value-of select="b061"/><xsl:text> p.</xsl:text>
					</subfield>
					<xsl:if test="measure/c093='01'">
						<subfield code="c">
							<xsl:value-of select="measure/c094"/>
							<xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="measure/c095='gr'">grams.</xsl:when>
								<xsl:when test="measure/c095='in'">in.</xsl:when>
								<xsl:when test="measure/c095='lb'">pounds.</xsl:when>
								<xsl:when test="measure/c095='mm'">mm.</xsl:when>
								<xsl:when test="measure/c095='oz'">oz.</xsl:when>
							</xsl:choose>
						</subfield>
					</xsl:if>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:if>


		<xsl:for-each select="b073">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">521</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:choose>
							<xsl:when test=".='01'">General adult.</xsl:when>
							<xsl:when test=".='02'">Children/juvenile.</xsl:when>
							<xsl:when test=".='03'">Young adult.</xsl:when>
							<xsl:when test=".='04'">Primary and secondary school.</xsl:when>
							<xsl:when test=".='05'">College/higher education.</xsl:when>
							<xsl:when test=".='06'">Professional and scholarly.</xsl:when>
							<xsl:when test=".='07'">English as second language.</xsl:when>
						</xsl:choose>
					</subfield>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
			
		<xsl:for-each select="mediafile">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">856</xsl:with-param>
				<xsl:with-param name="ind1">
					<xsl:choose>
						<xsl:when test="f116='01'">4</xsl:when>
						<xsl:when test="f116='02'"> </xsl:when>
						<xsl:when test="f116='03'">4</xsl:when>
						<xsl:when test="f116='04'"> </xsl:when>
						<xsl:when test="f116='05'">1</xsl:when>
						<xsl:when test="f116='06'"> </xsl:when>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="ind2">2</xsl:with-param>
				<xsl:with-param name="subfields">
					<xsl:for-each select="f114">
						<subfield code="3">
							<xsl:choose>
								<xsl:when test=".='01'">Whole product</xsl:when>
								<xsl:when test=".='02'">Software demo</xsl:when>
								<xsl:when test=".='04'">Front cover image</xsl:when>
								<xsl:when test=".='07'">Front cover thumbnail</xsl:when>
								<xsl:when test=".='08'">Contributor image</xsl:when>
								<xsl:when test=".='10'">Series image</xsl:when>
								<xsl:when test=".='11'">Series logo</xsl:when>
								<xsl:when test=".='12'">Product logo</xsl:when>
								<xsl:when test=".='17'">Publisher logo</xsl:when>
								<xsl:when test=".='18'">Imprint logo</xsl:when>
								<xsl:when test=".='23'">Inside page image</xsl:when>
								<xsl:when test=".='29'">Video segment</xsl:when>
								<xsl:when test=".='30'">Audio segment</xsl:when>
							</xsl:choose>
						</subfield>
					</xsl:for-each>
					<xsl:for-each select="f117">
						<subfield code="u">
							<xsl:value-of select="."/>
						</subfield>
					</xsl:for-each>
					<xsl:if test="f119">
						<subfield code="y">
							<xsl:value-of select="f119"/>
							<xsl:if test="f115">
								<xsl:text>, </xsl:text><xsl:value-of select="f115"/>
							</xsl:if>
						</subfield>
					</xsl:if>
					<xsl:for-each select="f122">
						<subfield code="z">
							<xsl:value-of select="."/>
						</subfield>
					</xsl:for-each>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>			
		</record>
	</xsl:template>
	
	
	<xsl:template match="Product">
		<record>
			<leader>
				<!-- 00-04 -->
				<xsl:text>     </xsl:text>
				<!-- 05 -->
				<xsl:choose>
					<xsl:when test="NotificationType=01">n</xsl:when>
					<xsl:when test="NotificationType=02">n</xsl:when>
					<xsl:when test="NotificationType=03">c</xsl:when>
					<xsl:when test="NotificationType=04">c</xsl:when>
					<xsl:when test="NotificationType=05">d</xsl:when>
				</xsl:choose>
				<!-- 06 -->
				<xsl:choose>
					<xsl:when test="starts-with(ProductForm, 'A')">j</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'B')">a</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'C')">e</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'F')">g</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'M')">a</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'V')">g</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'W')">p</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'X')">r</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'Z')">r</xsl:when>
					<xsl:when test="ProductForm='DD'">g</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'D')">m</xsl:when>
					<xsl:when test="ProductForm='PH'">o</xsl:when>
					<xsl:when test="ProductForm='PI'">c</xsl:when>
					<xsl:when test="starts-with(ProductForm, 'P')">k</xsl:when>
					<xsl:otherwise><xsl:text> </xsl:text></xsl:otherwise>
				</xsl:choose>
				<!-- 07 -->
				<xsl:choose>
					<xsl:when test="YearOfAnnual">s</xsl:when>
					<xsl:otherwise>m</xsl:otherwise>
				</xsl:choose>
				<!-- 08 -->
				<xsl:text> </xsl:text>
				<!-- 09 -->
				<xsl:text> </xsl:text>
				<!-- 10 -->
				<xsl:text>2</xsl:text>
				<!-- 11 -->
				<xsl:text>2</xsl:text>
				<!-- 12-16 -->
				<xsl:text>     </xsl:text>
				<!-- 17 -->
				<xsl:choose>
					<xsl:when test="a002">
						<xsl:choose>
							<xsl:when test="NotificationType=01 or NotificationType=02">8</xsl:when>
							<xsl:otherwise>4</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>4</xsl:otherwise>
				</xsl:choose>
				
				<!-- 18 -->
				<xsl:text> </xsl:text>
				<!-- 19 -->
				<xsl:text> </xsl:text>
				<!-- 20-23 -->
				<xsl:text>4500</xsl:text>
			</leader>

			<xsl:for-each select="RecordReference">
				<controlfield tag="001"><xsl:value-of select="."/></controlfield>
			</xsl:for-each>

			<controlfield tag="003">
				<xsl:choose>
					<xsl:when test="RecordReference">
						<xsl:value-of select="RecordReference" />
					</xsl:when>
					<xsl:otherwise>XX-XxUND</xsl:otherwise>
				</xsl:choose>
			</controlfield>
			
			<xsl:if test="YearOfAnnual">
				<controlfield tag="006"><xsl:text>sar p       0    0</xsl:text></controlfield>
			</xsl:if>			

			<controlfield tag="007">
				<xsl:choose>
					<xsl:when test="ProductForm='AA'">su uuuuuuuuuuu</xsl:when>
					<xsl:when test="ProductForm='AB'">ss lsnjlbmpnue</xsl:when>
					<xsl:when test="ProductForm='AC'">sd zsngnnmmnud</xsl:when>
					<xsl:when test="ProductForm='AD'">ss lsnjlbmpnud</xsl:when>
					<xsl:when test="ProductForm='AE'">sd zsnunnmmnud</xsl:when>
					<xsl:when test="ProductForm='AZ'">sz zzzzzzzuuzz</xsl:when>
					<xsl:when test="ProductForm='BA'">tu</xsl:when>
					<xsl:when test="ProductForm='BB'">ta</xsl:when>
					<xsl:when test="ProductForm='BC'">ta</xsl:when>
					<xsl:when test="ProductForm='BD'">td</xsl:when>
					<xsl:when test="ProductForm='BE'">ta</xsl:when>
					<xsl:when test="ProductForm='BF'">ta</xsl:when>
					<xsl:when test="ProductForm='BG'">ta</xsl:when>
					<xsl:when test="ProductForm='BH'">tz</xsl:when>
					<xsl:when test="ProductForm='BI'">tz</xsl:when>
					<xsl:when test="ProductForm='BJ'">tz</xsl:when>
					<xsl:when test="ProductForm='BZ'">tz</xsl:when>
					<xsl:when test="ProductForm='CA'">aj cauua</xsl:when>
					<xsl:when test="ProductForm='CB'">aj cauua</xsl:when>
					<xsl:when test="ProductForm='CC'">aj cauua</xsl:when>
					<xsl:when test="ProductForm='CD'">aj cauua</xsl:when>
					<xsl:when test="ProductForm='CE'">du cun</xsl:when>
					<xsl:when test="ProductForm='CZ'">aj cauua</xsl:when>
					<xsl:when test="ProductForm='DA'">cu uuu---uuuuu</xsl:when>
					<xsl:when test="ProductForm='DB'">cm ugu---uuuuu</xsl:when>
					<xsl:when test="ProductForm='DC'">cm ugu---uuuuu</xsl:when>
					<xsl:when test="ProductForm='DD'">vd cvaizu</xsl:when>
					<xsl:when test="ProductForm='DE'">cb cua---uuuuu</xsl:when>
					<xsl:when test="ProductForm='DF'">cj uau---uuuuu</xsl:when>
					<xsl:when test="ProductForm='DG'">tz</xsl:when>
					<xsl:when test="ProductForm='DH'">cr unu---aucuu</xsl:when>
					<xsl:when test="ProductForm='DZ'">cu uuu---uuuuu</xsl:when>
					<xsl:when test="ProductForm='FA'">gt cjuuuu</xsl:when>
					<xsl:when test="ProductForm='FB'">go cjuuu</xsl:when>
					<xsl:when test="ProductForm='FC'">gs cjuufu</xsl:when>
					<xsl:when test="ProductForm='FD'">gt cjuuuc</xsl:when>
					<xsl:when test="ProductForm='FZ'">gz cuuuzu</xsl:when>

				<xsl:otherwise>
					<xsl:if test="ProductForm"><xsl:value-of select="." /></xsl:if>
				</xsl:otherwise>
				</xsl:choose>
			</controlfield>
			
			<controlfield tag="008">
				<xsl:text>      </xsl:text>
				<xsl:choose>
					<xsl:when test="PublicationDate and CopyrightYear">t</xsl:when>
					<xsl:otherwise>s</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="PublicationDate and CopyRightYear">
						<xsl:value-of select="substring(PublicationDate,1,4)"/>
						<xsl:value-of select="substring(CopyRightYear,1,4)"/>
					</xsl:when>
					<xsl:when test="PublicationDate">
						<xsl:value-of select="substring(PublicationDate,1,4)"/>
						<xsl:text>    </xsl:text>
					</xsl:when>
					<xsl:when test="CopyRightYear">
						<xsl:value-of select="substring(CopyRightYear,1,4)"/>
						<xsl:text>    </xsl:text>
					</xsl:when>
					<xsl:otherwise><xsl:text>        </xsl:text></xsl:otherwise>
				</xsl:choose>

				<xsl:choose>
					<xsl:when test="CountryCode"></xsl:when>
				<xsl:otherwise><xsl:text>xx </xsl:text></xsl:otherwise>
				</xsl:choose>
				<xsl:text>|||||||||||| ||||</xsl:text>
				<xsl:choose>
					<xsl:when test="LanguageOfText">
						<xsl:value-of select="LanguageOfText" />
					</xsl:when>	
					<xsl:when test="LanguageRole=01">
						<xsl:value-of select="LanguageCode" />
					</xsl:when>
				<xsl:otherwise>
					<xsl:text>und</xsl:text>
				</xsl:otherwise>
				</xsl:choose>
				<xsl:text> d</xsl:text>
			</controlfield>

			
			<xsl:for-each select="ISBN">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">020</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="." />
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>


			<xsl:for-each select="EAN13">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">3</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			

			<xsl:for-each select="UPC">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">1</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:for-each select="ISMN">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">024</xsl:with-param>
					<xsl:with-param name="ind1">2</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			

			<xsl:for-each select="PublisherProductNo">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">037</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>
							<xsl:value-of select="."/>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:choose>
				<xsl:when test="RecordSourceIdentifier">
					<xsl:for-each select="RecordSourceIdentifier">
						<xsl:call-template name="datafield">
							<xsl:with-param name="tag">040</xsl:with-param>
							<xsl:with-param name="ind1">1</xsl:with-param>
							<xsl:with-param name="subfields">
								<subfield code='a'>
									<xsl:value-of select="."/>
								</subfield>
								<subfield code='c'>
									<xsl:value-of select="."/>
								</subfield>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">040</xsl:with-param>
					<xsl:with-param name="ind1">1</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'>XX-XxUND</subfield>
						<subfield code='c'>XX-XxUND</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>				
			</xsl:choose>

			<xsl:for-each select="BASICMainSubject">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">072</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code="a">
							<xsl:value-of select="."/>
						</subfield>
						<subfield code="2">
							<xsl:text>basic</xsl:text>
							<xsl:for-each select="../BASICVersion">
								<xsl:text>/</xsl:text>
								<xsl:value-of select="."/>
							</xsl:for-each>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>


			<xsl:for-each select="SubjectSchemeIdentifier[text()='01' or text()='02']">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">082</xsl:with-param>
					<xsl:with-param name="ind1">
						<xsl:choose>
							<xsl:when test="text()='01'">0</xsl:when>
							<xsl:otherwise>1</xsl:otherwise>
						</xsl:choose>
					</xsl:with-param>					
					<xsl:with-param name="subfields">
						<subfield code='a'><xsl:value-of select="../SubjectCode"/></subfield>
						<subfield code='2'><xsl:value-of select="../SubjectSchemeVersion"/></subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			
			
			<xsl:if test="SubjectSchemeIdentifier=25 or MainSubjectSchemeIdentifier=25">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">084</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code='a'><xsl:value-of select="../SubjectCode"/></subfield>
						<subfield code='2'>
							<xsl:text>tmisbn</xsl:text>
							<xsl:for-each select="../SubjectSchemeVersion">
								<xsl:text>/</xsl:text>
								<xsl:value-of select="."/>
							</xsl:for-each>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>


			<xsl:for-each select="Contributor[PersonName or PersonNameInverted or KeyNames]">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">100</xsl:with-param>
					<xsl:with-param name="ind1">1</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code="a">
							<xsl:choose>
								<xsl:when test="PersonNameInverted">
									<xsl:value-of select="PersonNameInverted"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="KeyNames"/>
									<xsl:text>, </xsl:text>
									<xsl:value-of select="NamesBeforeKey"/>
								</xsl:otherwise>
							</xsl:choose>
							<xsl:if test="PrefixToKey">
								<xsl:text> </xsl:text>
								<xsl:value-of select="PrefixToKey"/>
							</xsl:if>
							<xsl:if test="NamesAfterKey">
								<xsl:text>, </xsl:text>
								<xsl:value-of select="PrefixToKey"/>
							</xsl:if>
						</subfield>
						<xsl:for-each select="SuffixToKey">
							<subfield code="c">
								<xsl:value-of select="."/>
							</subfield>
						</xsl:for-each>
						<xsl:for-each select="TitlesAfterNames">
							<subfield code="c">
								<xsl:value-of select="."/>
							</subfield>
						</xsl:for-each>
						<xsl:for-each select="ContributorRole">
							<subfield code="e">
								<xsl:choose>
									<xsl:when test=".='A01'">author</xsl:when>
									<xsl:when test=".='A12'">illustrator</xsl:when>
								</xsl:choose>
							</subfield>
						</xsl:for-each>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			
			
		  <xsl:for-each select="Title">
			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">245</xsl:with-param>
				<xsl:with-param name="ind1">
					<xsl:choose>
						<xsl:when test="PersonName or PersonNameInverted or KeyNames">1</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="ind2">0</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:value-of select="DistinctiveTitle"/>
						<xsl:value-of select="TitleText"/>
					</subfield>
					<xsl:for-each select="Subtitle">
						<subfield code="b">
							<xsl:value-of select="."/>
						</subfield>
					</xsl:for-each>
					<xsl:for-each select="Contributor">
						<subfield code="c">
							<xsl:choose>
								<xsl:when test="ContributorRole='A01'">by</xsl:when>
								<xsl:when test="ContributorRole='A12'">illustraded by</xsl:when>
							</xsl:choose>
							<xsl:for-each select="PersonName">
								<xsl:text> </xsl:text><xsl:value-of select="."/>
							</xsl:for-each>
						</subfield>
					</xsl:for-each>
				</xsl:with-param>
			</xsl:call-template>
		  </xsl:for-each>

			<xsl:call-template name="datafield">
				<xsl:with-param name="tag">260</xsl:with-param>
				<xsl:with-param name="subfields">
					<subfield code="a">
						<xsl:choose>
							<xsl:when test="CityOfPublication">
								<xsl:value-of select="CityOfPublication"/>
							</xsl:when>
							<xsl:otherwise>[S.l.]</xsl:otherwise>
						</xsl:choose>
					</subfield>
					<subfield code="b">
						<xsl:choose>
							<xsl:when test="PublisherName">
								<xsl:value-of select="PublisherName"/>
							</xsl:when>
							<xsl:when test="ImprintName">
								<xsl:value-of select="ImprintName"/>
							</xsl:when>
							<xsl:otherwise>[s.n.]</xsl:otherwise>
						</xsl:choose>
					</subfield>
					<subfield code="c">
						<xsl:choose>
							<xsl:when test="PublicationDate">
								<xsl:value-of select="substring(PublicationDate,1,4)"/>
							</xsl:when>
							<xsl:when test="CopyrightYear">
								<xsl:value-of select="substring(CopyrightYear,1,4)"/>
							</xsl:when>
							<xsl:otherwise>[?]</xsl:otherwise>
						</xsl:choose>
					</subfield>
					<xsl:if test="PublicationDate and CopyrightYear and (substring(PublicationDate,1,4) != substring(CopyrightYear,1,4))">
						<subfield code="c">
							<xsl:value-of select="substring(CopyrightYear,1,4)"/>
						</subfield>
					</xsl:if>
				</xsl:with-param>
			</xsl:call-template>


		
			<xsl:if test="NumberOfPages">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">300</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code="a">
							<xsl:value-of select="NumberOfPages"/><xsl:text> p.</xsl:text>
						</subfield>
						<xsl:if test="Measure/MeasureTypeCode='01'">
							<subfield code="c">
								<xsl:value-of select="Measure/Measurement"/>
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="Measure/MeasureUnitCode='gr'">grams.</xsl:when>
									<xsl:when test="Measure/MeasureUnitCode='in'">in.</xsl:when>
									<xsl:when test="Measure/MeasureUnitCode='lb'">pounds.</xsl:when>
									<xsl:when test="Measure/MeasureUnitCode='mm'">mm.</xsl:when>
									<xsl:when test="Measure/MeasureUnitCode='oz'">oz.</xsl:when>
								</xsl:choose>
							</subfield>
						</xsl:if>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:if>


			
			<xsl:for-each select="AudienceCode">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">521</xsl:with-param>
					<xsl:with-param name="subfields">
						<subfield code="a">
							<xsl:choose>
								<xsl:when test=".='01'">General adult.</xsl:when>
								<xsl:when test=".='02'">Children/juvenile.</xsl:when>
								<xsl:when test=".='03'">Young adult.</xsl:when>
								<xsl:when test=".='04'">Primary and secondary school.</xsl:when>
								<xsl:when test=".='05'">College/higher education.</xsl:when>
								<xsl:when test=".='06'">Professional and scholarly.</xsl:when>
								<xsl:when test=".='07'">English as second language.</xsl:when>
							</xsl:choose>
						</subfield>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			
			
	
			
			<xsl:for-each select="MediaFile">
				<xsl:call-template name="datafield">
					<xsl:with-param name="tag">856</xsl:with-param>
					<xsl:with-param name="ind1">
						<xsl:choose>
							<xsl:when test="MediaFileLinkTypeCode='01'">4</xsl:when>
							<xsl:when test="MediaFileLinkTypeCode='02'"> </xsl:when>
							<xsl:when test="MediaFileLinkTypeCode='03'">4</xsl:when>
							<xsl:when test="MediaFileLinkTypeCode='04'"> </xsl:when>
							<xsl:when test="MediaFileLinkTypeCode='05'">1</xsl:when>
							<xsl:when test="MediaFileLinkTypeCode='06'"> </xsl:when>
						</xsl:choose>
					</xsl:with-param>
					<xsl:with-param name="ind2">2</xsl:with-param>
					<xsl:with-param name="subfields">
						<xsl:for-each select="MediaFileTypeCode">
							<subfield code="3">
								<xsl:choose>
									<xsl:when test=".='01'">Whole product</xsl:when>
									<xsl:when test=".='02'">Software demo</xsl:when>
									<xsl:when test=".='04'">Front cover image</xsl:when>
									<xsl:when test=".='07'">Front cover thumbnail</xsl:when>
									<xsl:when test=".='08'">Contributor image</xsl:when>
									<xsl:when test=".='10'">Series image</xsl:when>
									<xsl:when test=".='11'">Series logo</xsl:when>
									<xsl:when test=".='12'">Product logo</xsl:when>
									<xsl:when test=".='17'">Publisher logo</xsl:when>
									<xsl:when test=".='18'">Imprint logo</xsl:when>
									<xsl:when test=".='23'">Inside page image</xsl:when>
									<xsl:when test=".='29'">Video segment</xsl:when>
									<xsl:when test=".='30'">Audio segment</xsl:when>
								</xsl:choose>
							</subfield>
						</xsl:for-each>
						<xsl:for-each select="MediaFileLink">
							<subfield code="u">
								<xsl:value-of select="."/>
							</subfield>
						</xsl:for-each>
						<xsl:if test="DownloadCaption">
							<subfield code="y">
								<xsl:value-of select="DownLoadCaption"/>
								<xsl:if test="MediaFileFormatCode">
									<xsl:text>, </xsl:text><xsl:value-of select="MediaFileFormatCode"/>
								</xsl:if>
							</subfield>
						</xsl:if>
						<xsl:for-each select="DownloadTerms">
							<subfield code="z">
								<xsl:value-of select="."/>
							</subfield>
						</xsl:for-each>
					</xsl:with-param>
				</xsl:call-template>
			</xsl:for-each>
			
			
		</record>
	</xsl:template>
</xsl:stylesheet>
<!--http://creativecommons.org/licenses/zero/1.0/
	Creative Commons 1.0 Universal
	The person who associated a work with this document has dedicated this work to the 
	Commons by waiving all of his or her rights to the work under copyright law and all 
	related or neighboring legal rights he or she had in the work, to the extent allowable by law. 
-->