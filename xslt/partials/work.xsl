<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:df="http://example.com/df" xmlns:mam="personalShit" version="2.0"
    exclude-result-prefixes="xsl tei xs">
    <xsl:param name="works"
        select="document('https://raw.githubusercontent.com/martinantonmueller/schnitzler-lektueren/master/data/indices/listwork.xml')"/>
    <xsl:key name="work-lookup" match="tei:bibl" use="tei:relatedItem/@target"/>
    <xsl:param name="konkordanz"
        select="document('https://raw.githubusercontent.com/martinantonmueller/schnitzler-lektueren/master/data/indices/konkordanz.xml')"/>
    <xsl:key name="konk-lookup" match="ref" use="@xml:id"/>
    <xsl:template match="tei:bibl" name="work_detail">
        <xsl:param name="showNumberOfMentions" as="xs:integer" select="50000"/>
        <xsl:variable name="selfLink">
            <xsl:value-of select="concat(data(@xml:id), '.html')"/>
        </xsl:variable>
        <div class="card-body-tagebuch w-75">
            <div class="mt-2">
                <span class="infodesc mr-2"><xs:text>&#8594;</xs:text></span>
                <span>
                    <xsl:for-each select="tei:author">
                        <xsl:variable name="autor-ref" select="substring-after(@ref,'#')"/>
                        <a href="{concat($autor-ref,'.html')}">
                            <xsl:value-of select="."/>
                        </a>
                        <xsl:variable name="link"
                            select="key('konk-lookup', $autor-ref, $konkordanz)[1]/@target"/>
                        <xsl:text> </xsl:text>
                        <span class="button">
                            <a href="{concat($link, '#',$autor-ref)}" class="blinkwink leseliste-button"
                                >Leseliste</a>
                        </span>
                        <xsl:if test="not(position() = last())">
                           <br/>
                        </xsl:if>
                    </xsl:for-each>
                </span>
            </div>
            <p/>
            <div>
                <xsl:if test="tei:title[@level = 'a']">
                    <span class="titel">
                        <xsl:value-of select="tei:title[@level = 'a']"/>
                    </span>
                    <xsl:if
                        test="not(ends-with(tei:title[@level = 'a'], '?') or ends-with(tei:title[@level = 'a'], '!') or ends-with(tei:title[@level = 'a'], '.'))">
                        <xsl:text>. </xsl:text>
                    </xsl:if>
                    <xsl:text>In: </xsl:text>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@level = 'm']">
                        <span class="titel">
                            <xsl:value-of select="tei:title[@level = 'm']"/>
                        </span>
                        <xsl:if
                            test="not(ends-with(tei:title[@level = 'm'], '?') or ends-with(tei:title[@level = 'm'], '!') or ends-with(tei:title[@level = 'm'], '.'))">
                            <xsl:text>. </xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="tei:title[@level = 'j']">
                        <span class="titel">
                            <xsl:value-of select="tei:title[@level = 'j']"/>
                        </span>
                        <xsl:if
                            test="not(ends-with(tei:title[@level = 'j'], '?') or ends-with(tei:title[@level = 'j'], '!') or ends-with(tei:title[@level = 'j'], '.'))">
                            <xsl:text>. </xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="tei:title[@level = 's']">
                        <span class="titel">
                            <xsl:value-of select="tei:title[@level = 's']"/>
                        </span>
                        <xsl:if
                            test="not(ends-with(tei:title[@level = 's'], '?') or ends-with(tei:title[@level = 's'], '!') or ends-with(tei:title[@level = 's'], '.'))">
                            <xsl:text>. </xsl:text>
                        </xsl:if>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="tei:editor[@role = 'hrsg']">
                    <xsl:text>Hrsg. </xsl:text>
                    <xsl:for-each select="tei:editor[@role = 'hrsg']">
                        <xsl:value-of select="."/>
                        <xsl:choose>
                            <xsl:when test="position() = last()">
                                <xsl:text>:</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>, </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="tei:editor[@role = 'translator']">
                    <xsl:choose>
                        <xsl:when test="tei:editor[@role = 'translator']/text() = ''">
                            <xsl:text>[Ohne Übersetzerangabe.] </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>Übersetzt von </xsl:text>
                            <xsl:for-each select="tei:editor[@role = 'translator']">
                                <xsl:value-of select="."/>
                                <xsl:choose>
                                    <xsl:when test="position() = last()">
                                        <xsl:text>. </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>, </xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
                <xsl:if test="not(tei:editor[@role = 'translator']) and tei:relatedItem">
                    <xsl:text>[Ohne Übersetzerangabe.] </xsl:text>
                </xsl:if>
                <xsl:if test="tei:pubPlace">
                    <xsl:for-each select="tei:pubPlace">
                        <xsl:apply-templates/>
                        <xsl:choose>
                            <xsl:when test="position() = last()">
                                <xsl:text> </xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>, </xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </xsl:if>
                <xsl:if test="tei:date">
                    <xsl:value-of select="tei:date"/>
                    <xsl:if test="not(ends-with(tei:date, '.'))">
                        <xsl:text>.</xsl:text>
                    </xsl:if>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="tei:title[@level = 'm'] and tei:title[@level = 's']">
                        <xsl:text> (</xsl:text>
                        <span class="titel">
                            <xsl:value-of select="tei:title[@level = 's']"/>
                        </span>
                        <xsl:text>)</xsl:text>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="tei:note">
                    <xsl:if test="parent::*/child::*[2]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:text>[</xsl:text>
                    <xsl:value-of select="tei:note"/>
                    <xsl:text>]</xsl:text>
                </xsl:if>
                <xsl:if test="tei:ref">
                    <xsl:for-each select="tei:ref">
                        <xsl:text> </xsl:text>
                        <span>
                            <xsl:element name="a">
                                <xsl:choose>
                                    <xsl:when test="@type = 'schnitzler-briefe'">
                                        <xsl:attribute name="class">
                                            <xsl:text>briefe-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://schnitzler-briefe.acdh.oeaw.ac.at/pages/bibl.html</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'schnitzler-tagebuch'">
                                        <xsl:attribute name="class">
                                            <xsl:text>tagebuch-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://schnitzler-tagebuch.acdh.oeaw.ac.at/listwork.html</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'bahrschnitzler'">
                                        <xsl:attribute name="class">
                                            <xsl:text>bahrschnitzler-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://bahrschnitzler.acdh.oeaw.ac.at/register.html?view-mode=1</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'briefe_ii'">
                                        <xsl:attribute name="class">
                                            <xsl:text>black-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://shared.acdh.oeaw.ac.at/schnitzler-briefe/1984_Briefe-1913–1931.pdf</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'briefe_i'">
                                        <xsl:attribute name="class">
                                            <xsl:text>black-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://shared.acdh.oeaw.ac.at/schnitzler-briefe/1981_Briefe-1875–1912.pdf</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'jugend-in-wien'">
                                        <xsl:attribute name="class">
                                            <xsl:text>black-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>http://www.zeno.org/Literatur/M/Schnitzler,+Arthur/Autobiographisches/Jugend+in+Wien</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:when test="@type = 'widmungDLA'">
                                        <xsl:attribute name="class">
                                            <xsl:text>black-workbutton</xsl:text>
                                        </xsl:attribute>
                                        <xsl:attribute name="href">
                                            <xsl:text>https://www.dla-marbach.de/find/opac/id/BF00019455/</xsl:text>
                                        </xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="class">
                                            <xsl:text>black-workbutton</xsl:text>
                                        </xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:attribute name="target">
                                    <xsl:text>_blank</xsl:text>
                                </xsl:attribute>
                                <xsl:element name="span">
                                    <xsl:attribute name="class">
                                        <xsl:value-of select="concat('color-', @type)"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="mam:ahref-namen(@type)"/>
                                </xsl:element>
                            </xsl:element>
                        </span>
                    </xsl:for-each>
                </xsl:if>
                <xsl:for-each select="child::tei:idno[not(@type = 'schnitzler-lektueren')]">
                    <xsl:text> </xsl:text>
                    <xsl:choose>
                        <xsl:when test="not(. = '')">
                            <span>
                                <xsl:element name="a">
                                    <xsl:attribute name="class">
                                        <xsl:choose>
                                            <xsl:when test="@type = 'gnd'">
                                                <xsl:text>wikipedia-workbutton</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@type = 'schnitzler-briefe'">
                                                <xsl:text>briefe-workbutton</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@type = 'schnitzler-tagebuch'">
                                                <xsl:text>tagebuch-workbutton</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@type = 'bahrschnitzler'">
                                                <xsl:text>bahrschnitzler-workbutton</xsl:text>
                                            </xsl:when>
                                            <xsl:when test="@type = 'pmb'">
                                                <xsl:text>pmb-workbutton</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="@type"/>
                                                <xsl:text>XXXX</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="href">
                                        <xsl:choose>
                                            <xsl:when
                                                test="@type = 'pmb' and not(contains(., 'http'))">
                                                <xsl:value-of
                                                  select="concat('https://pmb.acdh.oeaw.ac.at/apis/entities/entity/work/', substring-after(., 'pmb'), '/detail')"
                                                />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:attribute>
                                    <xsl:attribute name="target">
                                        <xsl:text>_blank</xsl:text>
                                    </xsl:attribute>
                                    <xsl:element name="span">
                                        <xsl:attribute name="class">
                                            <xsl:value-of select="concat('color-', @type)"/>
                                        </xsl:attribute>
                                        <xsl:value-of select="mam:ahref-namen(@type)"/>
                                    </xsl:element>
                                </xsl:element>
                            </span>
                            <xsl:text> </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:element name="span">
                                <xsl:attribute name="class">
                                    <xsl:text>color-inactive</xsl:text>
                                </xsl:attribute>
                                <xsl:value-of select="mam:ahref-namen(@type)"/>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="position() = last()">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="key('work-lookup', concat('#', @xml:id), $works)">
                    <ul class="dashed">
                        <xsl:for-each select="key('work-lookup', concat('#', @xml:id), $works)">
                            <li>
                                <xsl:if test="tei:title[@level = 'a']">
                                    <span class="titel">
                                        <xsl:value-of select="tei:title[@level = 'a']"/>
                                    </span>
                                    <xsl:if
                                        test="not(ends-with(tei:title[@level = 'a'], '?') or ends-with(tei:title[@level = 'a'], '!') or ends-with(tei:title[@level = 'a'], '.'))">
                                        <xsl:text>. </xsl:text>
                                    </xsl:if>
                                    <xsl:text>In: </xsl:text>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="tei:title[@level = 'm']">
                                        <span class="titel">
                                            <xsl:value-of select="tei:title[@level = 'm']"/>
                                        </span>
                                        <xsl:if
                                            test="not(ends-with(tei:title[@level = 'm'], '?') or ends-with(tei:title[@level = 'm'], '!') or ends-with(tei:title[@level = 'm'], '.'))">
                                            <xsl:text>. </xsl:text>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="tei:title[@level = 'j']">
                                        <span class="titel">
                                            <xsl:value-of select="tei:title[@level = 'j']"/>
                                        </span>
                                        <xsl:if
                                            test="not(ends-with(tei:title[@level = 'j'], '?') or ends-with(tei:title[@level = 'j'], '!') or ends-with(tei:title[@level = 'j'], '.'))">
                                            <xsl:text>. </xsl:text>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="tei:title[@level = 's']">
                                        <span class="titel">
                                            <xsl:value-of select="tei:title[@level = 's']"/>
                                        </span>
                                        <xsl:if
                                            test="not(ends-with(tei:title[@level = 's'], '?') or ends-with(tei:title[@level = 's'], '!') or ends-with(tei:title[@level = 's'], '.'))">
                                            <xsl:text>. </xsl:text>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="tei:editor[@role = 'hrsg']">
                                    <xsl:text>Hrsg. </xsl:text>
                                    <xsl:for-each select="tei:editor[@role = 'hrsg']">
                                        <xsl:value-of select="."/>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:text>:</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>, </xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="tei:editor[@role = 'translator']">
                                    <xsl:choose>
                                        <xsl:when
                                            test="tei:editor[@role = 'translator']/text() = ''">
                                            <xsl:text>[Ohne Übersetzerangabe.] </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>Übersetzt von </xsl:text>
                                            <xsl:for-each select="tei:editor[@role = 'translator']">
                                                <xsl:value-of select="."/>
                                                <xsl:choose>
                                                  <xsl:when test="position() = last()">
                                                  <xsl:text>. </xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:text>, </xsl:text>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:if>
                                <xsl:if
                                    test="not(tei:editor[@role = 'translator']) and tei:relatedItem">
                                    <xsl:text>[Ohne Übersetzerangabe.] </xsl:text>
                                </xsl:if>
                                <xsl:if test="tei:pubPlace">
                                    <xsl:for-each select="tei:pubPlace">
                                        <xsl:apply-templates/>
                                        <xsl:choose>
                                            <xsl:when test="position() = last()">
                                                <xsl:text> </xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>, </xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:if test="tei:date">
                                    <xsl:value-of select="tei:date"/>
                                    <xsl:if test="not(ends-with(tei:date, '.'))">
                                        <xsl:text>.</xsl:text>
                                    </xsl:if>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when
                                        test="tei:title[@level = 'm'] and tei:title[@level = 's']">
                                        <xsl:text> (</xsl:text>
                                        <span class="titel">
                                            <xsl:value-of select="tei:title[@level = 's']"/>
                                        </span>
                                        <xsl:text>)</xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="tei:note">
                                    <xsl:if test="parent::*/child::*[2]">
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="tei:note"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:if>
                                <xsl:if test="tei:ref">
                                    <xsl:for-each select="tei:ref">
                                        <xsl:text> </xsl:text>
                                        <span>
                                            <xsl:element name="a">
                                                <xsl:choose>
                                                  <xsl:when test="@type = 'schnitzler-briefe'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>briefe-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://schnitzler-briefe.acdh.oeaw.ac.at/pages/bibl.html</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'schnitzler-tagebuch'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>tagebuch-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://schnitzler-tagebuch.acdh.oeaw.ac.at/listwork.html</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'bahrschnitzler'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>bahrschnitzler-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://bahrschnitzler.acdh.oeaw.ac.at/register.html?view-mode=1</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'briefe_ii'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>black-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://shared.acdh.oeaw.ac.at/schnitzler-briefe/1984_Briefe-1913–1931.pdf</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'briefe_i'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>black-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://shared.acdh.oeaw.ac.at/schnitzler-briefe/1981_Briefe-1875–1912.pdf</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'jugend-in-wien'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>black-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>http://www.zeno.org/Literatur/M/Schnitzler,+Arthur/Autobiographisches/Jugend+in+Wien</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'widmungDLA'">
                                                  <xsl:attribute name="class">
                                                  <xsl:text>black-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:text>https://www.dla-marbach.de/find/opac/id/BF00019455/</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:attribute name="class">
                                                  <xsl:text>black-workbutton</xsl:text>
                                                  </xsl:attribute>
                                                  </xsl:otherwise>
                                                </xsl:choose>
                                                <xsl:attribute name="target">
                                                  <xsl:text>_blank</xsl:text>
                                                </xsl:attribute>
                                                <xsl:element name="span">
                                                  <xsl:attribute name="class">
                                                  <xsl:value-of select="concat('color-', @type)"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="mam:ahref-namen(@type)"/>
                                                </xsl:element>
                                            </xsl:element>
                                        </span>
                                    </xsl:for-each>
                                </xsl:if>
                                <xsl:for-each
                                    select="child::tei:idno[not(@type = 'schnitzler-lektueren')]">
                                    <xsl:text> </xsl:text>
                                    <xsl:choose>
                                        <xsl:when test="not(. = '')">
                                            <span>
                                                <xsl:element name="a">
                                                  <xsl:attribute name="class">
                                                  <xsl:choose>
                                                  <xsl:when test="@type = 'gnd'">
                                                  <xsl:text>wikipedia-workbutton</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'schnitzler-briefe'">
                                                  <xsl:text>briefe-workbutton</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'schnitzler-tagebuch'">
                                                  <xsl:text>tagebuch-workbutton</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'bahrschnitzler'">
                                                  <xsl:text>bahrschnitzler-workbutton</xsl:text>
                                                  </xsl:when>
                                                  <xsl:when test="@type = 'pmb'">
                                                  <xsl:text>pmb-workbutton</xsl:text>
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="@type"/>
                                                  <xsl:text>XXXX</xsl:text>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="href">
                                                  <xsl:choose>
                                                  <xsl:when
                                                  test="@type = 'pmb' and not(contains(., 'http'))">
                                                  <xsl:value-of
                                                  select="concat('https://pmb.acdh.oeaw.ac.at/apis/entities/entity/work/', substring-after(., 'pmb'), '/detail')"
                                                  />
                                                  </xsl:when>
                                                  <xsl:otherwise>
                                                  <xsl:value-of select="."/>
                                                  </xsl:otherwise>
                                                  </xsl:choose>
                                                  </xsl:attribute>
                                                  <xsl:attribute name="target">
                                                  <xsl:text>_blank</xsl:text>
                                                  </xsl:attribute>
                                                  <xsl:element name="span">
                                                  <xsl:attribute name="class">
                                                  <xsl:value-of select="concat('color-', @type)"/>
                                                  </xsl:attribute>
                                                  <xsl:value-of select="mam:ahref-namen(@type)"/>
                                                  </xsl:element>
                                                </xsl:element>
                                            </span>
                                            <xsl:text> </xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:element name="span">
                                                <xsl:attribute name="class">
                                                  <xsl:text>color-inactive</xsl:text>
                                                </xsl:attribute>
                                                <xsl:value-of select="mam:ahref-namen(@type)"/>
                                            </xsl:element>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <xsl:if test="position() = last()">
                                        <xsl:text> </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
            </div>
        </div>
    </xsl:template>
    <xsl:function name="mam:pmbChange">
        <xsl:param name="url" as="xs:string"/>
        <xsl:param name="entitytyp" as="xs:string"/>
        <xsl:value-of select="
                concat('https://pmb.acdh.oeaw.ac.at/apis/entities/entity/', $entitytyp, '/',
                substring-after($url, 'https://pmb.acdh.oeaw.ac.at/entity/'), '/detail')"/>
    </xsl:function>
    <xsl:function name="mam:ahref-namen">
        <xsl:param name="typityp" as="xs:string"/>
        <xsl:choose>
            <xsl:when test="$typityp = 'schnitzler-tagebuch'">
                <xsl:text> Tagebuch</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'schnitzler-briefe'">
                <xsl:text> Briefe</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'PMB'">
                <xsl:text> PMB</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'pmb'">
                <xsl:text> PMB</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'briefe_i'">
                <xsl:text> Briefe 1875–1912</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'briefe_ii'">
                <xsl:text> Briefe 1913–1931</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'DLAwidmund'">
                <xsl:text> Widmungsexemplar Deutsches Literaturarchiv</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'jugend-in-wien'">
                <xsl:text> Jugend in Wien</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'gnd'">
                <xsl:text> Wikipedia?</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'bahrschnitzler'">
                <xsl:text> Bahr/Schnitzler</xsl:text>
            </xsl:when>
            <xsl:when test="$typityp = 'widmungDLA'">
                <xsl:text> Widmung DLA</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> </xsl:text>
                <xsl:value-of select="$typityp"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    <xsl:template match="tei:supplied">
        <xsl:text>[</xsl:text>
        <xsl:apply-templates/>
        <xsl:text>]</xsl:text>
    </xsl:template>
</xsl:stylesheet>