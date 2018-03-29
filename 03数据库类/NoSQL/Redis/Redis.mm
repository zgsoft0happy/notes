<map version="freeplane 1.6.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Redis" FOLDED="false" ID="ID_66191531" CREATED="1507863702534" MODIFIED="1507863741149" STYLE="oval">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="5" RULE="ON_BRANCH_CREATION"/>
<node TEXT="Redis&#x521d;&#x8bc6;" POSITION="right" ID="ID_1549115232" CREATED="1507863744520" MODIFIED="1507878413139">
<edge COLOR="#ff0000"/>
<richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      key-value
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="Redis&#x5b89;&#x88c5;" POSITION="right" ID="ID_1033734929" CREATED="1507863768012" MODIFIED="1507863776712">
<edge COLOR="#0000ff"/>
<node TEXT="Windows&#x5b89;&#x88c5;" ID="ID_294158715" CREATED="1507863779267" MODIFIED="1507878414302"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23448;&#26041;&#21482;&#25552;&#20379;&#20102;linux&#29256;&#26412;&#30340;&#65292;&#20294;&#26159;&#26377;&#20154;&#25552;&#20379;&#20102;windows&#19979;&#30340;&#23433;&#35013;&#65292;&#22320;&#22336;&#65306;https://github.com/MicrosoftArchive/redis/releases&#65307;&#36825;&#37324;&#26377;&#23433;&#35013;&#21253;&#21644;&#21387;&#32553;&#21253;&#65292;&#26681;&#25454;&#38656;&#35201;&#19979;&#36733;&#65292;&#36825;&#37324;&#19979;&#36733;&#30340;&#26159;&#21387;&#32553;&#21253;&#65307;
    </p>
    <p>
      1. &#19979;&#36733;&#23436;&#25104;&#21518;&#35299;&#21387;&#65307;
    </p>
    <p>
      2. &#36827;&#20837;&#35299;&#21387;&#21518;&#30340;&#30446;&#24405;&#65292;&#25171;&#24320;&#32456;&#31471;&#65288;cmd&#65289;&#25191;&#34892;&#21629;&#20196;`redis-server redis.windows.conf`;
    </p>
    <p>
      3. &#36827;&#20837;&#35299;&#21387;&#21518;&#30340;&#30446;&#24405;&#65292;&#25171;&#24320;&#32456;&#31471;&#25191;&#34892;&#21629;&#20196;`redis-cli -h 127.0.0.1 -p 6379`&#12290;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="Linux&#x5b89;&#x88c5;" ID="ID_1655259961" CREATED="1507865482935" MODIFIED="1507878415580"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      1. &#23448;&#32593;&#19979;&#36733;redis-x.x.x.tar.gz&#21253;&#65307;
    </p>
    <p>
      2. &#35299;&#21387;&#65306;`tar -zxvf redis-x.x.x.tar.gz`;
    </p>
    <p>
      3. &#36827;&#20837;&#35299;&#21387;&#30446;&#24405;&#65306;`cd redis-x.x.x`;
    </p>
    <p>
      4. &#32534;&#35793;&#23433;&#35013;&#65306;`make PREFIX=/usr/local/redis install`,&#27880;&#24847;&#26435;&#38480;&#38382;&#39064;&#65307;
    </p>
    <p>
      5. &#36827;&#20837;&#23433;&#35013;&#30446;&#24405;&#65306;`cd /usr/local/redis/bin`;
    </p>
    <p>
      6. &#25191;&#34892;&#21551;&#21160;&#26381;&#21153;&#65306;`./redis-server [redis.conf]`;
    </p>
    <p>
      7. &#26032;&#24320;&#32456;&#31471;&#36827;&#20837;&#23433;&#35013;&#30446;&#24405;&#20013;&#25191;&#34892;&#30331;&#38470;&#21629;&#20196;&#65306;`./redis-cli [-h 127.0.0.1 -p 6379]`&#12290;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="Redis&#x6ce8;&#x518c;&#x672c;&#x5730;&#x670d;&#x52a1;" FOLDED="true" POSITION="right" ID="ID_531482431" CREATED="1507875241534" MODIFIED="1507875278517">
<edge COLOR="#00ff00"/>
<node TEXT="windows&#x5e73;&#x53f0;" ID="ID_1158048292" CREATED="1507875279823" MODIFIED="1507878418147"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      1. &#22312;&#23433;&#35013;&#25110;&#32773;&#21387;&#32553;&#30446;&#24405;&#19979;&#36816;&#34892;&#21629;&#20196;&#65306;`redis-server.exe --service-install redis.windows.conf`;
    </p>
    <p>
      2. &#21629;&#20196;&#36816;&#34892;&#25104;&#21151;&#20250;&#25552;&#31034;&#65306;`Redis successfully installed as s service`;
    </p>
    <p>
      3. &#22312;&#31995;&#32479;&#30340;&#26412;&#22320;&#26381;&#21153;&#21015;&#34920;&#20013;&#26597;&#25214;&#26159;&#21542;&#26377;Redis&#26381;&#21153;&#65307;
    </p>
    <p>
      4. &#20808;&#19981;&#21551;&#21160;redis&#26381;&#21153;&#65292;&#20351;&#29992;&#32456;&#31471;&#30331;&#24405;`redis-cli.exe -h127.0.0.1 -p 6379`&#24456;&#38271;&#26102;&#38388;&#27809;&#26377;&#21453;&#24212;&#65307;
    </p>
    <p>
      5. &#21551;&#21160;Redis&#26381;&#21153;&#65292;&#22312;&#30331;&#24405;&#65292;&#25104;&#21151;&#30331;&#24405;&#12290;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="Linux&#x5e73;&#x53f0;" ID="ID_976069845" CREATED="1507875782482" MODIFIED="1507878419451"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#39318;&#20808;&#35828;&#26126;&#65306;linux&#33258;&#24049;&#23433;&#35013;chkconfig&#24037;&#20855;&#12290;
    </p>
    <p>
      1. &#23558;&#21387;&#32553;&#30446;&#24405;&#20013;&#30340;util/redis_init_script &#31227;&#21160;&#21040;/etc/init.d&#19979;&#65292;&#24182;&#37325;&#21629;&#21517;&#20026;redis:`cp ./util/redis_init_script /etc/init.d/redis`;
    </p>
    <p>
      2. &#28155;&#21152;&#26381;&#21153;&#65292;&#36816;&#34892;&#21629;&#20196;&#65306;`chkconfig --add redis`;
    </p>
    <p>
      3. &#20462;&#25913;/etc/init.d/redis&#33050;&#26412;&#65306;
    </p>
    <p>
      &#160;&#160;&#160;&#160;a. &#31532;&#20108;&#34892;&#28155;&#21152;&#65288;&#27880;&#37322;&#65289;&#65306;`#chkconfig 2345 80 90`;
    </p>
    <p>
      &#160;&#160;&#160;&#160;b. &#20462;&#25913;EXEC&#21644;CLIEXEC&#30340;&#20540;&#20026;&#23433;&#35013;&#30446;&#24405;&#19979;&#30340;&#21487;&#25191;&#34892;&#25991;&#20214;&#65306;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;`EXEC=/usr/local/redis/bin/redis-server`
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;`CLIEXEC=/usr/local/redis/bin/redis-cli`&#65307;
    </p>
    <p>
      &#160;&#160;&#160;&#160;c. &#20462;&#25913;&#21518;&#21488;&#36816;&#34892;&#26041;&#24335;&#65306;`$EXEC $CONF &amp;`;
    </p>
    <p>
      4. &#23558;redis&#30340;&#37197;&#32622;&#25991;&#20214;&#31227;&#21160;&#21040;/etc/redis&#30446;&#24405;&#19979;&#65306;
    </p>
    <p>
      &#160;&#160;&#160;&#160;`cd /etc `
    </p>
    <p>
      &#160;&#160;&#160;&#160;`mkdir redis`
    </p>
    <p>
      &#160;&#160;&#160;&#160;`cp /usr/local/redis/redis.conf /etc/redis/6379.conf`;
    </p>
    <p>
      5. &#20877;&#27425;&#28155;&#21152;&#26381;&#21153;&#65306;`chkconfig --add redis`;
    </p>
    <p>
      6. &#21551;&#21160;&#26381;&#21153;&#65306;`service redis start`;
    </p>
    <p>
      7. &#30331;&#24405;&#39564;&#35777;&#12290;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="Redis&#x6570;&#x636e;&#x7c7b;&#x578b;" FOLDED="true" POSITION="right" ID="ID_1350593916" CREATED="1507878422570" MODIFIED="1507878431298">
<edge COLOR="#ff00ff"/>
<node TEXT="&#x5b57;&#x7b26;&#x4e32;" FOLDED="true" ID="ID_1144415974" CREATED="1507878431313" MODIFIED="1507878438621">
<node TEXT="SET key value" ID="ID_563556715" CREATED="1507878463512" MODIFIED="1507880095540"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;&#25351;&#23450;key&#30340;&#20540;&#20026;value
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="GET key" ID="ID_825072295" CREATED="1507878500824" MODIFIED="1507880096604"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#25351;&#23450;key&#23545;&#24212;&#30340;value&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="GETRANGE key start end" ID="ID_1160930216" CREATED="1507878549929" MODIFIED="1507880097492"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#25351;&#23450;key&#30340;&#20540;&#30340;&#25351;&#23450;&#36820;&#22238;&#30340;&#23376;&#23383;&#31526;&#20018;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="GETSET key value" ID="ID_1717512621" CREATED="1507878602552" MODIFIED="1507880099468"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;&#25351;&#23450;key&#30340;&#20540;&#65292;&#24182;&#36820;&#22238;key&#30340;&#26087;&#20540;&#65288;old value&#65289;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="GETBIT key offset" ID="ID_1871067621" CREATED="1507878648288" MODIFIED="1507880100741"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#25351;&#23450;key&#30340;&#20540;&#30340;&#25351;&#23450;&#20559;&#31227;&#37327;offset&#30340;&#20301;&#19978;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="MGET key1 [key2 ...]" ID="ID_1958103155" CREATED="1507878787825" MODIFIED="1507880101596"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#22810;&#20010;&#25351;&#23450;key&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SETBIT key offset value" ID="ID_313438279" CREATED="1507878987753" MODIFIED="1507880102387"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;&#65288;&#25110;&#32773;&#28165;&#38500;&#65289;&#25351;&#23450;key&#30340;&#25351;&#23450;&#20559;&#31227;&#37327;&#20301;&#19978;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SETEX key seconds value" ID="ID_1763550602" CREATED="1507879047168" MODIFIED="1507880103557"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;value&#20851;&#32852;&#21040;key&#65292;&#24182;&#23558;key&#30340;&#26102;&#38388;&#35774;&#32622;&#20026;secods(&#21333;&#20301;&#26159;&#31186;)
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SETNX key value" ID="ID_45508176" CREATED="1507879120298" MODIFIED="1507880104628"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;key&#19981;&#23384;&#22312;&#26102;&#65292;&#35774;&#32622;key&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SETRANGE key offset value" ID="ID_1954722110" CREATED="1507879165657" MODIFIED="1507880107020"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;&#25351;&#23450;key&#30340;&#25351;&#23450;&#20559;&#31227;&#37327;&#20043;&#21518;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="STRLEN key" ID="ID_1321178840" CREATED="1507879885503" MODIFIED="1507880108148"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#25351;&#23450;key&#30340;&#23383;&#31526;&#20018;&#30340;&#38271;&#24230;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="MSET key1 value1 [key2 value2 ...]" ID="ID_867579546" CREATED="1507879930455" MODIFIED="1507880109156"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#27425;&#35774;&#32622;&#22810;&#20010;key&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="MSETNX key1 value1 [key2 value2 ...]" ID="ID_324265398" CREATED="1507880051153" MODIFIED="1507880118260"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21516;SETNX&#65292;&#20294;&#21487;&#20197;&#19968;&#27425;&#35774;&#32622;&#22810;&#20010;key
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="PSETEX key milliseconds value" ID="ID_1699109803" CREATED="1507880149812" MODIFIED="1507881508196"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21516;SETEX&#65292;&#21482;&#26159;&#20197;&#27627;&#31186;&#20026;&#21333;&#20301;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="INCR key" ID="ID_804323249" CREATED="1507880208953" MODIFIED="1507881507444"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;key&#20013;&#23384;&#20648;&#30340;&#20540;&#21152;1
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="INCRBY key incremnet" ID="ID_1623612490" CREATED="1507880238725" MODIFIED="1507881509076"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;key&#20013;&#23384;&#20648;&#30340;&#20540;&#22686;&#21152;increment
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="INCRBYFLOAT key increment" ID="ID_1712438682" CREATED="1507880282704" MODIFIED="1507881509876"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#25351;&#23450;&#30340;key&#30340;&#20540;&#22686;&#21152;&#25351;&#23450;&#30340;&#28014;&#28857;&#22411;increment&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="DECR key" ID="ID_140187863" CREATED="1507881401671" MODIFIED="1507881510660"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#25351;&#23450;&#30340;key&#30340;&#20540;&#20943;1
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="DECRBY key decrement" ID="ID_656361251" CREATED="1507881422856" MODIFIED="1507881511460"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#25351;&#23450;&#30340;key&#20943;&#23569;&#25351;&#23450;&#30340;decrement
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="APPEND key value" ID="ID_204139100" CREATED="1507881459254" MODIFIED="1507881512068"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;value&#36861;&#21152;&#21040;&#24050;&#23384;&#22312;key&#30340;&#20540;&#30340;&#21518;&#38754;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="&#x5217;&#x8868;" FOLDED="true" ID="ID_1236431613" CREATED="1507887813880" MODIFIED="1507888660990">
<node TEXT="BLOPO key1 [key2 ...] timeout" ID="ID_246093924" CREATED="1507887837977" MODIFIED="1507887878396"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#20986;&#24182;&#33719;&#21462;&#21015;&#34920;&#30340;&#31532;&#19968;&#20010;&#20803;&#32032;&#65292; &#22914;&#26524;&#21015;&#34920;&#27809;&#26377;&#20803;&#32032;&#20250;&#38459;&#22622;&#21015;&#34920;&#30452;&#21040;&#31561;&#24453;&#36229;&#26102;&#25110;&#21457;&#29616;&#21487;&#24377;&#20986;&#20803;&#32032;&#20026;&#27490;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="BRPOP key1 [key2 ...] timeout" ID="ID_168384670" CREATED="1507887869073" MODIFIED="1507888498580"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#20986;&#24182;&#33719;&#21462;&#21015;&#34920;&#30340;&#26368;&#21518;&#19968;&#20010;&#20803;&#32032;&#65292; &#22914;&#26524;&#21015;&#34920;&#27809;&#26377;&#20803;&#32032;&#20250;&#38459;&#22622;&#21015;&#34920;&#30452;&#21040;&#31561;&#24453;&#36229;&#26102;&#25110;&#21457;&#29616;&#21487;&#24377;&#20986;&#20803;&#32032;&#20026;&#27490;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="BRPOPLPUSH source destination timeout" ID="ID_202595090" CREATED="1507887924130" MODIFIED="1507888499804"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#20174;&#21015;&#34920;&#20013;&#24377;&#20986;&#19968;&#20010;&#20540;&#65292;&#23558;&#24377;&#20986;&#30340;&#20803;&#32032;&#25554;&#20837;&#21040;&#21478;&#22806;&#19968;&#20010;&#21015;&#34920;&#20013;&#24182;&#36820;&#22238;&#23427;&#65307; &#22914;&#26524;&#21015;&#34920;&#27809;&#26377;&#20803;&#32032;&#20250;&#38459;&#22622;&#21015;&#34920;&#30452;&#21040;&#31561;&#24453;&#36229;&#26102;&#25110;&#21457;&#29616;&#21487;&#24377;&#20986;&#20803;&#32032;&#20026;&#27490;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LINDEX key index" ID="ID_1974578443" CREATED="1507887983879" MODIFIED="1507888500772"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36890;&#36807;&#32034;&#24341;&#33719;&#21462;&#21015;&#34920;&#20013;&#30340;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LINSERT key BEFORE | AFTER pivot value" ID="ID_1932954224" CREATED="1507888013129" MODIFIED="1507888501660"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;&#21015;&#34920;&#30340;&#20803;&#32032;&#21069;&#25110;&#32773;&#21518;&#25554;&#20837;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LLEN key" ID="ID_303749072" CREATED="1507888048496" MODIFIED="1507888503620"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#24471;&#21015;&#34920;&#38271;&#24230;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LPOP key" ID="ID_1042767917" CREATED="1507888072478" MODIFIED="1507888504852"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#20986;&#24182;&#33719;&#21462;&#21015;&#34920;&#30340;&#31532;&#19968;&#20010;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LPUSH key value1 [value2 ...]" ID="ID_273423832" CREATED="1507888078462" MODIFIED="1507888505988"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#19968;&#20010;&#25110;&#22810;&#20010;&#20540;&#25554;&#20837;&#21040;&#21015;&#34920;&#22836;&#37096;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LPUSHX key value" ID="ID_1298084966" CREATED="1507888384309" MODIFIED="1507888660989"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#19968;&#20010;&#25110;&#22810;&#20010;&#20540;&#25554;&#20837;&#21040;&#24050;&#23384;&#22312;&#30340;&#21015;&#34920;&#22836;&#37096;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LRANGE key start stop" ID="ID_1891762071" CREATED="1507888457432" MODIFIED="1507888508716"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#21015;&#34920;&#25351;&#23450;&#33539;&#22260;&#20869;&#30340;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LREM key count value" ID="ID_586151506" CREATED="1507888473359" MODIFIED="1507888510044"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#38500;&#21015;&#34920;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LSET key index value" ID="ID_1039225651" CREATED="1507888496366" MODIFIED="1507888575036"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36890;&#36807;&#32034;&#24341;&#35774;&#32622;&#21015;&#34920;&#20803;&#32032;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="LTRIM key start stop" ID="ID_260070858" CREATED="1507888532422" MODIFIED="1507888575956"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#19968;&#20010;&#21015;&#34920;&#36827;&#34892;&#20462;&#21098;(trim)&#65292;&#23601;&#26159;&#35828;&#65292;&#35753;&#21015;&#34920;&#21482;&#20445;&#30041;&#25351;&#23450;&#21306;&#38388;&#20869;&#30340;&#20803;&#32032;&#65292;&#19981;&#22312;&#25351;&#23450;&#21306;&#38388;&#20043;&#20869;&#30340;&#20803;&#32032;&#37117;&#23558;&#34987;&#21024;&#38500;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="RPOP key" ID="ID_205888109" CREATED="1507888553834" MODIFIED="1507888577524"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#38500;&#24182;&#33719;&#21462;&#21015;&#34920;&#26368;&#21518;&#19968;&#20010;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="RPOPLPUSH source destination" ID="ID_1676232824" CREATED="1507888578681" MODIFIED="1507888657676"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#38500;&#21015;&#34920;&#30340;&#26368;&#21518;&#19968;&#20010;&#20803;&#32032;&#65292;&#24182;&#23558;&#35813;&#20803;&#32032;&#28155;&#21152;&#21040;&#21478;&#19968;&#20010;&#21015;&#34920;&#24182;&#36820;&#22238;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="RPUSH key value1 [value2 ...]" ID="ID_282386377" CREATED="1507888610480" MODIFIED="1507888658644"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;&#21015;&#34920;&#20013;&#28155;&#21152;&#19968;&#20010;&#25110;&#22810;&#20010;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="RPUSHX key value" ID="ID_899841837" CREATED="1507888639448" MODIFIED="1507888659612"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#20026;&#24050;&#23384;&#22312;&#30340;&#21015;&#34920;&#28155;&#21152;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="hash&#x8868;" FOLDED="true" ID="ID_1025928281" CREATED="1507889261274" MODIFIED="1507889283640">
<node TEXT="HDEL key field1 [field2 ...]" ID="ID_539521593" CREATED="1507889286371" MODIFIED="1507889603852"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21024;&#38500;&#19968;&#20010;&#25110;&#22810;&#20010;&#21704;&#24076;&#34920;&#23383;&#27573;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HEXISTS key field" ID="ID_539332956" CREATED="1507889314471" MODIFIED="1507889604732"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#26597;&#30475;&#21704;&#24076;&#34920; key &#20013;&#65292;&#25351;&#23450;&#30340;&#23383;&#27573;&#26159;&#21542;&#23384;&#22312;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HGET key field" ID="ID_1347428568" CREATED="1507889349807" MODIFIED="1507889606220"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#23384;&#20648;&#22312;&#21704;&#24076;&#34920;&#20013;&#25351;&#23450;&#23383;&#27573;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HGETALL key" ID="ID_1190946676" CREATED="1507889369398" MODIFIED="1507889607012"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#22312;&#21704;&#24076;&#34920;&#20013;&#25351;&#23450; key &#30340;&#25152;&#26377;&#23383;&#27573;&#21644;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HINCRBY key field increment" ID="ID_1294531600" CREATED="1507889386185" MODIFIED="1507889607693"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#20026;&#21704;&#24076;&#34920; key &#20013;&#30340;&#25351;&#23450;&#23383;&#27573;&#30340;&#25972;&#25968;&#20540;&#21152;&#19978;&#22686;&#37327; increment
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HINCRBYFLOAT key field incremnet" ID="ID_823819493" CREATED="1507889411894" MODIFIED="1507889609196"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#20026;&#21704;&#24076;&#34920; key &#20013;&#30340;&#25351;&#23450;&#23383;&#27573;&#30340;&#28014;&#28857;&#25968;&#20540;&#21152;&#19978;&#22686;&#37327; increment
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HKEYS key" ID="ID_1688063138" CREATED="1507889448239" MODIFIED="1507889610036"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#25152;&#26377;&#21704;&#24076;&#34920;&#20013;&#30340;&#23383;&#27573;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HLEN key" ID="ID_998679765" CREATED="1507889464418" MODIFIED="1507889610956"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#21704;&#24076;&#34920;&#20013;&#23383;&#27573;&#30340;&#25968;&#37327;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HMGET key field1 [field2 ...]" ID="ID_1572574012" CREATED="1507889482743" MODIFIED="1507889611932"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#25152;&#26377;&#32473;&#23450;&#23383;&#27573;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HMSET key field1 value1 [field2 value2 ...]" ID="ID_992364410" CREATED="1507889509065" MODIFIED="1507889612764"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21516;&#26102;&#23558;&#22810;&#20010; field-value (&#22495;-&#20540;)&#23545;&#35774;&#32622;&#21040;&#21704;&#24076;&#34920; key &#20013;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HSET key field value" ID="ID_1717638075" CREATED="1507889542319" MODIFIED="1507889613692"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#21704;&#24076;&#34920; key &#20013;&#30340;&#23383;&#27573; field &#30340;&#20540;&#35774;&#20026; value
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HSETNX key field value" ID="ID_1115552091" CREATED="1507889559319" MODIFIED="1507889614572"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21482;&#26377;&#22312;&#23383;&#27573; field &#19981;&#23384;&#22312;&#26102;&#65292;&#35774;&#32622;&#21704;&#24076;&#34920;&#23383;&#27573;&#30340;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="HVALS key" ID="ID_318643535" CREATED="1507889593585" MODIFIED="1507889615660"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#21704;&#24076;&#34920;&#20013;&#25152;&#26377;&#20540;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="&#x96c6;&#x5408;(set)" FOLDED="true" ID="ID_21868883" CREATED="1507890174945" MODIFIED="1507890191655">
<node TEXT="SADD key member1 [member2 ...]" ID="ID_190186495" CREATED="1507890193184" MODIFIED="1507890876215"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21521;&#38598;&#21512;&#28155;&#21152;&#19968;&#20010;&#25110;&#22810;&#20010;&#25104;&#21592;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SCARD key" ID="ID_1387954686" CREATED="1507890222032" MODIFIED="1507890877101"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#38598;&#21512;&#30340;&#25104;&#21592;&#25968;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SDIFF key1 [key2 ...]" ID="ID_22676225" CREATED="1507890237801" MODIFIED="1507890268569"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#32473;&#23450;&#25152;&#26377;&#38598;&#21512;&#30340;&#24046;&#38598;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SDIFFSTORE destination key1 [key2 ...]" ID="ID_1434268454" CREATED="1507890268782" MODIFIED="1507890304652"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#32473;&#23450;&#25152;&#26377;&#38598;&#21512;&#30340;&#24046;&#38598;&#24182;&#23384;&#20648;&#22312; destination &#20013;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SINTER key1 [key2 ...]" ID="ID_1715381563" CREATED="1507890316335" MODIFIED="1507890332203"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#32473;&#23450;&#25152;&#26377;&#38598;&#21512;&#30340;&#20132;&#38598;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SINTERSTORE destination key1 [key2 ...]" ID="ID_551702423" CREATED="1507890333399" MODIFIED="1507890696311"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#32473;&#23450;&#25152;&#26377;&#38598;&#21512;&#30340;&#20132;&#38598;&#24182;&#23384;&#20648;&#22312; destination &#20013;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SISMEMBER key member" ID="ID_1946020614" CREATED="1507890697280" MODIFIED="1507890710817"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#21028;&#26029; member &#20803;&#32032;&#26159;&#21542;&#26159;&#38598;&#21512; key &#30340;&#25104;&#21592;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SMEMNERS key" ID="ID_612198445" CREATED="1507890711472" MODIFIED="1507890731003"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#38598;&#21512;&#20013;&#30340;&#25152;&#26377;&#25104;&#21592;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SMOVE source destination member" ID="ID_680731369" CREATED="1507890739073" MODIFIED="1507890747507"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558; member &#20803;&#32032;&#20174; source &#38598;&#21512;&#31227;&#21160;&#21040; destination &#38598;&#21512;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SPOP key" ID="ID_544298959" CREATED="1507890756755" MODIFIED="1507890761558"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#38500;&#24182;&#36820;&#22238;&#38598;&#21512;&#20013;&#30340;&#19968;&#20010;&#38543;&#26426;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SRANDMEMBER key [count]" ID="ID_830760002" CREATED="1507890771342" MODIFIED="1507890781678"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#38598;&#21512;&#20013;&#19968;&#20010;&#25110;&#22810;&#20010;&#38543;&#26426;&#25968;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SREM key member1 [member2 ...]" ID="ID_1022667504" CREATED="1507890789953" MODIFIED="1507890805157"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31227;&#38500;&#38598;&#21512;&#20013;&#19968;&#20010;&#25110;&#22810;&#20010;&#25104;&#21592;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SUNION key1 [key2 ...]" ID="ID_76719623" CREATED="1507890810985" MODIFIED="1507890837740"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#25152;&#26377;&#32473;&#23450;&#38598;&#21512;&#30340;&#24182;&#38598;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SUNIONSTORE destination key1 [key2 ...]" ID="ID_1574347980" CREATED="1507890839184" MODIFIED="1507890850702"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#25152;&#26377;&#32473;&#23450;&#38598;&#21512;&#30340;&#24182;&#38598;&#23384;&#20648;&#22312; destination &#38598;&#21512;&#20013;
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="SSCAN key cursor [MATCH pattern] [COUNT count]" ID="ID_1450738397" CREATED="1507890851335" MODIFIED="1507890871203"><richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#36845;&#20195;&#38598;&#21512;&#20013;&#30340;&#20803;&#32032;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="&#x6709;&#x5e8f;&#x96c6;&#x5408;" ID="ID_1075388442" CREATED="1507891013817" MODIFIED="1507891043668"><richcontent TYPE="DETAILS" HIDDEN="true">

<html>
  <head>
    
  </head>
  <body>
    <p>
      &#31867;&#20284;&#38598;&#21512;&#65288;zadd...&#65289;
    </p>
  </body>
</html>

</richcontent>
</node>
</node>
<node TEXT="Redis&#x67b6;&#x6784;" POSITION="right" ID="ID_1359577243" CREATED="1507891050552" MODIFIED="1507891056558">
<edge COLOR="#00ffff"/>
<node TEXT="&#x4e3b;&#x4ece;&#x67b6;&#x6784;" ID="ID_749579673" CREATED="1507891108986" MODIFIED="1507891116182"/>
<node TEXT="&#x4e3b;&#x4ece;&#x67b6;&#x6784;&#x590d;&#x5236;&#x539f;&#x7406;" ID="ID_1279736712" CREATED="1507891127585" MODIFIED="1507891135681"/>
</node>
</node>
</map>
