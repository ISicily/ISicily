<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.ascc.net/xml/schematron" xmlns:t="http://www.tei-c.org/ns/1.0">
    <ns uri="http://www.tei-c.org/ns/1.0" prefix="t"/>
    <!--<pattern name="Print both cases">
        <rule context="AAA">
            <assert test="BBB">BBB element is missing.</assert>
            <report test="BBB">BBB element is present.</report>
            <assert test="@name">AAA misses attribute name.</assert>
            <report test="@name">AAA contains attribute name.</report>
        </rule>
    </pattern>-->
    <pattern name="Test gap attributes">
        <rule context="//t:gap">
            <report test="(@extent and @quantity)">conflict: @quantity and @extent both present on <name/></report>
            <report test="(@reason='lost' or @reason='omitted') and not(@extent or @quantity or (@atLeast and @atMost))"><name/> needs one of @extent, @quantity or both @atLeast and @atMost</report>
            <report test="(@reason='lost' or @reason='omitted') and not(@unit)"><name/> lost or omitted needs @unit</report>
        </rule>
    </pattern>
    <pattern name="Test space attributes">
        <rule context="//t:space">
            <report test="(@extent and @quantity)">conflict: @quantity and @extent both present on <name/></report>
            <report test="(@reason='lost' or @reason='omitted') and not(@extent or @quantity or (@atleast and @atMost))"><name/> needs one of @extent, @quantity or both @atLeast and @atMost</report>
            <report test="(@reason='lost' or @reason='omitted') and not(@unit)"><name/> lost or omitted needs @unit</report>
        </rule>
    </pattern>
    <pattern name="Check for gaps in supplied">
        <rule context="//t:div[@type='edition']//t:gap[not(@reason='ellipsis')]">
            <report test="ancestor::t:supplied[not(@reason='undefined')]">Supplied may not contain <name/></report>
        </rule>
    </pattern>
    <pattern name="checking for Leiden sigla">
        <!-- the regexes below will only work if you have Schematron set to XPATH version 2.0 in your local environment -->
        <!-- in Oxygen: Options > Preferences > XML > XML Parser > Schematron -->
        <rule context="//t:div[@type='edition'][@xml:lang='grc|la|xly|xly-Grek|scx-Latn|xly-Latn']"> 
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'[\[\]\(\)]')]">Brackets and parentheses in epigraphic text</report>
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'&#x0323;|&#xE1C0;')]">Underdots in epigraphic text</report>
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'&lt;|&gt;')]">Angle brackets in epigraphic text</report>
        </rule>
        <rule context="//t:div[@type='edition'][@xml:lang='xpu-Latn']"> <!-- for Punic transliteration where underdots are allowed because unclear symbol is different  -->
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'[\[\]\(\)]')]">Brackets and parentheses in epigraphic text</report>
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'&#x30A;')]">Unclear character in epigraphic text</report>
            <report test="descendant::text()[not(ancestor::t:desc or ancestor::t:note)][matches(.,'&lt;|&gt;')]">Angle brackets in epigraphic text</report>
        </rule>
    </pattern>
    <!--<pattern name="Check for untagged words">
        <rule context="//t:div[@type='edition']">
            <report test="descendant::text()[not(ancestor::t:w or ancestor::t:name or ancestor::t:placeName or ancestor::t:geogName or ancestor::t:num or ancestor::t:surplus
                or ancestor::t:orig or ancestor::t:desc or ancestor::t:note or ancestor::t:head or ancestor::t:g or ancestor::t:abbr[not(ancestor::t:expan)])][not(translate(normalize-space(translate(.,',.;··:','')),' ','')='')]">
                Character content needs to be tagged as word or name or number or undefined etc.
            </report>
        </rule>
    </pattern>-->
    <!--<pattern name="Check for problems with names and persnames">
        <rule context="//t:div[@type='edition']//t:name">
            <report test="not(ancestor::t:persName or ancestor::t:placeName)"><name/> needs to be inside persName or placeName</report>
        </rule>
        <rule context="//t:div[@type='edition']//t:persName">
            <report test="not(@type=('divine','emperor','ruler','consul','attested','other'))"><name/> @type needs to be one of 'divine','emperor','ruler',consul','attested','other'</report>
        </rule>
    </pattern>-->
    <pattern name="Problems with abbreviations/expansions">
        <rule context="//t:ex">
            <report test="not(ancestor::t:expan)"><name/> should only appear inside expan</report>
            <report test="parent::t:abbr"><name/> should not be a child of abbr</report>
        </rule>
        <rule context="//t:expan">
            <report test="not(descendant::t:ex)"><name/> should contain ex</report>
            <report test="descendant::text()[not(translate(normalize-space(.),' ','')='')][not(ancestor::t:ex or ancestor::t:abbr)]">all text in expan should be in abbr or ex</report>
        </rule>

    </pattern>
    
    <pattern name="checking for Leiden sigla in app">
        <!-- the regexes below will only work if you have Schematron set to XPATH version 2.0 in your local environment -->
        <!-- in Oxygen: Options > Preferences > XML > XML Parser > Schematron -->
        <rule context="//t:div[@type='apparatus']">
            <report test="descendant::t:note[matches(.,'&#x0323;|&#xE1C0;')]">Underdots in apparatus</report>
            <report test="descendant::t:note[matches(.,'&lt;|&gt;')]">Angle brackets in apparatus</report>
        </rule>
    </pattern>
    
    
</schema>
