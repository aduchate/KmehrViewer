<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:kmehr="http://www.ehealth.fgov.be/standards/kmehr/schema/v1"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xsi:schemaLocation="http://www.ehealth.fgov.be/standards/kmehr/schema/v1 http://www.icure.eu/schema/1.4/ehealth-kmehr/XSD/kmehr_elements-1_4.xsd">
    <xsl:param name="annexdirectory"/>
    <xsl:param name="translationdictionary"/>
    <xsl:param name="language"/>
    <xsl:param name="directory"/>
    <xsl:variable name="defaultlanguage" select="'english'"/>
    <xsl:variable name="translationdictionarypath">
        <xsl:call-template name="get-translationdictionary-path"/>
    </xsl:variable>
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">
        <html>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
            <!-- 0 -->
            <style>

                body {
                font-family:Arial, Verdana, Sans-serif;
                }

                h1 {
                margin-top:0.4em;
                margin-bottom:0.4em;
                font-size:1.9em;
                }

                h3 {
                color:#222244;
                margin-top:0.4em;
                margin-bottom:0em;
                padding-top:0.4em;
                padding-bottom:0.4em;
                }

                h3.clickable {
                cursor:pointer;
                }

                h4 {
                margin-top:0.6em;
                margin-bottom:0.4em;
                color:#222244;
                font-size:1.00em;
                }

                h4.clickable {
                cursor:pointer;
                }

                div.separator {
                background:#CCCCCC;
                }

                div.TransactionContent {
                background:#F0F0F0;
                }

                div.ItemContent {
                padding-top:0.2em;
                padding-bottom:0.2em;
                }

                div.TransactionContentTitle {
                background-image: linear-gradient(bottom, rgb(240,240,240) 0%, rgb(224,224,224) 63%, rgb(184,184,184)
                100%);
                background-image: -o-linear-gradient(bottom, rgb(240,240,240) 0%, rgb(224,224,224) 63%, rgb(184,184,184)
                100%);
                background-image: -moz-linear-gradient(bottom, rgb(240,240,240) 0%, rgb(224,224,224) 63%,
                rgb(184,184,184) 100%);
                background-image: -webkit-linear-gradient(bottom, rgb(240,240,240) 0%, rgb(224,224,224) 63%,
                rgb(184,184,184) 100%);
                background-image: -ms-linear-gradient(bottom, rgb(240,240,240) 0%, rgb(224,224,224) 63%,
                rgb(184,184,184) 100%);

                background-image: -webkit-gradient(
                linear,
                left bottom,
                left top,
                color-stop(0, rgb(240,240,240)),
                color-stop(0.63, rgb(224,224,224)),
                color-stop(1, rgb(184,184,184))
                );
                }

                b.subpart {
                color:#222244;
                margin-left:0.3em;
                font-size:0.9em
                }

                b.clickable {
                cursor:pointer;
                }

                button.view {
                width:10em;
                }

                table {
                margin-left:2em;
                text-align: left;
                font-size: 0.7em;
                font-family: verdana;
                background: #CCCCCC;
                border-collapse: collapse;
                }

                table.subpart {
                margin-bottom:3pt;
                }

                table thead {
                cursor: pointer;
                }

                table thead tr,
                table tfoot tr {
                background: #EEEEEE;
                }

                table tbody tr {
                background: #EEEEEE;
                }

                table tbody th {
                background: #CCCCCC;
                white-space: nowrap;
                min-width:7em;
                }

                table tbody td {
                width:70%;
                white-space: nowrap;
                }

                td, th {
                border: 1px solid Ivory;
                }

            </style>
            <!-- 1 -->
            <style>
                .english {
                display: none;
                }
            </style>
            <!-- 2 -->
            <style>
                .french {
                display: none;
                }
            </style>
            <!-- 3 -->
            <style>
                .dutch {
                display: none;
                }
            </style>
            <!-- 4 -->
            <style>
                .german {
                display: none;
                }
            </style>
            <!-- 5 -->
            <style>
                u.englishSwitch {
                color:#AAAAAA;
                cursor:pointer;
                }

                u.frenchSwitch {
                color:#719684;
                cursor:pointer;
                }

                u.dutchSwitch {
                color:#719684;
                cursor:pointer;
                }

                u.germanSwitch {
                color:#719684;
                cursor:pointer;
                }
            </style>
            <!-- 6 -->
            <style>
                u.englishSwitch {
                color:#719684;
                cursor:pointer;
                }

                u.frenchSwitch {
                color:#AAAAAA;
                cursor:pointer;
                }

                u.dutchSwitch {
                color:#719684;
                cursor:pointer;
                }

                u.germanSwitch {
                color:#719684;
                cursor:pointer;
                }
            </style>
            <!-- 7 -->
            <style>
                u.englishSwitch {
                color: #719684;
                cursor:pointer;
                }

                u.frenchSwitch {
                color: #719684;
                cursor:pointer;
                }

                u.dutchSwitch {
                color: #AAAAAA;
                cursor:pointer;
                }

                u.germanSwitch {
                color:#719684;
                cursor:pointer;
                }
            </style>
            <!-- 8 -->
            <style>
                u.englishSwitch {
                color: #719684;
                cursor:pointer;
                }

                u.frenchSwitch {
                color: #719684;
                cursor:pointer;
                }

                u.dutchSwitch {
                color: #719684;
                cursor:pointer;
                }

                u.germanSwitch {
                color:#AAAAAA;
                cursor:pointer;
                }
            </style>
            <!-- 9 -->
            <style>
                .warningmessage {
                display: none;
                }

                table tbody.warning tr {
                background: #AAAAAA;
                }

                table tbody.warning th {
                background: #AAAAAA;
                }
            </style>
            <!-- 10 -->
            <style>
                .warningscheckbox {
                display: none;
                }
            </style>

            <script type="text/javascript">

                var translator=new Array;

                function addTranslation(className, english, french, dutch, german)
                {
                translator.push(new Translated(className, english, french, dutch, german));
                }

                function Translated(className, english, french, dutch, german) {
                this.className=className;
                this.english=english;
                this.french=french;
                this.dutch=dutch;
                this.german=german;
                }

                function open_win ()
                {
                var url = 'file:///<xsl:value-of select="$directory"/>temp.xml';
                window.open(url,'mywindow','width=1000,height=800,resizable=yes,scrollbars=yes');
                }

                function switchLanguage(language)
                {
                var translated;
                var i = 0;
                while(translated=translator[i++])
                {
                var translatedElements = document.getElementsByClassName(translated.className);
                var element;
                var j = 0;
                while(element=translatedElements[j++]) {
                if (language == 'english')
                {
                element.innerHTML = translated.english;
                }
                else if (language == 'french')
                {
                element.innerHTML = translated.french;
                }
                else if (language == 'dutch')
                {
                element.innerHTML = translated.dutch;
                }
                else if (language == 'german')
                {
                element.innerHTML = translated.german;
                }
                else
                {
                element.innerHTML = translated.english;
                }
                }
                }

                //Old way to translate page. Inconvenience: even if a text is not showed, you get it by a copy/paste. So
                //you had all translations by copy/paste...
                // we can keep it for non business items, even if it's not necessary.
                if (language == 'english')
                {
                document.styleSheets[1].disabled = true;
                document.styleSheets[2].disabled = false;
                document.styleSheets[3].disabled = false;
                document.styleSheets[4].disabled = false;

                document.styleSheets[5].disabled = false;
                document.styleSheets[6].disabled = true;
                document.styleSheets[7].disabled = true;
                document.styleSheets[8].disabled = true;
                }
                else if (language == 'french')
                {
                document.styleSheets[1].disabled = false;
                document.styleSheets[2].disabled = true;
                document.styleSheets[3].disabled = false;
                document.styleSheets[4].disabled = false;

                document.styleSheets[5].disabled = true;
                document.styleSheets[6].disabled = false;
                document.styleSheets[7].disabled = true;
                document.styleSheets[8].disabled = true;
                }
                else if (language == 'dutch')
                {
                document.styleSheets[1].disabled = false;
                document.styleSheets[2].disabled = false;
                document.styleSheets[3].disabled = true;
                document.styleSheets[4].disabled = false;

                document.styleSheets[5].disabled = true;
                document.styleSheets[6].disabled = true;
                document.styleSheets[7].disabled = false;
                document.styleSheets[8].disabled = true;
                }
                else if (language == 'german')
                {
                document.styleSheets[1].disabled = false;
                document.styleSheets[2].disabled = false;
                document.styleSheets[3].disabled = false;
                document.styleSheets[4].disabled = true;

                document.styleSheets[5].disabled = true;
                document.styleSheets[6].disabled = true;
                document.styleSheets[7].disabled = true;
                document.styleSheets[8].disabled = false;
                }
                expandView('long');
                }

                //...because unfortunately, getElementsByClassName doesn't work with IE, so we re-write it
                document.getElementsByClassName = function(cl) {
                var retnode = [];
                var myclass = new RegExp('\\b'+cl+'\\b');
                var elem = this.getElementsByTagName('*');
                for (var i = 0; i &lt; elem.length; i++)
                {
                var classes = elem[i].className;
                if (myclass.test(classes)) retnode.push(elem[i]);
                }
                return retnode;
                };

                function showWarningsCheckbox()
                {
                document.styleSheets[10].disabled = true;
                }

                function switchWarnings(boxName)
                {
                /*if (document.styleSheets[9].disabled == false){
                document.styleSheets[9].disabled = true
                } else {
                document.styleSheets[9].disabled = false
                }*/

                if(boxName.checked == true) {
                document.styleSheets[9].disabled = true
                }
                else {
                document.styleSheets[9].disabled = false
                }

                }

                function toggleRow(part) {

                var rowTags=document.getElementsByTagName('tbody');
                var row;
                var i = 0;

                while(row=rowTags[i++]) {

                if (row.parentNode.id == part ) {

                if ( row.id != 'short'){

                if (row.style.display == '') {
                row.style.display = 'none';
                changeCross(part, 'close')
                } else {
                row.style.display = '';
                changeCross(part, 'open')
                }
                }

                }
                }
                }


                function changeCross(subject, state) {

                if(state=='close') {
                document.getElementById(subject + "Cross").innerHTML =" [+] ";
                } else if(state=='open') {
                document.getElementById(subject + "Cross").innerHTML =" [-] ";
                }
                }

                //Bad to use "id" for "short", ou "part", because they are not unique. Could be put in "class".
                //We can now use "getElementsByClassName".


                function expandView(size)
                {
                var rowTags=document.getElementsByTagName('tbody');
                var row;
                var i = 1;

                if (size == 'short') {
                while(row=rowTags[i++]) {
                if ( row.id != 'short'){
                row.style.display = 'none';
                }

                changeCross(row.parentNode.id,"close");

                }
                } else {
                while(row=rowTags[i++]) {
                row.style.display = '';

                changeCross(row.parentNode.id,"open");
                }
                }
                }


                window.onload=function(){switchLanguage('english')};
            </script>
            <body>
                <xsl:for-each select="document($translationdictionarypath)//*/translation">
                    <SCRIPT language="Javascript">addTranslation("<xsl:value-of select="@class"/>", "<xsl:value-of
                            select="@en"/>", "<xsl:value-of select="@fr"/>", "<xsl:value-of select="@nl"/>",
                        "<xsl:value-of select="@de"/>")
                    </SCRIPT>
                </xsl:for-each>
                <button class="view english" onclick="expandView('long')">Expanded View</button>
                <button class="view french" onclick="expandView('long')">Vue étendue</button>
                <button class="view dutch" onclick="expandView('long')" style="width: 12em;">Uitgebr.weergave
                </button>
                <button class="view german" onclick="expandView('long')">Ausged.sicht</button>
                <span style="width:0.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <button class="view english" onclick="expandView('short')">Short View</button>
                <button class="view french" onclick="expandView('short')">Vue réduite</button>
                <button class="view dutch" onclick="expandView('short')">Korte weergave</button>
                <button class="view german" onclick="expandView('short')">Kurze sicht</button>
                <span style="width:1.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <u class="englishSwitch" onclick="switchLanguage('english')">
                    <span class="LangEnglish"/>
                </u>
                <span style="width:0.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <u class="dutchSwitch" onclick="switchLanguage('dutch')">
                    <span class="LangDutch"/>
                </u>
                <span style="width:0.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <u class="frenchSwitch" onclick="switchLanguage('french')">
                    <span class="LangFrench"/>
                </u>
                <span style="width:0.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <u class="germanSwitch" onclick="switchLanguage('german')">
                    <span class="LangGerman"/>
                </u>
                <span style="width:1.5em;">
                    <xsl:text>   </xsl:text>
                </span>
                <span class="warningscheckbox">
                    <span class="LangShowWarnings"/>
                    <input class="warningscheckbox" type="checkbox" onclick="switchWarnings(this)" id="warningsCheckBox"
                           value="false" name="testbox"/>
                </span>
                <xsl:if test="not(document($translationdictionarypath))">
                    <h2 style="color:#FF2020">
                        <span class="english">XML translation dictionary file not found. (</span>
                        <span class="french">Le fichier XML servant de dictionnaire pour la traduction n'a pas pu être
                            retrouvé. (
                        </span>
                        <span class="dutch">XML translation dictionary file not found. (</span>
                        <span class="german">XML translation dictionary file not found. (</span>
                        Path: <xsl:value-of select="$translationdictionarypath"/>, Directory: <xsl:value-of select="$annexdirectory"/>
                        <span class="english">) Vizualisation is not complete.</span>
                        <span class="french">) La visualisation est incomplète.</span>
                        <span class="dutch">) Vizualisation is not complete.</span>
                        <span class="german">) Vizualisation is not complete.</span>
                    </h2>
                </xsl:if>
                <xsl:apply-templates select="//kmehr:kmehrmessage"/>
                <!--
				<xsl:choose>
					<xsl:when test="document($xmlreportpath)">
						<xsl:apply-templates select="//kmehr:kmehrmessage"/>	
					</xsl:when>
					<xsl:otherwise>
						<h2 style="color:#FF2020">XML validation report not found. (<xsl:value-of select="$xmlreportpath"/>)</h2>
						<h2 style="color:#FF2020">Visualization is stopped.</h2>
					</xsl:otherwise>
				</xsl:choose> 
				-->
                <SCRIPT language="Javascript">switchLanguage('<xsl:value-of select="$defaultlanguage"/>')
                </SCRIPT>
            </body>
        </html>
    </xsl:template>

    <!-- KMEHRMESSAGE processing -->
    <xsl:template match="kmehr:kmehrmessage">
        <xsl:apply-templates select="kmehr:header"/>
        <xsl:apply-templates select="kmehr:folder"/>
    </xsl:template>

    <!-- Kmehr HEADER processing -->
    <xsl:template match="kmehr:header">
        <div id="sumehr">
            <b>
                <span class="LangSumehrCreationDate"/>
                <xsl:text> : </xsl:text>
            </b>
            <xsl:value-of select="kmehr:date"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="kmehr:time"/>
            <br/>
        </div>
    </xsl:template>

    <!-- Kmehr FOLDER processing -->
    <!-- FOLDER AND AUTHOR -->
    <xsl:template match="kmehr:folder">
        <!-- PATIENT -->
        <div class="separator">
            <h4 class="clickable" onclick="toggleRow('patient')">
                <small id="patientCross">[+]</small>
                <span class="LangSeparatorPatient"/>
            </h4>
        </div>
        <table id="patient">
            <xsl:apply-templates select="kmehr:patient"/>
        </table>

        <xsl:apply-templates select="kmehr:transaction"/>
    </xsl:template>

    <!-- CLINICAL SUMMARY PROCESSING -->
    <xsl:template match="kmehr:transaction[kmehr:cd[@S='CD-TRANSACTION' and .='clinicalsummary']]">
        <h3>Clinical Summary (<xsl:value-of select="kmehr:author/kmehr:hcparty/kmehr:firstname"/><xsl:text> </xsl:text>
            <xsl:value-of select="kmehr:author/kmehr:hcparty/kmehr:familyname"/>,
            <xsl:value-of select="kmehr:date"/><xsl:text> </xsl:text> <xsl:value-of select="kmehr:time"/>)
        </h3>
        <div class="separator">
            <h4 onclick="toggleRow('author')" class="clickable">
                <small id="authorCross">[+]</small>
                <span class="LangSeparatorAuthor"/>
            </h4>
        </div>
        <table id="author">
            <xsl:apply-templates select="kmehr:author/kmehr:hcparty"/>
        </table>
        <xsl:for-each select="kmehr:transaction[kmehr:cd[@S='CD-TRANSACTION' and .='clinicalsummary']]//kmehr:item">
            <xsl:sort select="kmehr:cd[@S='CD-ITEM']"/>
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='allergy'] or 
									kmehr:item/kmehr:cd[@S='CD-ITEM' and .='adr'] or 
									kmehr:item/kmehr:cd[@S='CD-ITEM' and .='socialrisk'] or 
									kmehr:item/kmehr:cd[@S='CD-ITEM' and .='familyrisk'] or 
									kmehr:item/kmehr:cd[@S='CD-ITEM' and .='professionalrisk'] or 
									kmehr:item/kmehr:cd[@S='CD-ITEM' and .='risk']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('risks')">
                        <small id="risksCross">[+]</small>
                        <span class="LangSeparatorRisks"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="risksCross"/>
                        <span class="LangSeparatorRisks"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='allergy']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorAllergies"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='allergy']"/>
                </table>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='adr']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorAdverseDrugReactions"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='adr']"/>
                </table>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='socialrisk']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorSocialRisks"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd='socialrisk']"/>
                </table>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='familyrisk']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorFamilyRisk"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd='familyrisk']"/>
                </table>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='professionalrisk']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorProfessionalRisks"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd='professionalrisk']"/>
                </table>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:item/kmehr:cd[@S='CD-ITEM' and .='risk']">
                <b class="subpart clickable" onclick="toggleRow('risks')">
                    <span class="LangSeparatorOtherRisks"/>
                    <xsl:text> :</xsl:text>
                </b>
                <table class="subpart" id="risks">
                    <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='risk']"/>
                </table>
            </xsl:when>
        </xsl:choose>

        <xsl:choose>
            <xsl:when
                    test="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='active']]">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('currentproblems')">
                        <small id="currentproblemsCross">[+]</small>
                        <span class="LangSeparatorCurrentProblems"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="currentproblemsCross"/>
                        <span class="LangSeparatorCurrentProblems"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="currentproblems">
            <xsl:apply-templates
                    select="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and not(kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active' or kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='inactive')]"/>
            <xsl:apply-templates
                    select="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active']"/>
        </table>
        <xsl:choose>
            <xsl:when
                    test="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='inactive']]">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('relevantpassivecareelements')">
                        <small id="relevantpassivecareelementsCross">[+]</small>
                        <span class="LangSeparatorRelevantPassiveCareElement"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="relevantpassivecareelementsCross"/>
                        <span class="LangSeparatorRelevantPassiveCareElement"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="relevantpassivecareelements">
            <xsl:apply-templates
                    select="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and not(kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active' or kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='inactive')]"/>
            <xsl:apply-templates
                    select="kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='inactive']]"/>
        </table>
        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='medication']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('medication')">
                        <small id="medicationCross">[+]</small>
                        <span class="LangSeparatorActiveMedication"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="medicationCross"/>
                        <span class="LangSeparatorActiveMedication"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="medication">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='medication']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='vaccine']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('vaccine')">
                        <small id="vaccineCross">[+]</small>
                        <span class="LangSeparatorVaccines"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="vaccineCross"/>
                        <span class="LangSeparatorVaccines"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="vaccine">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='vaccine']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='contactperson']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('contactperson')">
                        <small id="contactpersonCross">[+]</small>
                        <span class="LangSeparatorContactPersons"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="contactpersonCross"/>
                        <span class="LangSeparatorContactPersons"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="contactperson">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='contactperson']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='patientwill']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('patientwill')">
                        <small id="patientwillCross">[+]</small>
                        <span class="LangSeparatorPatientWill"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="patientwillCross"/>
                        <span class="LangSeparatorPatientWill"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="patientwill">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='patientwill']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='insurancystatus']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('insurancystatus')">
                        <small id="insurancystatusCross">[+]</small>
                        <span class="LangSeparatorInsurancyStatus"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="insurancystatusCross"/>
                        <span class="LangSeparatorInsurancyStatus"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="insurancystatus">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='insurancystatus']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='gmdmanager']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('gmdmanager')">
                        <small id="gmdmanagerCross">[+]</small>
                        <span class="LangSeparatorGmdManager"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="gmdmanagerCross"/>
                        <span class="LangSeparatorGmdManager"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="gmdmanager">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='gmdmanager']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='careplansubscription']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('careplansubscription')">
                        <small id="careplansubscriptionCross">[+]</small>
                        <span class="LangSeparatorCareplanSubscription"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="careplansubscriptionCross"/>
                        <span class="LangSeparatorCareplanSubscription"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="careplansubscription">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='careplansubscription']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[kmehr:cd[@S='CD-ITEM']='contacthcparty']">
                <div class="separator">
                    <h4 class="clickable" onclick="toggleRow('contacthcparty')">
                        <small id="contacthcpartyCross">[+]</small>
                        <span class="LangSeparatorHealthcareProfessionalContacts"/>
                    </h4>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div class="separator">
                    <h4>
                        <small id="contacthcpartyCross"/>
                        <span class="LangSeparatorHealthcareProfessionalContacts"/>
                    </h4>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table id="contacthcparty">
            <xsl:apply-templates select="kmehr:item[kmehr:cd[@S='CD-ITEM']='contacthcparty']"/>
        </table>

        <xsl:choose>
            <xsl:when test="kmehr:item[not(kmehr:cd='contactperson'  
				or kmehr:cd='patientwill' 		
				or kmehr:cd='insurancystatus' 			
				or kmehr:cd='gmdmanager' 
				or kmehr:cd='hcparty'
				or kmehr:cd='risk'
				or kmehr:cd='contacthcparty' 
				or kmehr:cd='socialrisk' 
				or kmehr:cd='healthcareelement' 
				or kmehr:cd='allergy'
				or kmehr:cd='medication'
				or kmehr:cd='vaccine' 
				or kmehr:cd='familyrisk' 
				or kmehr:cd='careplansubscription' 
				or kmehr:cd='insurancystatus' 
				or kmehr:cd='professionalrisk' 
				or kmehr:cd='adr')]">

                <xsl:for-each select="kmehr:item[not(kmehr:cd='contactperson'  
				or kmehr:cd='patientwill' 		
				or kmehr:cd='insurancystatus' 			
				or kmehr:cd='gmdmanager' 
				or kmehr:cd='hcparty'
				or kmehr:cd='risk'
				or kmehr:cd='contacthcparty' 
				or kmehr:cd='socialrisk' 
				or kmehr:cd='healthcareelement' 
				or kmehr:cd='allergy'
				or kmehr:cd='medication'
				or kmehr:cd='vaccine' 
				or kmehr:cd='familyrisk' 
				or kmehr:cd='careplansubscription' 
				or kmehr:cd='insurancystatus' 
				or kmehr:cd='professionalrisk' 
				or kmehr:cd='adr')]">


                    <div class="separator">

                        <h4 class="clickable"
                            onclick="toggleRow('{./kmehr:cd[@S='CD-ITEM']}' + '{./kmehr:id[@S='ID-KMEHR']}' )">
                            <small id="{./kmehr:cd[@S='CD-ITEM']}{./kmehr:id[@S='ID-KMEHR']}Cross">[+]</small>
                            <span>
                                <xsl:value-of select="./kmehr:cd[@S='CD-ITEM']"/>
                            </span>
                        </h4>
                    </div>

                    <table id="{./kmehr:cd[@S='CD-ITEM']}{./kmehr:id[@S='ID-KMEHR']}">
                        <tbody style="display:none">

                            <xsl:for-each select="node()[name()]">
                                <xsl:choose>
                                    <xsl:when test="local-name()='id'">
                                        <tr>
                                            <th>
                                                <xsl:value-of select="local-name()"/> (<xsl:value-of select="@S"/>)
                                            </th>
                                            <td>
                                                <xsl:value-of select="."/>
                                            </td>
                                        </tr>
                                    </xsl:when>

                                    <xsl:when test="local-name()='cd'">

                                    </xsl:when>

                                    <xsl:when test="local-name()='content'">
                                        <xsl:for-each select="node()[name()]">
                                            <xsl:choose>
                                                <xsl:when test="local-name()='cd'">
                                                    <tr>
                                                        <th>
                                                            <xsl:value-of select="local-name()"/> (<xsl:value-of
                                                                select="@S"/>)
                                                        </th>
                                                        <td>
                                                            <xsl:value-of select="."/>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:when test="local-name()='text'">
                                                    <tr>
                                                        <th>
                                                            <xsl:value-of select="local-name()"/>
                                                        </th>
                                                        <td>
                                                            <xsl:value-of select="."/>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:when test="local-name()='date'">
                                                    <tr>
                                                        <th>
                                                            <xsl:value-of select="local-name()"/>
                                                        </th>
                                                        <td>
                                                            <xsl:value-of select="."/>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:when test="local-name()='time'">
                                                    <tr>
                                                        <th>
                                                            <xsl:value-of select="local-name()"/>
                                                        </th>
                                                        <td>
                                                            <xsl:value-of select="."/>
                                                        </td>
                                                    </tr>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <th colspan="2">
                                                        <xsl:value-of select="local-name()"/>
                                                    </th>
                                                    <xsl:for-each select="node()[name()]">
                                                        <xsl:choose>
                                                            <xsl:when test="local-name()='id'">
                                                                <tr>
                                                                    <th>
                                                                        <xsl:value-of select="local-name()"/>
                                                                        (<xsl:value-of select="@S"/>)
                                                                    </th>
                                                                    <td>
                                                                        <xsl:value-of select="."/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <tr>
                                                                    <th>
                                                                        <xsl:value-of select="local-name()"/>
                                                                    </th>
                                                                    <td>
                                                                        <xsl:value-of select="."/>
                                                                    </td>
                                                                </tr>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:for-each>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:for-each>
                                    </xsl:when>

                                    <xsl:when test="local-name()='lnk'">
                                        <tr>
                                            <th>
                                                <xsl:value-of select="local-name()"/>
                                            </th>
                                            <td>
                                                <xsl:if test="@TYPE">
                                                    <b class="LangLnk-Type"/>
                                                    <xsl:value-of select="@TYPE"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                                <xsl:if test="@MEDIATYPE">
                                                    <b class="LangLnk-MediaType"/>
                                                    <xsl:value-of select="@MEDIATYPE"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                                <xsl:if test="@URL">
                                                    <b class="LangLnk-Url"/>
                                                    <xsl:value-of select="@URL"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                                <xsl:if test="@SIZE">
                                                    <b class="LangLnk-Size"/>
                                                    <xsl:value-of select="@SIZE"/>
                                                    <xsl:text> </xsl:text>
                                                </xsl:if>
                                            </td>
                                        </tr>
                                    </xsl:when>

                                    <xsl:when
                                            test="not(local-name()='content' or local-name()='cd' or local-name()='id')">
                                        <tr>
                                            <th>
                                                <xsl:value-of select="local-name()"/>
                                            </th>
                                            <td>
                                                <xsl:value-of select="."/>
                                            </td>
                                        </tr>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:for-each>
                        </tbody>
                        <xsl:apply-templates select="."/>
                        <xsl:apply-templates select="kmehr:content"/>
                        <xsl:apply-templates select="kmehr:content/*[not(local-name()='cd')]"/>
                        <xsl:for-each select="kmehr:cd[@S='CD-ITEM']">
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                        <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                    </table>

                </xsl:for-each>
            </xsl:when>
        </xsl:choose>


    </xsl:template>
    <!-- END Clinical Summary Processing -->

    <!-- SUMEHR PROCESSING -->
    <xsl:template match="kmehr:transaction[kmehr:cd[@S='CD-TRANSACTION' and .='sumehr']]">
        <xsl:for-each select="kmehr:item">
            <xsl:sort select="kmehr:cd[@S='CD-ITEM']"/>
        </xsl:for-each>
        <xsl:choose>
            <xsl:when test="//kmehr:item/kmehr:cd[@S='CD-ITEM' and .='allergy'] or
									//kmehr:item/kmehr:cd[@S='CD-ITEM' and .='adr'] or
									//kmehr:item/kmehr:cd[@S='CD-ITEM' and .='socialrisk'] or
									//kmehr:item/kmehr:cd[@S='CD-ITEM' and .='risk']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('risks')">
                            <small id="risksCross">[+]</small>
                            Risks
                        </h4>
                    </span>
                </div>
                <span style="color:#9B1C27; cursor:pointer; margin-left:0.3em">
                    <b onclick="toggleRow('risks')">Allergies</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='allergy']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; cursor:pointer; margin-left:0.3em">
                    <b onclick="toggleRow('risks')">Adverse drug reactions</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='adr']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; cursor:pointer; margin-left:0.3em">
                    <b align="left" onclick="toggleRow('risks')">Social risks</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd='socialrisk']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; cursor:pointer; margin-left:0.3em">
                    <b onclick="toggleRow('risks')">Other risks</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='risk']" mode="sumehr"/>
                    </tbody>
                </table>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="risksCross"/>
                            Risks
                        </h4>
                    </span>
                </div>
                <span style="color:#9B1C27; margin-left:0.3em">
                    <b>Allergies</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='allergy']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; margin-left:0.3em">
                    <b>Adverse drug reactions</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='adr']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; margin-left:0.3em">
                    <b>Social risks</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd='socialrisk']" mode="sumehr"/>
                    </tbody>
                </table>
                <span style="color:#9B1C27; margin-left:0.3em">
                    <b>Other risks</b>
                </span>
                <table style="margin-bottom:3pt">
                    <tbody id="risks">
                        <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='risk']" mode="sumehr"/>
                    </tbody>
                </table>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when
                    test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='active']]">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('currentproblems')">
                            <small id="currentproblemsCross">[+]</small>
                            Current Problems
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="currentproblemsCross"/>
                            Current Problems
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="currentproblems">
                <xsl:apply-templates
                        select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active']"
                        mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when
                    test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='inactive']]">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('relevantpassivecareelements')">
                            <small id="relevantpassivecareelementsCross">[+]</small>
                            Relevant passive care elements
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="relevantpassivecareelementsCross"/>
                            Relevant passive care elements
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="relevantpassivecareelements">
                <xsl:apply-templates
                        select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='healthcareelement' and kmehr:lifecycle[kmehr:cd[@S='CD-LIFECYCLE']='inactive']]"
                        mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='medication']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('medication')">
                            <small id="medicationCross">[+]</small>
                            Active medication
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="medicationCross"/>
                            Active medication
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="medication">
                <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='medication']" mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='vaccine']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('vaccine')">
                            <small id="vaccineCross">[+]</small>
                            Administered vaccines
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="vaccineCross"/>
                            Administered vaccines
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="vaccine">
                <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='vaccine']" mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='contactperson']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('contactperson')">
                            <small id="contactpersonCross">[+]</small>
                            Contact Persons
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="contactpersonCross"/>
                            Contact Persons
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="contactperson">
                <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='contactperson']" mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='gmdmanager']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('gmdmanager')">
                            <small id="gmdmanagerCross">[+]</small>
                            GMD Manager
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="gmdmanagerCross"/>
                            GMD Manager
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="gmdmanager">
                <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='gmdmanager']" mode="sumehr"/>
            </tbody>
        </table>
        <xsl:choose>
            <xsl:when test="//kmehr:item[kmehr:cd[@S='CD-ITEM']='contacthcparty']">
                <div style="background:#D9E0C9; cursor:pointer">
                    <span style="color:#9B1C27">
                        <h4 onclick="toggleRow('contacthcparty')">
                            <small id="contacthcpartyCross">[+]</small>
                            Healthcare professional contact
                        </h4>
                    </span>
                </div>
            </xsl:when>
            <xsl:otherwise>
                <div style="background:#D9E0C9">
                    <span style="color:#9B1C27">
                        <h4>
                            <small id="contacthcpartyCross"/>
                            Healthcare professional contact
                        </h4>
                    </span>
                </div>
            </xsl:otherwise>
        </xsl:choose>
        <table>
            <tbody id="contacthcparty">
                <xsl:apply-templates select="//kmehr:item[kmehr:cd[@S='CD-ITEM']='contacthcparty']" mode="sumehr"/>
            </tbody>
        </table>
        <div style="background:#D9E0C9; cursor:pointer">
            <span style="color:#9B1C27">
                <h4>Sumehr end</h4>
            </span>
        </div>
        <table>
            <tbody>
                <xsl:apply-templates select="//kmehr:item[not(kmehr:cd='contactperson'
				or kmehr:cd='gmdmanager'
				or kmehr:cd='hcparty'
				or kmehr:cd='risk'
				or kmehr:cd='contacthcparty'
				or kmehr:cd='socialrisk'
				or kmehr:cd='healthcareelement'
				or kmehr:cd='allergy'
				or kmehr:cd='medication'
				or kmehr:cd='vaccine'
				or kmehr:cd='adr')]" mode="sumehr"/>
            </tbody>
        </table>


    </xsl:template>

    <xsl:template match="kmehr:item" mode="sumehr">
        <xsl:choose>
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='contactperson'">
                <xsl:apply-templates select="./kmehr:content/kmehr:person"/>
            </xsl:when>
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='gmdmanager'">
                <xsl:apply-templates select="./kmehr:content/kmehr:hcparty"/>
            </xsl:when>
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='contacthcparty'">
                <xsl:apply-templates select="./kmehr:content/kmehr:hcparty"/>
            </xsl:when>

            <!-- RISKS AND HEALTHCARE ELEMENTS PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='risk'
					or kmehr:cd[@S='CD-ITEM']='socialrisk'
					or kmehr:cd[@S='CD-ITEM']='healthcareelement'
					or kmehr:cd[@S='CD-ITEM']='allergy'
					or kmehr:cd[@S='CD-ITEM']='adr'">

                <xsl:for-each select="kmehr:content/kmehr:text">
                    <xsl:if test="position()=1">
                        <tr id="short">
                            <th colspan="3" align="center">
                                <!-- no more used <xsl:text>Label : </xsl:text> -->
                                <xsl:value-of select="."/>
                            </th>
                        </tr>
                    </xsl:if>
                    <xsl:if test="not(position()=1)">
                        <tr id="short">
                            <th colspan="3">
                                <xsl:text> &amp; </xsl:text><xsl:value-of select="."/>
                            </th>
                        </tr>
                    </xsl:if>
                </xsl:for-each>

                <tr style="display:none">
                    <th>IBUI<xsl:text> </xsl:text><xsl:value-of select="kmehr:content/kmehr:cd[@S='CD-CLINICAL']/@SV"/>
                    </th>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='CD-CLINICAL']"/>
                    </td>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='CD-CLINICAL']/@DN"/>
                    </td>
                </tr>
                <tr style="display:none">
                    <th>ICPC<xsl:text> </xsl:text>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICPC']/@SV"/>
                    </th>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICPC']"/>
                    </td>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICPC']/@DN"/>
                    </td>
                </tr>
                <tr style="display:none">
                    <th>ICD<xsl:text> </xsl:text>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICD']/@SV"/>
                    </th>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICD']"/>
                    </td>
                    <td>
                        <xsl:value-of select="kmehr:content/kmehr:cd[@S='ICD']/@DN"/>
                    </td>
                </tr>
                <xsl:if test="kmehr:cd[@S='CD-ITEM']='healthcareelement'">
                    <tr id="short">
                        <th>Period</th>
                        <td colspan="2">
                            <b>start:</b>
                            <xsl:text> </xsl:text><xsl:value-of select="kmehr:beginmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                select="kmehr:beginmoment/kmehr:time"/><xsl:value-of
                                select="kmehr:beginmoment/kmehr:text"/>
                            <xsl:choose>
                                <xsl:when test="kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='inactive'">
                                    <xsl:text>     </xsl:text>
                                    <b>end:</b>
                                    <xsl:text> </xsl:text><xsl:value-of select="kmehr:endmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                        select="kmehr:endmoment/kmehr:time"/><xsl:value-of
                                        select="kmehr:endmoment/kmehr:text"/>
                                </xsl:when>
                                <xsl:when test="kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active'">
                                    <xsl:if test="kmehr:endmoment">
                                        <xsl:text>     </xsl:text>
                                        <b>end:</b>
                                        <xsl:text> </xsl:text><xsl:value-of select="kmehr:endmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                            select="kmehr:endmoment/kmehr:time"/><xsl:value-of
                                            select="kmehr:endmoment/kmehr:text"/>
                                    </xsl:if>
                                </xsl:when>
                            </xsl:choose>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>

            <!-- MEDICATION AND VACCINE -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='medication' or kmehr:cd[@S='CD-ITEM']='vaccine'">
                <tr id="short">
                    <th colspan="3" align="center"> <!-- no more used <xsl:text>Name : </xsl:text> -->
                        <xsl:choose>
                            <xsl:when test="kmehr:content/kmehr:medicinalproduct/kmehr:intendedname">
                                <xsl:value-of select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedname"/>
                            </xsl:when>
                            <xsl:when test="kmehr:content/kmehr:compoundprescription">
                                <xsl:value-of select="kmehr:content/kmehr:compoundprescription"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="kmehr:content/kmehr:substanceproduct/kmehr:intendedname"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </th>
                </tr>

                <xsl:if test="kmehr:cd[@S='CD-ITEM']='vaccine'">
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:cd[@S='CD-VACCINEINDICATION']">
                            <xsl:for-each select="kmehr:content/kmehr:cd[@S='CD-VACCINEINDICATION']">
                                <tr id="short">
                                    <th>Indication
                                        <xsl:value-of select="@SV"/>
                                    </th>
                                    <td colspan="2">
                                        <xsl:choose>
                                            <xsl:when test="@DN">
                                                <xsl:value-of select="."/><xsl:text>   (</xsl:text><xsl:value-of
                                                    select="@DN"/><xsl:text>)</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr id="short">
                                <th>Indication</th>
                                <td colspan="2"></td>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>

                <xsl:choose>
                    <xsl:when test="kmehr:content/kmehr:cd[@S='CD-ATC']">
                        <xsl:for-each select="kmehr:content/kmehr:cd[@S='CD-ATC']">
                            <tr style="display:none">
                                <th>Code ATC
                                    <xsl:value-of select="@SV"/>
                                </th>
                                <td colspan="2">
                                    <xsl:choose>
                                        <xsl:when test="@DN">
                                            <xsl:value-of select="."/><xsl:text>   (</xsl:text><xsl:value-of
                                                select="@DN"/><xsl:text>)</xsl:text>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="."/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <tr style="display:none">
                            <th>Code ATC</th>
                            <td colspan="2"></td>
                        </tr>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']">
                        <tr style="display:none">
                            <th>Code CNK
                                <xsl:value-of
                                        select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']/@SV"/>
                            </th>
                            <td colspan="2">
                                <xsl:value-of
                                        select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']"/>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="kmehr:content/kmehr:substanceproduct/kmehr:intendedcd[@S='CD-INNCLUSTER']">
                        <tr style="display:none">
                            <th>Code INN
                                <xsl:value-of
                                        select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-INNCLUSTER']/@SV"/>
                            </th>
                            <td colspan="2">
                                <xsl:value-of
                                        select="kmehr:content/kmehr:medication/kmehr:intendedcd[@S='CD-INNCLUSTER']"/>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>

                <xsl:choose>
                    <xsl:when test="kmehr:cd[@S='CD-ITEM']='vaccine'">
                        <tr id="short">
                            <th>Administration date</th>
                            <td colspan="2">
                                <xsl:value-of select="kmehr:beginmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                    select="kmehr:beginmoment/kmehr:time"/><xsl:value-of
                                    select="kmehr:beginmoment/kmehr:text"/>
                            </td>
                        </tr>
                    </xsl:when>
                    <xsl:when test="kmehr:cd[@S='CD-ITEM']='medication'">
                        <tr id="short">
                            <th>Period</th>
                            <td colspan="2">
                                <b>start:</b>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                    select="kmehr:beginmoment/kmehr:time"/><xsl:value-of
                                    select="kmehr:beginmoment/kmehr:text"/>
                                <xsl:text>   </xsl:text>
                                <b>end:</b>
                                <xsl:value-of select="kmehr:endmoment/kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                    select="kmehr:endmoment/kmehr:time"/><xsl:value-of
                                    select="kmehr:endmoment/kmehr:text"/>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>

                <xsl:if test="kmehr:content/*/kmehr:deliveredname">
                    <tr style="display:none">
                        <th>Delivered name</th>
                        <td colspan="2">
                            <xsl:value-of select="kmehr:content/*/kmehr:deliveredname"/>
                        </td>
                    </tr>
                </xsl:if>
                <xsl:if test="kmehr:content/*/kmehr:deliveredcd">
                    <tr style="display:none">
                        <th>Delivered code
                            <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd/@S"/>
                            <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd/@SV"/>
                        </th>
                        <td colspan="2">
                            <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd"/>
                        </td>
                    </tr>
                </xsl:if>
            </xsl:when>

            <!-- OTHER ITEMS ? -->
            <xsl:otherwise>
                <h3>Unexpected item element...</h3>
                <xsl:for-each select="node()[name()]">
                    <tr id="short">
                        <th>
                            <xsl:value-of select="name()"/>
                        </th>
                        <td colspan="2">
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>

        <!-- GENERIC ITEM ELEMENTS PROCESS -->
        <xsl:for-each select="node()[name()]">
            <xsl:choose>
                <xsl:when test="name() = 'cd'">
                    <xsl:apply-templates select="."/>
                </xsl:when>
                <xsl:when test="name() = 'id'">
                </xsl:when>
                <xsl:when test="name() = 'content'">
                </xsl:when>
                <xsl:when test="name() = 'beginmoment'">
                    <xsl:if test="not(../kmehr:cd[@S='CD-ITEM']='vaccine' or ../kmehr:cd[@S='CD-ITEM']='medication' or ../kmehr:cd[@S='CD-ITEM']='healthcareelement' )">
                        <tr style="display:none">
                            <th>Start date</th>
                            <td>
                                <xsl:value-of select="kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                    select="kmehr:time"/><xsl:value-of select="kmehr:text"/>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="name() = 'endmoment'">
                    <xsl:if test="not(../kmehr:cd[@S='CD-ITEM']='medication' or ../kmehr:cd[@S='CD-ITEM']='healthcareelement' )">
                        <tr style="display:none">
                            <th>End date</th>
                            <td>
                                <xsl:value-of select="kmehr:date"/><xsl:text> </xsl:text><xsl:value-of
                                    select="kmehr:time"/><xsl:value-of select="kmehr:text"/>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="name() = 'lifecycle'">
                    <xsl:if test="not(../kmehr:cd[@S='CD-ITEM']='medication' or ../kmehr:cd[@S='CD-ITEM']='healthcareelement' )">
                        <tr style="display:none">
                            <th>LifeCycle</th>
                            <td>
                                <xsl:value-of select="kmehr:cd"/>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <tr style="display:none">
                        <th><xsl:value-of select="name()"/></th>
                        <td colspan="2">Unhandled<!--<xsl:value-of select="text()"/>--></td>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- ALL OTHER TRANSACTIONS -->
    <xsl:template
            match="kmehr:transaction[kmehr:cd[@S='CD-TRANSACTION' and (.!='clinicalsummary') and (.!='sumehr')]]">
        <div class="TransactionContent">
            <div class="TransactionContentTitle">
                <h3>
                    <small id="resultCross">[+]</small>
                    &#160;
                    <span>
                        <xsl:attribute name="class"><xsl:value-of select="concat('Lang',kmehr:cd[@S='CD-TRANSACTION'])"/></xsl:attribute>
                    </span>
                    (
                    <xsl:choose>
                        <xsl:when test="kmehr:author/kmehr:hcparty/kmehr:familyname">
                            <xsl:value-of select="kmehr:author/kmehr:hcparty/kmehr:firstname"/><xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:author/kmehr:hcparty/kmehr:familyname"/><xsl:text>, </xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:if test="kmehr:author/kmehr:hcparty/kmehr:name">
                                <xsl:value-of select="kmehr:author/kmehr:hcparty/kmehr:name"/><xsl:text>, </xsl:text>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:value-of select="kmehr:date"/><xsl:text> </xsl:text>
                    <xsl:value-of select="kmehr:time"/> )
                </h3>
            </div>
            <xsl:apply-templates select="kmehr:heading|kmehr:item|kmehr:text|kmehr:text-with-layout|kmehr:lnk"/>
        </div>

        <table></table>
    </xsl:template>

    <!-- CLINICALSUMMARY ITEM PROCESSING -->
    <xsl:template match="kmehr:transaction[kmehr:cd[@S='CD-TRANSACTION' and .='clinicalsummary']]//kmehr:item">
        <xsl:choose>
            <!-- PERSON PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='contactperson'">
                <xsl:apply-templates select="kmehr:content/*[not(local-name()='person')]"/>
                <xsl:apply-templates select="./kmehr:content/kmehr:person"/>
                <xsl:choose>
                    <xsl:when test="kmehr:lnk">
                        <tr>
                            <th class="LangLnk"/>
                            <td>
                                <xsl:apply-templates select="kmehr:lnk"/>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='gmdmanager'">
                <xsl:apply-templates select="kmehr:content/*[not(local-name()='hcparty')]"/>
                <xsl:apply-templates select="./kmehr:content/kmehr:hcparty"/>
                <xsl:choose>
                    <xsl:when test="kmehr:lnk">
                        <tr>
                            <th class="LangLnk"/>
                            <td>
                                <xsl:apply-templates select="kmehr:lnk"/>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:when>
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='contacthcparty'">
                <xsl:apply-templates select="kmehr:content/*[not(local-name()='hcparty')]"/>
                <xsl:apply-templates select="./kmehr:content/kmehr:hcparty"/>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test="kmehr:lnk">
                        <tr>
                            <th class="LangLnk"/>
                            <td>
                                <xsl:apply-templates select="kmehr:lnk"/>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>

            <!-- PATIENT'S WILLS PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='patientwill'">
                <xsl:variable name="body-class">
                    <xsl:apply-templates select="." mode="get-body-class"/>
                </xsl:variable>
                <tbody id="short" class="{$body-class}">
                    <xsl:for-each select="kmehr:content/kmehr:cd">
                        <tr>
                            <th colspan="2" align="center">
                                <xsl:value-of select="."/>
                            </th>
                        </tr>
                    </xsl:for-each>
                </tbody>
                <tbody style="display:none">
                    <!--<xsl:for-each select="kmehr:content/kmehr:text">
					<tr>
						<th class="LangText"/>
						<td><xsl:value-of select="."/></td>
					</tr>	
				</xsl:for-each>-->
                    <xsl:for-each select="kmehr:recorddatetime">
                        <tr>
                            <th class="LangRecorddatetime"/>
                            <td>
                                <xsl:value-of select="."/>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <xsl:choose>
                        <xsl:when test="kmehr:lnk">
                            <tr>
                                <th class="LangLnk"/>
                                <td>
                                    <xsl:apply-templates select="kmehr:lnk"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:boolean">
                            <tr>
                                <th class="LangBoolean"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:boolean"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <xsl:apply-templates select="kmehr:content"/>
                <xsl:apply-templates select="kmehr:content/*[not(local-name()='cd')]"/>
                <xsl:for-each select="kmehr:cd[@S='CD-ITEM']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:when>

            <!-- INSURANCY STATUS PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='insurancystatus'">
                <xsl:variable name="body-class">
                    <xsl:apply-templates select="." mode="get-body-class"/>
                </xsl:variable>
                <tbody id="short" class="{$body-class}">
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:id">
                            <tr>
                                <th class="LangMedicalInsurancyStatus"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:id"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:membership">
                            <tr>
                                <th class="LangMembership"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:membership"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:siscard">
                            <tr>
                                <th class="LangSiscard"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:siscard"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <tbody style="display:none">
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:cg1">
                            <tr>
                                <th>Cg1</th>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:cg1"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:cg2">
                            <tr>
                                <th>Cg2</th>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:cg2"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:begindate">
                            <tr>
                                <th>LangBeginDate</th>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:begindate"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:insurance/kmehr:enddate">
                            <tr>
                                <th>LangEndDate</th>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:insurance/kmehr:enddate"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:lnk">
                            <tr>
                                <th class="LangLnk"/>
                                <td>
                                    <xsl:apply-templates select="kmehr:lnk"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:when>

            <!-- RISKS AND HEALTHCARE ELEMENTS PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='risk'
				or kmehr:cd[@S='CD-ITEM']='socialrisk'
				or kmehr:cd[@S='CD-ITEM']='healthcareelement'
				or kmehr:cd[@S='CD-ITEM']='allergy'
				or kmehr:cd[@S='CD-ITEM']='familyrisk'
				or kmehr:cd[@S='CD-ITEM']='professionalrisk'
				or kmehr:cd[@S='CD-ITEM']='adr'">
                <xsl:variable name="body-class">
                    <xsl:apply-templates select="." mode="get-body-class"/>
                </xsl:variable>
                <tbody id="short" class="{$body-class}">
                    <xsl:for-each select="kmehr:content/kmehr:text">
                        <xsl:if test="position()=1">
                            <tr>
                                <th colspan="2" align="center">
                                    <!-- no more used <xsl:text>Label : </xsl:text> -->
                                    <xsl:value-of select="."/>
                                </th>
                            </tr>
                        </xsl:if>
                        <xsl:if test="not(position()=1)">
                            <tr>
                                <th colspan="2">
                                    <xsl:text> &amp; </xsl:text>
                                    <xsl:value-of select="."/>
                                </th>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </tbody>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="not(kmehr:content/kmehr:cd[@S='CD-CLINICAL'])">
                    <tbody style="display:none">
                        <tr>
                            <th>IBUI</th>
                            <td/>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:for-each select="kmehr:content/kmehr:cd[@S='CD-CLINICAL']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="not(kmehr:content/kmehr:cd[@S='ICPC'])">
                    <tbody style="display:none">
                        <tr>
                            <th>ICPC</th>
                            <td/>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:for-each select="kmehr:content/kmehr:cd[@S='ICPC']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="not(kmehr:content/kmehr:cd[@S='ICD'])">
                    <tbody style="display:none">
                        <tr>
                            <th width="10px">ICD</th>
                            <td/>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:for-each select="kmehr:content/kmehr:cd[@S='ICD']">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:for-each select="kmehr:content/kmehr:cd[not(@S='ICD' or @S='ICPC' or @S='CD-CLINICAL')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:if test="kmehr:recorddatetime">
                    <tbody style="display:none">
                        <tr>
                            <th class="LangRecorddatetime"/>
                            <td>
                                <xsl:value-of select="kmehr:recorddatetime"/>
                            </td>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:if test="kmehr:lnk">
                    <tbody style="display:none">
                        <tr>
                            <th class="LangLnk"/>
                            <td>
                                <xsl:apply-templates select="kmehr:lnk"/>
                            </td>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:if test="kmehr:cd[@S='CD-ITEM']='healthcareelement'">
                    <tbody style="display:none">
                        <tr>
                            <th class="LangHealthcareElementPeriod"/>
                            <td colspan="1">
                                <b class="LangHealthcareElementBeginMoment"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:date"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:time"/>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:year"/>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:yearmonth"/>
                                <xsl:value-of select="kmehr:beginmoment/kmehr:text"/>
                                <xsl:choose>
                                    <xsl:when test="kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='inactive'">
                                        <xsl:text>     </xsl:text>
                                        <b class="LangHealthcareElementEndMoment"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:date"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:time"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:year"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:yearmonth"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:text"/>
                                    </xsl:when>
                                    <xsl:when test="kmehr:lifecycle/kmehr:cd[@S='CD-LIFECYCLE']='active'">
                                        <xsl:if test="kmehr:endmoment">
                                            <xsl:text>     </xsl:text>
                                            <b class="LangHealthcareElementEndMoment"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="kmehr:endmoment/kmehr:date"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="kmehr:endmoment/kmehr:time"/>
                                            <xsl:value-of select="kmehr:endmoment/kmehr:text"/>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>
                            </td>
                        </tr>
                        <tr>
                            <th class="LangHealthcareLifeCycle"/>
                            <td>
                                <xsl:value-of select="kmehr:lifecycle/kmehr:cd"/>
                            </td>
                        </tr>
                    </tbody>
                </xsl:if>
                <!--<xsl:if test="kmehr:cd[@S='CD-ITEM']='adr' or kmehr:cd[@S='CD-ITEM']='allergy' or kmehr:cd[@S='CD-ITEM']='socialrisk' or kmehr:cd[@S='CD-ITEM']='familyrisk' or kmehr:cd[@S='CD-ITEM']='professionalrisk' or kmehr:cd[@S='CD-ITEM']='risk'">
					<tbody style="display:none">
						<tr>
							<th class="LangHealthcareElementPeriod"/>
							<td colspan="1">
								<b class="LangHealthcareElementBeginMoment"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="kmehr:beginmoment/kmehr:date"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="kmehr:beginmoment/kmehr:time"/>
								<xsl:value-of select="kmehr:beginmoment/kmehr:year"/>
								<xsl:value-of select="kmehr:beginmoment/kmehr:yearmonth"/>
								<xsl:value-of select="kmehr:beginmoment/kmehr:text"/>


							</td>
						</tr>
					</tbody>
				</xsl:if> -->
            </xsl:when>

            <!-- MEDICATION AND VACCINE -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='medication' or kmehr:cd[@S='CD-ITEM']='vaccine'">
                <xsl:if test="kmehr:cd[@S='CD-ITEM']='medication'">
                    <xsl:variable name="body-class">
                        <xsl:apply-templates select="." mode="get-body-class"/>
                    </xsl:variable>
                    <tbody id="short" class="{$body-class}">
                        <tr>
                            <th colspan="2" align="center">
                                <xsl:if test="not(kmehr:content/kmehr:text)">
                                    <span class="LangMedicationUnspecifiedTextualContent"/>
                                </xsl:if>
                                <xsl:for-each select="kmehr:content/kmehr:text">
                                    <xsl:if test="position()=1">
                                        <xsl:value-of select="."/>
                                    </xsl:if>
                                    <xsl:if test="not(position()=1)">
                                        <xsl:text> , </xsl:text>
                                        <xsl:value-of select="."/>
                                    </xsl:if>
                                </xsl:for-each>
                            </th>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:if test="kmehr:cd[@S='CD-ITEM']='vaccine'">
                    <xsl:variable name="body-class">
                        <xsl:apply-templates select="." mode="get-body-class"/>
                    </xsl:variable>
                    <tbody id="short" class="{$body-class}">
                        <xsl:choose>
                            <xsl:when test="kmehr:content/kmehr:cd[@S='CD-VACCINEINDICATION']">
                                <tr>
                                    <th colspan="2" align="center">
                                        <xsl:for-each select="kmehr:content/kmehr:cd[@S='CD-VACCINEINDICATION']">
                                            <xsl:if test="position()=1">
                                                <xsl:choose>
                                                    <xsl:when test="@DN">
                                                        <xsl:value-of select="."/>
                                                        <xsl:text>   (</xsl:text>
                                                        <xsl:value-of select="@DN"/>
                                                        <xsl:text>)</xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="."/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                            <xsl:if test="not(position()=1)">
                                                <xsl:choose>
                                                    <xsl:when test="@DN">
                                                        <xsl:text> , </xsl:text>
                                                        <xsl:value-of select="."/>
                                                        <xsl:text>   (</xsl:text>
                                                        <xsl:value-of select="@DN"/>
                                                        <xsl:text>)</xsl:text>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:text> , </xsl:text>
                                                        <xsl:value-of select="."/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </th>
                                </tr>
                            </xsl:when>
                            <xsl:otherwise>
                                <tr>
                                    <th colspan="2" align="center" class="LangVaccineUnspecifiedIndication"/>
                                </tr>
                            </xsl:otherwise>
                        </xsl:choose>
                    </tbody>
                </xsl:if>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
                <xsl:choose>
                    <xsl:when test="kmehr:content/kmehr:medicinalproduct/kmehr:intendedname">
                        <tbody id="short">
                            <tr>
                                <th class="LangMedicationIntendedName"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedname"/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="kmehr:content/kmehr:compoundprescription">
                        <tbody id="short">
                            <tr>
                                <th class="LangMedicationIntendedName"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:compoundprescription"/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="kmehr:content/kmehr:substanceproduct">
                        <tbody id="short">
                            <tr>
                                <th class="LangMedicationIntendedName"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:substanceproduct/kmehr:intendedname"/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:otherwise>
                        <tbody id="short">
                            <tr>
                                <th class="LangMedicationIntendedName"/>
                                <td/>
                            </tr>
                        </tbody>
                    </xsl:otherwise>
                </xsl:choose>
                <tbody style="display:none">
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:cd[@S='CD-ATC']">
                            <xsl:for-each select="kmehr:content/kmehr:cd[@S='CD-ATC']">
                                <tr>
                                    <th>Code ATC
                                        <xsl:value-of select="@SV"/>
                                    </th>
                                    <td colspan="1">
                                        <xsl:choose>
                                            <xsl:when test="@DN">
                                                <xsl:value-of select="."/>
                                                <xsl:text>   (</xsl:text>
                                                <xsl:value-of select="@DN"/>
                                                <xsl:text>)</xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="."/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr>
                                <th>Code ATC</th>
                                <td colspan="1"/>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:for-each select="kmehr:content/kmehr:cd[not(@S='CD-ATC' or @S='CD-VACCINEINDICATION')]">
                        <xsl:apply-templates select="."/>
                    </xsl:for-each>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']">
                            <tr>
                                <th>Code CNK
                                    <xsl:value-of
                                            select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']/@SV"/>
                                </th>
                                <td colspan="1">
                                    <xsl:value-of
                                            select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-DRUG-CNK']"/>
                                </td>
                            </tr>
                        </xsl:when>
                        <xsl:when test="kmehr:content/kmehr:substanceproduct/kmehr:intendedcd[@S='CD-INNCLUSTER']">
                            <tr>
                                <th>Code INN
                                    <xsl:value-of
                                            select="kmehr:content/kmehr:medicinalproduct/kmehr:intendedcd[@S='CD-INNCLUSTER']/@SV"/>
                                </th>
                                <td colspan="1">
                                    <xsl:value-of
                                            select="kmehr:content/kmehr:medication/kmehr:intendedcd[@S='CD-INNCLUSTER']"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <xsl:choose>
                    <xsl:when test="kmehr:cd[@S='CD-ITEM']='vaccine'">
                        <tbody id="short">
                            <tr>
                                <th class="LangVaccineBeginMoment"/>
                                <td colspan="1">
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:date"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:time"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:year"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:yearmonth"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:text"/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="kmehr:cd[@S='CD-ITEM']='medication'">
                        <tbody id="short">
                            <tr>
                                <th class="LangMedicationPeriod"/>
                                <td colspan="1">
                                    <b class="LangMedicationBeginMoment"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:date"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:time"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:year"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:yearmonth"/>
                                    <xsl:value-of select="kmehr:beginmoment/kmehr:text"/>
                                    <xsl:if test="kmehr:endmoment">
                                        <xsl:text>   </xsl:text>
                                        <b class="LangMedicationEndMoment"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:date"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:time"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:year"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:yearmonth"/>
                                        <xsl:value-of select="kmehr:endmoment/kmehr:text"/>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                </xsl:choose>
                <tbody>
                    <xsl:choose>
                        <xsl:when test="kmehr:lifecycle">
                            <tr>
                                <th class="LangMedicationLifeCycle"/>
                                <td>
                                    <xsl:value-of select="kmehr:lifecycle/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:quantity">
                            <tr>
                                <th class="LangMedicationQuantity"/>
                                <td>
                                    <xsl:value-of select="kmehr:quantity/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:frequency">
                            <tr>
                                <th class="LangMedicationFrequency"/>
                                <td>
                                    <xsl:value-of select="kmehr:frequency/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:posology">
                            <tr>
                                <th class="LangMedicationPosology"/>
                                <td>
                                    <xsl:value-of select="kmehr:posology/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:duration">
                            <tr>
                                <th class="LangMedicationDuration"/>
                                <td>
                                    <xsl:value-of select="kmehr:duration/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:temporality">
                            <tr>
                                <th class="LangMedicationTemporality"/>
                                <td>
                                    <xsl:value-of select="kmehr:temporality/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:dayperiod">
                            <tr>
                                <th class="LangMedicationDayperiod"/>
                                <td>
                                    <xsl:value-of select="kmehr:dayperiod/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:regimen">
                            <tr>
                                <th class="LangMedicationRegimen"/>
                                <td>
                                    <xsl:value-of select="kmehr:regimen/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:deliverydate">
                            <tr>
                                <th class="LangMedicationDeliverydate"/>
                                <td>
                                    <xsl:value-of select="kmehr:deliverydate/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:renewal">
                            <tr>
                                <th class="LangMedicationRenewal"/>
                                <td>
                                    <xsl:value-of select="kmehr:renewal/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:route">
                            <tr>
                                <th class="LangMedicationRoute"/>
                                <td>
                                    <xsl:value-of select="kmehr:route/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:instructionforoverdosing">
                            <tr>
                                <th class="LangMedicationInstructionforoverdosing"/>
                                <td>
                                    <xsl:value-of select="kmehr:instructionforoverdosing/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:instructionforpatient">
                            <tr>
                                <th class="LangMedicationInstruction"/>
                                <td>
                                    <xsl:value-of select="kmehr:instructionforpatient/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:instructionforreimbursement">
                            <tr>
                                <th class="LangMedicationInstructionforreimbursement"/>
                                <td>
                                    <xsl:value-of select="kmehr:instructionforreimbursement/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:issubstitutionallowed">
                            <tr>
                                <th class="LangMedicationIssubstitutionallowed"/>
                                <td>
                                    <xsl:value-of select="kmehr:issubstitutionallowed/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:batch">
                            <tr>
                                <th class="LangBatch"/>
                                <td>
                                    <xsl:value-of select="kmehr:batch"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:recorddatetime">
                            <tr>
                                <th class="LangRecorddatetime"/>
                                <td>
                                    <xsl:value-of select="kmehr:recorddatetime"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:lnk">
                            <tr>
                                <th class="LangLnk"/>
                                <td>
                                    <xsl:apply-templates select="kmehr:lnk"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <xsl:if test="kmehr:content/*/kmehr:deliveredname">
                    <tbody style="display:none">
                        <tr>
                            <th class="LangMedicationDeliveredName"/>
                            <td colspan="1">
                                <xsl:value-of select="kmehr:content/*/kmehr:deliveredname"/>
                            </td>
                        </tr>
                    </tbody>
                </xsl:if>
                <xsl:if test="kmehr:content/*/kmehr:deliveredcd">
                    <tbody style="display:none">
                        <tr>
                            <th>
                                <span class="LangMedicationDeliveredCode"/>
                                <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd/@S"/>
                                <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd/@SV"/>
                            </th>
                            <td colspan="1">
                                <xsl:value-of select="kmehr:content/*/kmehr:deliveredcd"/>
                            </td>
                        </tr>
                    </tbody>
                </xsl:if>
            </xsl:when>

            <!-- CAREPLAN SUBSCRIPTION PROCESSING -->
            <xsl:when test="kmehr:cd[@S='CD-ITEM']='careplansubscription'">
                <xsl:variable name="body-class">
                    <xsl:apply-templates select="." mode="get-body-class"/>
                </xsl:variable>
                <tbody id="short" class="{$body-class}">
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:cd">
                            <tr>
                                <th colspan="2" align="center">
                                    <xsl:for-each select="kmehr:content/kmehr:cd">
                                        <xsl:if test="position()=1">
                                            <xsl:choose>
                                                <xsl:when test="@DN">
                                                    <xsl:value-of select="."/>
                                                    <xsl:text>   (</xsl:text>
                                                    <xsl:value-of select="@DN"/>
                                                    <xsl:text>)</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="."/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                        <xsl:if test="not(position()=1)">
                                            <xsl:choose>
                                                <xsl:when test="@DN">
                                                    <xsl:text> , </xsl:text>
                                                    <xsl:value-of select="."/>
                                                    <xsl:text>   (</xsl:text>
                                                    <xsl:value-of select="@DN"/>
                                                    <xsl:text>)</xsl:text>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:text> , </xsl:text>
                                                    <xsl:value-of select="."/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:if>
                                    </xsl:for-each>
                                </th>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <tbody style="display:none">
                    <tr>
                        <th class="LangMedicationPeriod"/>
                        <td colspan="1">
                            <b class="LangMedicationBeginMoment"/>
                            <xsl:value-of select="kmehr:beginmoment/kmehr:date"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:beginmoment/kmehr:time"/>
                            <xsl:value-of select="kmehr:beginmoment/kmehr:text"/>
                            <xsl:text>   </xsl:text>
                            <b class="LangMedicationEndMoment"/>
                            <xsl:value-of select="kmehr:endmoment/kmehr:date"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:endmoment/kmehr:time"/>
                            <xsl:value-of select="kmehr:endmoment/kmehr:text"/>
                        </td>
                    </tr>
                    <xsl:choose>
                        <xsl:when test="kmehr:content/kmehr:text">
                            <tr>
                                <th class="LangText"/>
                                <td>
                                    <xsl:value-of select="kmehr:content/kmehr:text"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:lifecycle">
                            <tr>
                                <th class="LangMedicationLifeCycle"/>
                                <td>
                                    <xsl:value-of select="kmehr:lifecycle/."/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:author/kmehr:hcparty">
                            <tr>
                                <td>
                                    <xsl:apply-templates select="kmehr:author/kmehr:hcparty"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <!--<xsl:choose>
						<xsl:when test="kmehr:local/kmehr:content/kmehr:hcparty">
							<tr>
								<td>
									<xsl:apply-templates select="kmehr:local/kmehr:content/kmehr:hcparty"/>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>-->
                    <xsl:choose>
                        <xsl:when test="kmehr:recorddatetime">
                            <tr>
                                <th class="LangRecorddatetime"/>
                                <td>
                                    <xsl:value-of select="kmehr:recorddatetime"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="kmehr:lnk">
                            <tr>
                                <th class="LangLnk"/>
                                <td>
                                    <xsl:apply-templates select="kmehr:lnk"/>
                                </td>
                            </tr>
                        </xsl:when>
                    </xsl:choose>
                </tbody>
                <xsl:for-each select="kmehr:cd[not(@S='CD-ITEM')]">
                    <xsl:apply-templates select="."/>
                </xsl:for-each>
            </xsl:when>

        </xsl:choose>


    </xsl:template>

    <!-- KMEHR CONTENT PROCESSING-->
    <xsl:template match="kmehr:item">
        <div class="ItemContent">
            <h4>
                <span>
                    <xsl:attribute name="class"><xsl:value-of select="concat('Lang',./kmehr:cd[@S='CD-ITEM'])"/></xsl:attribute>
                </span>
            </h4>
            <!-- GENERIC ITEM ELEMENTS PROCESS -->
            <xsl:for-each select="node()[name()]">
                <xsl:variable name="body-class">
                    <xsl:apply-templates select="." mode="get-body-class"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="local-name() = 'cd'">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:when test="local-name() = 'id'">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:when test="local-name() = 'content'">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:when test="local-name() = 'lifecycle'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'frequency'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'posology'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'dayperiod'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'duration'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'instructionforpatient'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'quantity'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'temporality'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'deliverydate'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'route'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'instructionforoverdosing'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'instructionforreimbursement'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'issubstitutionallowed'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'recorddatetime'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'regimen'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'renewal'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'lnk'">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                    <xsl:when test="local-name() = 'batch'">
                    </xsl:when>
                    <xsl:when test="local-name() = 'text'">
                        <tbody style="display:none" class="{$body-class}">
                            <tr>
                                <th class="LangText"/>
                                <td>
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="local-name() = 'beginmoment'">
                        <xsl:if test="not(../kmehr:cd[@S='CD-ITEM']='vaccine' or ../kmehr:cd[@S='CD-ITEM']='medication' or ../kmehr:cd[@S='CD-ITEM']='healthcareelement' or ../kmehr:cd[@S='CD-ITEM']='careplansubscription' )">
                            <tbody style="display:none" class="{$body-class}">
                                <tr>
                                    <th class="LangGenericBeginMoment"/>
                                    <td>
                                        <xsl:value-of select="kmehr:date"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="kmehr:time"/>
                                        <xsl:value-of select="kmehr:year"/>
                                        <xsl:value-of select="kmehr:yearmonth"/>
                                        <xsl:value-of select="kmehr:text"/>
                                    </td>
                                </tr>
                            </tbody>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="local-name() = 'endmoment'">
                        <xsl:if test="not(../kmehr:cd[@S='CD-ITEM']='medication' or ../kmehr:cd[@S='CD-ITEM']='healthcareelement' )">
                            <tbody style="display:none" class="{$body-class}">
                                <tr>
                                    <th class="LangGenericEndMoment"/>
                                    <td>
                                        <xsl:value-of select="kmehr:date"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="kmehr:time"/>
                                        <xsl:value-of select="kmehr:year"/>
                                        <xsl:value-of select="kmehr:month"/>
                                        <xsl:value-of select="kmehr:text"/>
                                    </td>
                                </tr>
                            </tbody>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="local-name()">
                        <tbody style="display:none" class="{$body-class}">
                            <tr>
                                <th>
                                    <xsl:value-of select="local-name()"/>
                                </th>
                                <td colspan="1">
                                    <xsl:value-of select="."/>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </div>
    </xsl:template>

    <!-- Display the details of an item content-->
    <xsl:template match="kmehr:content">
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <!-- Display the text-with layout-->
    <xsl:template match="kmehr:text-with-layout">
        <div class="TextWithLayout">
            <xsl:apply-templates select="node()" mode="strip-ns"/>
        </div>
    </xsl:template>

    <!-- identity template with a twist: remove the body and strip the namespaces -->
    <xsl:template match="node()[local-name()='body']" mode="strip-ns">
        <xsl:apply-templates select="node()" mode="strip-ns"/>
    </xsl:template>
    <xsl:template match="@*" mode="strip-ns">
        <xsl:copy/>
    </xsl:template>
    <xsl:template match="*" mode="strip-ns">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="@*|node()" mode="strip-ns"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="comment()" mode="strip-ns">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="strip-ns"/>
        </xsl:copy>
    </xsl:template>

    <!-- Display the date -->
    <xsl:template match="kmehr:date">
        <b>
            <xsl:value-of select="."/>&#160;
        </b>
    </xsl:template>


    <!-- Display the time -->
    <xsl:template match="kmehr:time">
        <b>
            <xsl:value-of select="."/>&#160;
        </b>
    </xsl:template>


    <xsl:template match="kmehr:text">
        <div class="tr-inverse">
            <xsl:choose>
                <xsl:when test="@L[.='fr']">
                    <xsl:attribute name="title">French free text</xsl:attribute>
                </xsl:when>
                <xsl:when test="@L[.='nl']">
                    <xsl:attribute name="title">Dutch free text</xsl:attribute>
                </xsl:when>
                <xsl:when test="@L[.='de']">
                    <xsl:attribute name="title">German free text</xsl:attribute>
                </xsl:when>
                <xsl:when test="@L[.='en']">
                    <xsl:attribute name="title">English free text</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="title">Free text</xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <span class="remarque">
                <font color="blue">
                    <xsl:value-of select="."/>
                </font>
            </span>
        </div>
    </xsl:template>

    <xsl:template match="kmehr:medicinalproduct">
        <xsl:choose>
            <xsl:when test="kmehr:intendedname">
                <tbody id="short">
                    <tr>
                        <th class="LangMedicationIntendedName"/>
                        <td>
                            <xsl:value-of select="kmehr:intendedname"/>
                        </td>
                    </tr>
                </tbody>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="kmehr:intendedcd[@S='CD-DRUG-CNK']">
                <tbody id="short">
                    <tr>
                        <th>Code CNK
                            <xsl:value-of
                                    select="kmehr:intendedcd[@S='CD-DRUG-CNK']/@SV"/>
                        </th>
                        <td colspan="1">
                            <xsl:value-of
                                    select="kmehr:intendedcd[@S='CD-DRUG-CNK']"/>
                        </td>
                    </tr>
                </tbody>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="kmehr:deliveredname">
            <tbody style="display:none">
                <tr>
                    <th class="LangMedicationDeliveredName"/>
                    <td colspan="1">
                        <xsl:value-of select="kmehr:deliveredname"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:deliveredcd">
            <tbody style="display:none">
                <tr>
                    <th>
                        <span class="LangMedicationDeliveredCode"/>
                        <xsl:value-of select="kmehr:deliveredcd/@S"/>
                        <xsl:value-of select="kmehr:deliveredcd/@SV"/>
                    </th>
                    <td colspan="1">
                        <xsl:value-of select="kmehr:deliveredcd"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
    </xsl:template>

    <!-- LNK PROCESSING -->
    <xsl:template match="kmehr:lnk">
        <xsl:variable name="destination">
            <xsl:value-of select="$directory"/>
            <xsl:if test="../kmehr:cd[@S='CD-TRANSACTION']">
                <xsl:value-of select="../kmehr:cd[@S='CD-TRANSACTION']"/>
            </xsl:if>
            <xsl:if test="../kmehr:id[@S='ID-KMEHR']">
                <xsl:text>-</xsl:text><xsl:value-of select="../kmehr:id[@S='ID-KMEHR']"/>
            </xsl:if>
            <xsl:if test="../kmehr:id[@S='LOCAL' and @SL='GPSMF-ID']">
                <xsl:text>-</xsl:text><xsl:value-of select="../kmehr:id[@S='LOCAL' and @SL='GPSMF-ID']"/>
            </xsl:if>
            <xsl:value-of select="concat('-',position())"/>
            <xsl:choose>
                <xsl:when test="@MEDIATYPE='text/plain'">
                    <xsl:text>.txt</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='text/rtf'">
                    <xsl:text>.rtf</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='text/html'">
                    <xsl:text>.html</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='application/pdf'">
                    <xsl:text>.pdf</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='image/jpeg'">
                    <xsl:text>.jpeg</xsl:text>
                </xsl:when>
                <xsl:when test="@MEDIATYPE='image/png'">
                    <xsl:text>.png</xsl:text>
                </xsl:when>
                <xsl:when test="starts-with(@MEDIATYPE,'image/')">
                    <xsl:text>.</xsl:text><xsl:value-of select="substring(@MEDIATYPE,6)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>.data</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="@TYPE">
            <b class="LangLnk-Type"/>
            <xsl:value-of select="@TYPE"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
        <xsl:if test="@MEDIATYPE">
            <b class="LangLnk-MediaType"/>
            <xsl:value-of select="@MEDIATYPE"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
        <xsl:if test="@URL">
            <b class="LangLnk-Url"/>
            <xsl:value-of select="@URL"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
        <xsl:if test="@SIZE">
            <b class="LangLnk-Size"/>
            <xsl:value-of select="@SIZE"/>
            <xsl:text>&#160;</xsl:text>
        </xsl:if>
        <a href="{$destination}">Display</a>
    </xsl:template>

    <!-- PROCESSING PATIENT-->
    <xsl:template match="kmehr:patient">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <tbody id="short" class="{$body-class}">
            <tr>
                <th colspan="2" align="center">
                    <!-- no more used <xsl:text>Patient: </xsl:text> -->
                    <xsl:value-of select="kmehr:firstname[1]"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="kmehr:familyname"/>
                </th>
            </tr>
        </tbody>
        <xsl:if test="not(kmehr:id[@S='ID-PATIENT' or @S='INSS'])">
            <tbody style="display:none">
                <tr>
                    <th class="LangINSS"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:for-each select="kmehr:id">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <tbody style="display:none">
            <tr>
                <th class="LangPersonFirstNames"/>
                <td>
                    <xsl:value-of select="kmehr:firstname"/>
                </td>
            </tr>
            <tr>
                <th class="LangPersonFamilyName"/>
                <td>
                    <xsl:value-of select="kmehr:familyname"/>
                </td>
            </tr>
        </tbody>
        <tbody id="short">
            <tr>
                <th class="LangCD-SEX"/>
                <td>
                    <xsl:value-of select="kmehr:sex/kmehr:cd[@S='CD-SEX']"/>
                </td>
            </tr>
            <tr>
                <th class="LangPersonBirthdate"/>
                <td>
                    <xsl:value-of select="kmehr:birthdate/kmehr:date"/>
                    <xsl:value-of select="kmehr:birthdate/kmehr:year"/>
                    <xsl:value-of select="kmehr:birthdate/kmehr:yearmonth"/>
                </td>
            </tr>
        </tbody>
        <xsl:if test="kmehr:birthlocation">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonBirthLocation"/>
                    <td>
                        <xsl:value-of select="kmehr:birthlocation/kmehr:city"/>
                        <xsl:text> / </xsl:text>
                        <xsl:value-of select="kmehr:birthlocation/kmehr:country/kmehr:cd"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:deathdate">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonDeathDate"/>
                    <td>
                        <xsl:value-of select="kmehr:deathdate/kmehr:date"/>
                        <xsl:value-of select="kmehr:deathdate/kmehr:year"/>
                        <xsl:value-of select="kmehr:deathdate/kmehr:yearmonth"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:deathlocation">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonDeathLocation"/>
                    <td>
                        <xsl:value-of select="kmehr:deathlocation/kmehr:city"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="kmehr:deathlocation/kmehr:cd[@S='CD-COUNTRY']"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:nationality">
            <tbody style="display:none">
                <tr>
                    <th class="LangCD-COUNTRY"/>
                    <td>
                        <xsl:value-of select="kmehr:nationality/kmehr:cd[@S='CD-COUNTRY']"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <tbody id="short">
            <tr>
                <th class="LangPersonUsualLanguage"/>
                <td>
                    <xsl:value-of select="kmehr:usuallanguage"/>
                </td>
            </tr>
        </tbody>
        <xsl:if test="not(kmehr:address)">
            <tbody id="short">
                <tr>
                    <th class="LangAddress"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="not(kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='phone'] or kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='mobile'])">
            <tbody style="display:none">
                <tr>
                    <th class="LangTelecom"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:apply-templates select="kmehr:address"/>
        <xsl:apply-templates select="kmehr:telecom"/>
        <xsl:if test="kmehr:profession">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonProfession"/>
                    <td>
                        <xsl:value-of select="kmehr:profession"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:recorddatetime">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonRecordDate"/>
                    <td>
                        <xsl:value-of select="kmehr:recorddatetime"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:text">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonText"/>
                    <td>
                        <xsl:value-of select="kmehr:text"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:lnk">
            <tbody style="display:none">
                <tr>
                    <th class="LangLnk"/>
                    <td>
                        <xsl:apply-templates select="kmehr:lnk"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <!-- END Patient specific section -->
    </xsl:template>

    <!-- PROCESSING PERSON -->
    <xsl:template match="kmehr:person">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <tbody id="short" class="{$body-class}">
            <tr>
                <th colspan="2" align="center">
                    <!-- no more used <xsl:value-of select="../../kmehr:cd[@S='CD-ITEM']"/><xsl:text>: </xsl:text> -->
                    <xsl:value-of select="kmehr:firstname"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="kmehr:familyname"/>
                </th>
            </tr>
        </tbody>
        <xsl:for-each select="kmehr:id">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <tbody style="display:none">
            <tr>
                <th class="LangPersonFirstNames"/>
                <td>
                    <xsl:value-of select="kmehr:firstname"/>
                </td>
            </tr>
            <tr>
                <th class="LangPersonFamilyName"/>
                <td>
                    <xsl:value-of select="kmehr:familyname"/>
                </td>
            </tr>
            <tr>
                <th class="LangCD-SEX"/>
                <td>
                    <xsl:value-of select="kmehr:sex/kmehr:cd[@S='CD-SEX']"/>
                </td>
            </tr>
            <xsl:if test="kmehr:birthdate">
                <tr>
                    <th class="LangPersonBirthdate"/>
                    <td>
                        <xsl:value-of select="kmehr:birthdate/kmehr:date"/>
                        <xsl:value-of select="kmehr:birthdate/kmehr:year"/>
                        <xsl:value-of select="kmehr:birthdate/kmehr:yearmonth"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="kmehr:birthlocation">
                <tr>
                    <th class="LangPersonBirthLocation"/>
                    <td>
                        <xsl:value-of select="kmehr:birthlocation/kmehr:city"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="kmehr:birthlocation/kmehr:cd[@S='CD-COUNTRY']"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="kmehr:deathdate">
                <tr>
                    <th class="LangPersonDeathDate"/>
                    <td>
                        <xsl:value-of select="kmehr:deathdate/kmehr:date"/>
                        <xsl:value-of select="kmehr:deathdate/kmehr:year"/>
                        <xsl:value-of select="kmehr:deathdate/kmehr:yearmonth"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="kmehr:deathlocation">
                <tr>
                    <th class="LangPersonDeathLocation"/>
                    <td>
                        <xsl:value-of select="kmehr:deathlocation/kmehr:city"/>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="kmehr:deathlocation/kmehr:cd[@S='CD-COUNTRY']"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="kmehr:nationality">
                <tr>
                    <th class="LangCD-COUNTRY"/>
                    <td>
                        <xsl:value-of select="kmehr:nationality/kmehr:cd[@S='CD-COUNTRY']"/>
                    </td>
                </tr>
            </xsl:if>
            <xsl:if test="kmehr:usuallanguage">
                <tr>
                    <th class="LangPersonUsualLanguage"/>
                    <td>
                        <xsl:value-of select="kmehr:usuallanguage"/>
                    </td>
                </tr>
            </xsl:if>
        </tbody>
        <xsl:if test="not(kmehr:address)">
            <tbody style="display:none">
                <tr>
                    <th class="LangAddress"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="not(kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='phone'] or kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='mobile'])">
            <tbody style="display:none">
                <tr>
                    <th class="LangTelecom"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:apply-templates select="kmehr:address"/>
        <xsl:apply-templates select="kmehr:telecom"/>
        <xsl:if test="kmehr:recorddatetime">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonRecordDate"/>
                    <td>
                        <xsl:value-of select="kmehr:recorddatetime"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:text">
            <tbody style="display:none">
                <tr>
                    <th class="LangPersonText"/>
                    <td>
                        <xsl:value-of select="kmehr:text"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="kmehr:lnk">
            <tbody style="display:none">
                <tr>
                    <th class="LangLnk"/>
                    <td>
                        <xsl:value-of select="kmehr:lnk"/>
                    </td>
                </tr>
            </tbody>
        </xsl:if>
        <!-- usefull?
		<xsl:if test="not(../../kmehr:cd[@S='CD-CONTACT-PERSON'])">
			<tbody id="short"><tr><th class="english">Family tie</th><th class="french">Lien de parenté</th><th class="dutch">Family tie</th><td></td></tr></tbody>
		</xsl:if> -->
        <!-- Person specific section -->
    </xsl:template>

    <!-- HCPARTY PROCESSING -->
    <xsl:template match="kmehr:hcparty">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <tbody id="short" class="{$body-class}">
            <xsl:choose>
                <xsl:when test="name(..)='author'">
                    <tr>
                        <th colspan="2" align="center">
                            <!-- no more used <xsl:text>Author hcparty : </xsl:text> -->
                            <xsl:value-of select="kmehr:name"/>
                            <xsl:value-of select="kmehr:firstname[1]"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:familyname"/>
                        </th>
                    </tr>
                </xsl:when>
                <xsl:otherwise>
                    <tr>
                        <th colspan="2" align="center">
                            <!-- no more used <xsl:value-of select="../../kmehr:cd[@S='CD-ITEM']"/><xsl:text> : </xsl:text> -->
                            <xsl:value-of select="kmehr:name"/>
                            <xsl:value-of select="kmehr:firstname"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:familyname"/>
                        </th>
                    </tr>
                </xsl:otherwise>
            </xsl:choose>
        </tbody>
        <xsl:if test="not(kmehr:id[@S='ID-HCPARTY'])">
            <tbody style="display:none">
                <tr>
                    <th class="LangID-HCPARTY"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:for-each select="kmehr:id">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <xsl:if test="not(kmehr:id[@S='INSS']) and name(..)='author'">
            <tbody style="display:none">
                <tr>
                    <th class="LangINSS"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="not(kmehr:cd[@S='CD-HCPARTY']) and name(..)='author'">
            <tbody style="display:none">
                <tr>
                    <th class="LangCD-HCPARTY"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:for-each select="kmehr:cd">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <tbody style="display:none">
            <xsl:choose>
                <xsl:when test="kmehr:firstname">
                    <tr>
                        <th class="LangPersonFirstNames"/>
                        <td>
                            <xsl:value-of select="kmehr:firstname"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="LangPersonFamilyName"/>
                        <td>
                            <xsl:value-of select="kmehr:familyname"/>
                        </td>
                    </tr>
                </xsl:when>
                <xsl:when test="kmehr:name">
                    <tr>
                        <th class="LangHcpartyName"/>
                        <td>
                            <xsl:value-of select="kmehr:name"/>
                        </td>
                    </tr>
                </xsl:when>
            </xsl:choose>
        </tbody>
        <xsl:if test="not(kmehr:address)">
            <tbody style="display:none">
                <tr>
                    <th class="LangAddress"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:if test="not(kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='phone'] or kmehr:telecom[kmehr:cd[@S='CD-TELECOM']='mobile'])">
            <tbody style="display:none">
                <tr>
                    <th class="LangTelecom"/>
                    <td/>
                </tr>
            </tbody>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="kmehr:lnk">
                <tr>
                    <th class="LangLnk"/>
                    <td>
                        <xsl:apply-templates select="kmehr:lnk"/>
                    </td>
                </tr>
            </xsl:when>
        </xsl:choose>
        <xsl:apply-templates select="kmehr:address"/>
        <xsl:apply-templates select="kmehr:telecom"/>
    </xsl:template>

    <!-- TELECOM PROCESSING -->
    <xsl:template match="kmehr:telecom">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <tbody style="display:none" class="{$body-class}">
            <tr>
                <th>
                    <span class="LangTelecom"/>
                </th>
                <td>
                    "<xsl:value-of select="kmehr:cd[@S='CD-TELECOM']"/>" :
                    <xsl:value-of select="kmehr:telecomnumber"/> (<xsl:value-of select="kmehr:cd[@S='CD-ADDRESS']"/>)
                </td>
            </tr>
        </tbody>
    </xsl:template>

    <!-- ADDRESS PROCESSING -->
    <xsl:template match="kmehr:address">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <xsl:variable name="display-type">
            <xsl:choose>
                <xsl:when test="name(..)='patient'">short</xsl:when>
                <xsl:otherwise>default</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="display-value">
            <xsl:choose>
                <xsl:when test="name(..)='patient'"/>
                <xsl:otherwise>display:none</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <tbody style="{$display-value}" id="{$display-type}" class="{$body-class}">
            <tr>
                <th>
                    <xsl:text>"</xsl:text>
                    <xsl:value-of select="kmehr:cd"/>
                    <xsl:text>" </xsl:text>
                    <span class="LangAddress"/>
                </th>
                <td>
                    <xsl:choose>
                        <xsl:when test="kmehr:text">
                            <xsl:value-of select="kmehr:text"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="kmehr:street"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:housenumber"/>
                            <xsl:if test="kmehr:postboxnumber">
                                <xsl:text> </xsl:text>
                                <span class="LangAddressPB"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="kmehr:postboxnumber"/>
                            </xsl:if>
                            <xsl:text> ; </xsl:text>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:zip"/>
                            <xsl:if test="kmehr:nis">
                                <xsl:text> </xsl:text>
                                <span class="LangAddressNis"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="kmehr:nis"/>
                            </xsl:if>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="kmehr:city"/>
                            <xsl:if test="kmehr:district">
                                <xsl:text> </xsl:text>
                                <span class="LangAddressDistrict"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="kmehr:district"/>
                            </xsl:if>
                            <xsl:if test="kmehr:country">
                                <xsl:text> / </xsl:text>
                                <xsl:value-of select="kmehr:country/kmehr:cd"/>
                            </xsl:if>
                            <xsl:if test="kmehr:text">
                                <xsl:text> / </xsl:text>
                                <span class="LangAddressText"/>
                                <xsl:text> : </xsl:text>
                                <xsl:value-of select="kmehr:text"/>
                            </xsl:if>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
            </tr>
        </tbody>
    </xsl:template>

    <!-- ID PROCESSING -->
    <xsl:template match="kmehr:id">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@S='ID-KMEHR'">
            </xsl:when>
            <xsl:otherwise>
                <tbody style="display:none" class="{$body-class}">
                    <tr>
                        <xsl:choose>
                            <!-- no more used: replaced bay id INSS
							<xsl:when test="@S='LOCAL' and @SL='ID-PATIENT' and name(..)='hcparty'">
								<xsl:text>INSS No</xsl:text>
							</xsl:when> -->
                            <xsl:when test="@S='LOCAL'">
                                <th>
                                    <xsl:text>(local id) </xsl:text>
                                    <xsl:value-of select="@SL"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="@SV"/>
                                </th>
                            </xsl:when>
                            <xsl:when test="@S='INSS'">
                                <th class="LangINSS"/>
                            </xsl:when>
                            <xsl:when test="@S='ID-PATIENT'">
                                <th class="LangID-PATIENT"/>
                            </xsl:when>
                            <xsl:when test="@S='ID-HCPARTY'">
                                <th class="LangID-HCPARTY"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <th>
                                    <xsl:value-of select="@S"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="@SV"/>
                                </th>
                            </xsl:otherwise>
                        </xsl:choose>
                        <td colspan="1">
                            <xsl:value-of select="."/>
                        </td>
                    </tr>
                </tbody>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- CD PROCESSING -->
    <xsl:template match="kmehr:cd">
        <xsl:variable name="body-class">
            <xsl:apply-templates select="." mode="get-body-class"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@S='CD-ITEM'">
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="@S='CD-HCPARTY' and ../../../kmehr:cd[@S='CD-ITEM']='contacthcparty'">
                        <tbody id="short" class="{$body-class}">
                            <tr>
                                <th class="LangCD-HCPARTY"/>
                                <td colspan="1">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@DN">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="@DN"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="@S='CD-CONTACT-PERSON' and ../kmehr:cd[@S='CD-ITEM']='contactperson'">
                        <tbody id="short" class="{$body-class}">
                            <tr>
                                <th class="LangCD-CONTACT-PERSON">
                                    <xsl:text>Family Tie</xsl:text>
                                </th>
                                <td colspan="1">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@DN">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="@DN"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="@S='CD-PATIENTWILL' and //kmehr:item[kmehr:cd[@S='CD-ITEM']='patientwill']">
                        <tbody id="short" class="{$body-class}">
                            <th colspan="2" align="center">
                                <xsl:value-of select="."/>
                            </th>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="@S='CD-CLINICAL'">
                        <tbody style="display:none" class="{$body-class}">
                            <tr>
                                <th>
                                    <xsl:text>IBUI </xsl:text>
                                    <xsl:value-of select="@SV"/>
                                </th>
                                <td>
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@DN">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="@DN"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="@S='ICPC'">
                        <tbody style="display:none" class="{$body-class}">
                            <tr>
                                <th>
                                    <xsl:text>ICPC </xsl:text>
                                    <xsl:value-of select="@SV"/>
                                </th>
                                <td>
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@DN">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="@DN"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:when test="@S='ICD'">
                        <tbody style="display:none" class="{$body-class}">
                            <tr>
                                <th>
                                    <xsl:text>ICD </xsl:text>
                                    <xsl:value-of select="@SV"/>
                                </th>
                                <td>
                                    <xsl:value-of select="."/>
                                    <xsl:if test="@DN">
                                        <xsl:text> (</xsl:text>
                                        <xsl:value-of select="@DN"/>
                                        <xsl:text>)</xsl:text>
                                    </xsl:if>
                                </td>
                            </tr>
                        </tbody>
                    </xsl:when>
                    <xsl:otherwise>
                        <tbody style="display:none" class="{$body-class}">
                            <xsl:choose>
                                <xsl:when test="@S='LOCAL'">
                                    <th>
                                        <xsl:text>(local cd) </xsl:text>
                                        <xsl:value-of select="@SL"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="@SV"/>
                                    </th>
                                </xsl:when>
                                <xsl:when test="@S='CD-HCPARTY'">
                                    <th class="LangCD-HCPARTY"/>
                                </xsl:when>
                                <xsl:when test="@S='CD-CONTACT-PERSON'">
                                    <th class="LangCD-CONTACT-PERSON"/>
                                </xsl:when>
                                <xsl:when test="@S='CD-PATIENTWILL'">
                                    <th class="LangCD-PATIENTWILL"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <th>
                                        <xsl:value-of select="@S"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="@SV"/>
                                    </th>
                                </xsl:otherwise>
                            </xsl:choose>
                            <td colspan="1">
                                <!-- If we want to use secondary files, example
									<xsl:variable name="code-group"><xsl:value-of select="@S"/></xsl:variable>
									<xsl:variable name="code"><xsl:value-of select="current()"/></xsl:variable>
									<xsl:choose>
									  <xsl:when test="document('index.xml')//index:code-group[@S=$code-group]/index:translation/@code = $code">
										<xsl:value-of select="document('index.xml')//index:code-group[@S='CD-HCPARTY']/index:translation[@code='persphysician']"/>
									  </xsl:when>
									  <xsl:otherwise>
										<xsl:value-of select="."/>
									  </xsl:otherwise>
									</xsl:choose>
									-->
                                <xsl:value-of select="."/>
                                <xsl:if test="@DN">
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of select="@DN"/>
                                    <xsl:text>)</xsl:text>
                                </xsl:if>
                            </td>
                        </tbody>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <!-- USED UTILITARIAN "FUNCTIONS" -->
    <xsl:template match="*" mode="get-path">
        <xsl:apply-templates select="parent::*" mode="get-path"/>
        <xsl:variable name="element-name">
            <xsl:value-of select="local-name()"/>
        </xsl:variable>
        <xsl:text>/kmehr:</xsl:text>
        <xsl:value-of select="local-name()"/>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="1+count(preceding-sibling::*[local-name()=$element-name])"/>
        <xsl:text>]</xsl:text>
    </xsl:template>
    <xsl:template match="*" mode="get-body-class">default</xsl:template>
    <xsl:template name="get-translationdictionary-path">
        <xsl:choose>
            <xsl:when test="$translationdictionary = '' ">
                <xsl:value-of select="concat($annexdirectory,'kmehr_to_html_trn.xml')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($annexdirectory,$translationdictionary)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="get-defaultlanguage">
        <xsl:choose>
            <xsl:when test="$language = '' ">english</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$language"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="kmehr:*">
        <xsl:variable name="location">
            <xsl:apply-templates select="." mode="get-path"/>
        </xsl:variable>
        <p>
            <xsl:value-of select="$location"/> is not treated !
        </p>
        <xsl:apply-templates select="kmehr:*"/>
    </xsl:template>
</xsl:stylesheet>
