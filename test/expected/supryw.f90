      SUBROUTINE SUPRYW
!
!     THIS ROUTINE YIELDS THE SUPERSONIC WING,WING-BODY
!     ROLLING DERIVATIVES,CLP AND CNP,AND
!     YAWING DERIVATIVE , CYP
!
      COMMON /OVERLY/ NLOG,NMACH,IM,NALPHA
      COMMON /CONSNT/ PI,DR,UNUSED,RAD
      COMMON /OPTION/ SR,CBARR,RUFF,BLREF
      COMMON /WINGD/  A(195)
      COMMON /WINGI/  WINGIN(77)
      COMMON /FLGTCD/ FLC(93)
      COMMON /POWR/   DYN(213)
      COMMON /SUPWH/  SLG(141)
      COMMON /IBW/    PBW,BW(380)
      COMMON /SYNTSS/ SYNA(19)
      COMMON /IWING/  PWING, WING(400)
      COMMON /FLOLOG/ FLTC,OPTI,BO,WGPL,WGSC,SYNT,HTPL,HTSC,VTPL,VTSC,&
     &                HEAD,PRPOWR,JETPOW,LOASRT,TVTPAN,&
     &                SUPERS,SUBSON,TRANSN,HYPERS,&
     &                SYMFP,ASYFP,TRIMC,TRIM
      LOGICAL FLTC,OPTI,BO,WGPL,WGSC,SYNT,HTPL,HTSC,VTPL,VTSC,&
     &        HEAD,PRPOWR,JETPOW,LOASRT,TVTPAN,&
     &        SUPERS,SUBSON,TRANSN,HYPERS,&
     &        SYMFP,ASYFP,TRIMC,TRIM
      INTEGER Y2225A,Y2225B,Y2225C,Y2225D,Y2225E,Y2110A,Y2110C,Y2110B,&
     & Y2314A,Y2314B,Y2314C,Y2314D,Y2317A,Y2317B,Y2317C,Y2317D
      REAL MACH,LAMLE,LAMDA
      DIMENSION ALSCHD(20),CYPWBH(20),CNPWBH(20),CYPWSP(20)
      DIMENSION ROUTID(2)
      DIMENSION X1225A(  7),X2225A( 17),Y2225A(  60),Q2225A(3)
      DIMENSION X1225B(  7),X2225B( 13),Y2225B(  46),Q2225B(3)
      DIMENSION X1225C(  7),X2225C( 13),Y2225C(  46),Q2225C(3)
      DIMENSION X1225D(  7),X2225D( 14),Y2225D(  49),Q2225D(3)
      DIMENSION X1225E(  7),X2225E( 17),Y2225E(  60),Q2225E(3)
      DIMENSION X1110A( 14),X2110A(  9),Y2110A(  63),Q2110A(3)
      DIMENSION X1110C(  5),X2110C(  5),Y2110C(  13),Q2110C(3)
      DIMENSION X1110B(  7),X2110B( 19),Y2110B(  67),Q2110B(3)
      DIMENSION X1314A( 10),X2314A( 14),Y2314A(  70),Q2314A(3)
      DIMENSION X1314B( 10),X2314B( 14),Y2314B(  70),Q2314B(3)
      DIMENSION X1314C( 10),X2314C( 13),Y2314C(  65),Q2314C(3)
      DIMENSION X1314D( 10),X2314D( 13),Y2314D(  65),Q2314D(3)
      DIMENSION X12316(  9),Y12316(  9),Q12316(3)
      DIMENSION X13170(  2),X23170(  4),Y23170(2)
      DIMENSION X1317A(  5),X2317A( 15),Y2317A(  38),Q2317A(3)
      DIMENSION X1317B(  5),X2317B( 13),Y2317B(  33),Q2317B(3)
      DIMENSION X1317C(  5),X2317C( 15),Y2317C(  38),Q2317C(3)
      DIMENSION X1317D(  5),X2317D( 14),Y2317D(  35),Q2317D(3)
      EQUIVALENCE(CNACNA,SLG(3)),(TANCO2,A(74)),(LAMLE,A(58)),(SW,A(4))&
     &          ,(XCG,SYNA(1)),(SSPNE,WINGIN(3)),(SSPN,WINGIN(4)),&
     &(AW,A(120)),(LAMDA,A(118)),(BETA,SLG(1)),(ALSCHD(1),FLC(23)),&
     &(TANLE,A(62))
      EQUIVALENCE(CLPWBH,WING(281)),(TRENS,DYN(204)),(CHENGE,DYN(205)),&
     &          (CYPA,DYN(206)),(CYPWSP(1),WING(301)),(CNPTAS,DYN(207)),&
     &           (CNPA1,DYN(208)),(CNPA2,DYN(209)),(CNPA3,DYN(210)),&
     &         (CNPA,DYN(211)),(CNPAE,DYN(212)),(CNPWBH(1),WING(321)),&
     &           (CNPBA,DYN(213)),(XW,SYNA(1)),(CR,WINGIN(6))
      DATA ROUTID/4HSUPR,4HYW  /
!
!      ----FIGURE 7.1.2.2-25A
!
      DATA Q2225A/4H7.1.,4H2.2-,4H25A /
      DATA X1225A/  .000E+00,  .100E+01,  .200E+01,  .300E+01,&
     &  .400E+01,  .500E+01,  .600E+01/
      DATA X2225A/ -.699E-01,  .100E+01,  .147E+01,  .203E+01,&
     &  .250E+01,  .291E+01,  .403E+01,  .445E+01,  .503E+01,  .541E+01,&
     &  .597E+01,  .646E+01,  .706E+01,  .797E+01,  .858E+01,  .909E+01,&
     &  .100E+02/
!
!      ----FIGURE 7.1.2.2-25B
!
      DATA Q2225B/4H7.1.,4H2.2-,4H25B /
      DATA X1225B/  .000E+00,  .100E+01,  .200E+01,  .300E+01,&
     &  .400E+01,  .500E+01,  .600E+01/
      DATA X2225B/  .296E-01,  .202E+01,  .279E+01,  .330E+01,&
     &  .428E+01,  .526E+01,  .571E+01,  .625E+01,             .697E+01,&
     &  .748E+01,  .805E+01,  .903E+01,  .100E+02/
!
!      ----FIGURE 7.1.2.2-25C
!
      DATA Q2225C/4H7.1.,4H2.2-,4H25C /
      DATA X1225C/  .000E+00,  .100E+01,  .200E+01,  .300E+01,&
     &  .400E+01,  .500E+01,  .600E+01/
      DATA X2225C/  .125E-01,  .199E+01,  .268E+01,  .332E+01,&
     &  .369E+01,  .433E+01,  .468E+01,  .539E+01,  .571E+01,  .668E+01,&
     &  .802E+01,  .903E+01,  .100E+02/
!
!      ----FIGURE 7.1.2.2-25D
!
      DATA Q2225D/4H7.1.,4H2.2-,4H25D /
      DATA X1225D/  .000E+00,  .100E+01,  .200E+01,  .300E+01,&
     &  .400E+01,  .500E+01,  .600E+01/
      DATA X2225D/  .140E-01,  .199E+01,  .224E+01,  .256E+01,&
     &  .275E+01,  .328E+01,  .371E+01,  .433E+01,  .502E+01,  .560E+01,&
     &  .698E+01,  .802E+01,  .901E+01,  .100E+02/
!
!      ----FIGURE 7.1.2.2-25E
!
      DATA Q2225E/4H7.1.,4H2.2-,4H25E /
      DATA X1225E/  .000E+00,  .100E+01,  .200E+01,  .300E+01,&
     &  .400E+01,  .500E+01,  .600E+01/
      DATA X2225E/  .180E-01,  .205E+01,  .217E+01,  .237E+01,&
     &  .258E+01,  .284E+01,  .302E+01,  .353E+01,  .402E+01,  .449E+01,&
     &  .504E+01,  .546E+01,  .602E+01,  .701E+01,  .803E+01,  .900E+01,&
     &  .100E+02/
!
!      ----FIGURE 7.1.2.1-10A
!
      DATA Q2110A/4H7.1.,4H2.1-,4H10A /
      DATA X1110A/  .100E+02,  .150E+02,  .200E+02,  .250E+02,&
     &  .300E+02,  .350E+02,  .400E+02,  .450E+02,  .500E+02,  .550E+02,&
     &  .600E+02,  .650E+02,  .700E+02,  .750E+02/
      DATA X2110A/  .134E+01,  .149E+01,  .160E+01,  .179E+01,&
     &  .200E+01,  .240E+01,  .297E+01,  .349E+01,  .399E+01/
!
!      ----FIGURE 7.1.2.1-10B
!
      DATA Q2110B/4H7.1.,4H2.1-,4H10B /
      DATA X1110B/  .100E+01,  .200E+01,  .300E+01,  .400E+01,&
     &  .800E+01,  .120E+02,  .200E+02/
      DATA X2110B/  .238E+00,  .550E+00,  .842E+00,  .127E+01,&
     &  .216E+01,  .282E+01,  .325E+01,  .398E+01,  .430E+01,  .464E+01,&
     &  .498E+01,  .543E+01,  .596E+01,  .694E+01,  .795E+01,  .901E+01,&
     &  .999E+01,  .110E+02,  .120E+02/
!
!      ----FIGURE 7.1.2.1-10C
!
      DATA Q2110C/4H7.1.,4H2.1-,4H10C /
      DATA X1110C/  .000E+00,  .250E+00,  .500E+00,  .750E+00,&
     &  .100E+01/
      DATA X2110C/ -.600E+01, -.243E+01, -.197E+01, -.102E+01,&
     &  .000E+00/
!
!      ----FIGURE 7.1.2.3-14A
!
      DATA Q2314A/4H7.1.,4H2.3-,4H14A /
      DATA X1314A/  .200E+01,  .300E+01,  .400E+01,  .500E+01,&
     &  .600E+01,  .700E+01,  .800E+01,  .100E+02,  .150E+02,  .200E+02/
      DATA X2314A/  .323E+00,  .399E+00,  .451E+00,  .493E+00,&
     &  .527E+00,  .537E+00,  .553E+00,  .584E+00,  .631E+00,  .651E+00,&
     &  .700E+00,  .802E+00,  .902E+00,  .100E+01/
!
!      ----FIGURE 7.1.2.3-14B
!
      DATA Q2314B/4H7.1.,4H2.3-,4H14B /
      DATA X1314B/  .200E+01,  .300E+01,  .400E+01,  .500E+01,&
     &  .600E+01,  .700E+01,  .800E+01,  .100E+02,  .150E+02,  .200E+02/
      DATA X2314B/  .326E+00,  .393E+00,  .443E+00,  .478E+00,&
     &  .502E+00,  .519E+00,  .552E+00,  .569E+00,  .616E+00,  .647E+00,&
     &  .700E+00,  .799E+00,  .900E+00,  .100E+01/
!
!      ----FIGURE 7.1.2.3-14C
!
      DATA Q2314C/4H7.1.,4H2.3-,4H14C /
      DATA X1314C/  .200E+01,  .300E+01,  .400E+01,  .500E+01,&
     &  .600E+01,  .700E+01,  .800E+01,  .100E+02,  .150E+02,  .200E+02/
      DATA X2314C/  .369E+00,  .444E+00,  .492E+00,  .532E+00,&
     &  .563E+00,  .585E+00,  .615E+00,  .641E+00,  .675E+00,  .747E+00,&
     &  .795E+00,  .898E+00,  .100E+01/
!
!      ----FIGURE 7.1.2.3-14D
!
      DATA Q2314D/4H7.1.,4H2.3-,4H14D /
      DATA X1314D/  .200E+01,  .300E+01,  .400E+01,  .500E+01,&
     &  .600E+01,  .700E+01,  .800E+01,  .100E+02,  .150E+02,  .200E+02/
      DATA X2314D/  .401E+00,  .492E+00,  .546E+00,  .589E+00,&
     &  .611E+00,  .639E+00,  .666E+00,  .693E+00,  .731E+00,  .753E+00,&
     &  .804E+00,  .902E+00,  .100E+01/
!
!      ----FIGURE 7.1.2.3-16
!
      DATA Q12316/4H7.1.,4H2.3-,4H16  /
      DATA I22316 /9/
      DATA X12316/  .301E+00,  .498E+00,  .750E+00,  .846E+00,&
     &  .922E+00,  .949E+00,  .974E+00,  .987E+00,  .997E+00/
      DATA Y12316/ -.168E+00, -.135E+00, -.851E-01, -.626E-01,&
     & -.385E-01, -.293E-01, -.190E-01, -.115E-01, -.575E-03/
!
!      ----FIGURE 7.1.2.3-17A
!
      DATA Q2317A/4H7.1.,4H2.3-,4H17A /
      DATA X1317A/  .200E+01,  .300E+01,  .400E+01,  .800E+01,&
     &  .120E+02/
      DATA X2317A/  .100E+01,  .115E+01,  .125E+01,  .138E+01,&
     &  .153E+01,  .175E+01,  .201E+01,  .249E+01,  .301E+01,  .351E+01,&
     &  .397E+01,  .449E+01,  .549E+01,  .648E+01,  .698E+01/
!
!      ----FIGURE 7.1.2.3-17B
!
      DATA Q2317B/4H7.1.,4H2.3-,4H17B /
      DATA X1317B/  .200E+01,  .300E+01,  .400E+01,  .800E+01,&
     &  .120E+02/
      DATA X2317B/  .101E+01,  .127E+01,  .150E+01,  .167E+01,&
     &  .184E+01,  .202E+01,  .253E+01,  .303E+01,  .352E+01,  .403E+01,&
     &  .502E+01,  .603E+01,  .700E+01/
!
!      ----FIGURE 7.1.2.3-17C
!
      DATA Q2317C/4H7.1.,4H2.3-,4H17C /
      DATA X1317C/  .200E+01,  .300E+01,  .400E+01,  .800E+01,&
     &  .120E+02/
      DATA X2317C/  .100E+01,  .113E+01,  .131E+01,  .150E+01,&
     &  .164E+01,  .181E+01,  .198E+01,  .220E+01,  .250E+01,  .299E+01,&
     &  .347E+01,  .398E+01,  .496E+01,  .597E+01,  .693E+01/
!
!      ----FIGURE 7.1.2.3-17D
!
      DATA Q2317D/4H7.1.,4H2.3-,4H17D /
      DATA X1317D/  .200E+01,  .300E+01,  .400E+01,  .800E+01,&
     &  .120E+02/
      DATA X2317D/  .100E+01,  .110E+01,  .125E+01,  .136E+01,&
     &  .149E+01,  .174E+01,  .200E+01,  .251E+01,  .303E+01,  .351E+01,&
     &  .400E+01,  .501E+01,  .603E+01,  .699E+01/
!
!        IN THE FOLLOWING DATA STATEMENTS 2 FLOATING POINT NUMBERS,WITH
!        3 SIGNIFICANT DIGITS EACH,ARE PACKED IN 1 FIXED POINT WORD.
!
!        THE FORMAT IS AS FOLLOWS-
!
!        SIGN1,NS2,NSPS,NP1,NP2,ND1,ND2
!
!        WHERE-
!
!        SIGN1 IS THE ACTUAL SIGN OF THE 1ST NUMBER
!        NS2   REPRESENTS THE SIGN OF THE 2ND NUMBER.0 IF + , 1 IF -
!        NSPS  REPRESENTS THE SIGNS OF THE POWERS OF 10 FOR BOTH NUMBERS
!             0 IF ++ , 1 IF -- , 2 IF +- , 3 IF -+
!        NP1   IS THE POWER OF 10 FOR THE 1ST NUMBER. LIMITED TO 1 DIGIT
!        NP2   IS THE POWER OF 10 FOR THE 2ND NUMBER. LIMITED TO 1 DIGIT
!        ND1  3 DIGITS OF THE 1ST NUMBER (DECIMAL POINT AT END)
!        ND2  3 DIGITS OF THE 2ND NUMBER (DECIMAL POINT AT END)
!
      DATA Y2225A/-1143985102,-1133105107,-1134109960,-1144760690,&
     &-1144620570,-1144530490,-1144460410,-1144390370,-1144330990,&
     &-1143990100,-1133101101,-1144990760,-1144710630,-1144580540,&
     &-1144510470,-1144420400,-1144380340,-1144990960,-1144940930,&
     &-1144910890,-1144830750,-1144670610,-1144560520,-1144490430,&
     &-1144410390,-1144350860,-1144830820,-1144810810,-1144800760,&
     &-1144750730,-1144660600,-1144560510,-1144440420,-1144400350,&
     &-1144750740,-1144740730,-1144730730,-1144710710,-1144690680,&
     &-1144650590,-1144540460,-1144440410,-1144360670,-1144670670,&
     &-1144670680,-1144680670,-1144660650,-1144640630,-1144620600,&
     &-1144510460,-1144430380,-1144580590,-1144590600,-1144610620,&
     &-1144630620,-1144620610,-1144600590,-1144580560,-1144500460,&
     & -340410000/
      DATA Y2225B/-1143988134,-1133123114,-1144938780,-1144725671,&
     &-1144615576,-1144541485,-1144441988,-1133124119,-1134113954,&
     &-1144806743,-1144681623,-1144588551,-1144488445,-1143987113,&
     &-1133111110,-1144969827,-1144771701,-1144632594,-1144557495,&
     &-1144448928,-1133102102,-1134101967,-1144857802,-1144741660,&
     &-1144622578,-1144514461,-1144839906,-1144938933,-1144903876,&
     &-1144825776,-1144697650,-1144601544,-1144487771,-1144791824,&
     &-1144843862,-1144828815,-1144797737,-1144690640,-1144565505,&
     &-1144691708,-1144732747,-1144780787,-1144778764,-1144738713,&
     &-1144674602, -340533000/
      DATA Y2225C/-1143987137,-1133127116,-1133111100,-1144944855,&
     &-1144809713,-1144615562,-1144511982,-1133131124,-1133116110,&
     &-1134100944,-1144853814,-1144720619,-1144563511,-1143982119,&
     &-1133118112,-1133109102,-1144976883,-1144839734,-1144628566,&
     &-1144516943,-1133107109,-1133108107,-1134102974,-1144901860,&
     &-1144761640,-1144576523,-1144877935,-1144968999,-1144991974,&
     &-1144972913,-1144880791,-1144677605,-1144546820,-1144827854,&
     &-1144878891,-1144913904,-1144886880,-1144809700,-1144633566,&
     &-1144738726,-1144749773,-1144786809,-1144826850,-1144844830,&
     &-1144730656, -340594000/
      DATA Y2225D/-1143985141,-1133136132,-1133128119,-1133112103,&
     &-1144940869,-1144731654,-1144592541,-1143985131,-1133128125,&
     &-1133123117,-1133111105,-1144953871,-1144735654,-1144592541,&
     &-1143985117,-1133120120,-1133119114,-1133109104,-1144952887,&
     &-1144747666,-1144599544,-1143953103,-1133104106,-1133106110,&
     &-1133107103,-1144966906,-1144767687,-1144617566,-1144893908,&
     &-1144938958,-1144968985,-1143998101,-1144975917,-1144800723,&
     &-1144651578,-1144822803,-1144824843,-1144857889,-1144911929,&
     &-1144938917,-1144820741,-1144671594,-1144760724,-1144735757,&
     &-1144770804,-1144831846,-1144864871,-1144819755,-1144685615/
      DATA Y2225E/-1143988129,-1133129130,-1133129128,-1133125117,&
     &-1133110102,-1144960910,-1144850760,-1144680620,-1144570980,&
     &-1133125126,-1133126126,-1133125123,-1133117109,-1134103960,&
     &-1144910850,-1144760680,-1144630570,-1143990113,-1133116118,&
     &-1133118118,-1133118115,-1133109105,-1144980930,-1144870780,&
     &-1144700640,-1144580960,-1133104105,-1133107109,-1133112114,&
     &-1133112108,-1134104990,-1144940890,-1144790720,-1144650600,&
     &-1144900930,-1144930950,-1144970980,-1144000102,-1133104102,&
     &-1144980940,-1144900820,-1144730670,-1144610840,-1144820830,&
     &-1144850860,-1144880890,-1144920940,-1144960960,-1144950920,&
     &-1144820750,-1144680630,-1144770730,-1144740750,-1144770780,&
     &-1144790820,-1144850860,-1144880890,-1144900850,-1144770710,&
     & -340650000/
      DATA Y2110A/  111106130,  111148177,  111211274,  111364445,&
     &  112525828,  121994112,  111134162,  111223327,  111438563,&
     &  122706802,  121879100,  111115142,  111179209,  112237582,&
     &  122661713,  122817930,  111115144,  111168189,  122508572,&
     &  122628699,  122787958,  111118137,  112155445,  122498552,&
     &  122618695,  122824999,  111116130,  122410452,  122491540,&
     &  122602713,  122861997,  112112330,  122408429,  122485533,&
     &  122637755,  122868969,  122262342,  122399436,  122485565,&
     &  122669757,  122855209,  122272314,  122395436,  122503587,&
     &  122665731,  122140215,  122260338,  122398450,  122525588,&
     &  123651831,  122136166,  122228288,  122392452,  122505560,&
     &  133466831,  122108150,  122196291,  122388445,  123487464,&
     &  133531715,  132877125,  122192271,  122344413/
      DATA Y2110B/  122439402,  122374346,  122310295,  122278249,&
     &  122230218,  122199189,  122184161,  122152147,  122145136,&
     &  122138599,  122532489,  122425344,  122306285,  122249228,&
     &  122202190,  122172157,  122145138,  122127118,  122115113,&
     &  122728659,  122599519,  122384335,  122304247,  122219188,&
     &  122160136,  122121111,  133976951,  133974909,  132771910,&
     &  122804715,  122600426,  122351320,  122252199,  122158133,&
     &  122117107,  133821749,  133679679,  133680679,  122778767,&
     &  122751716,  122601478,  122380249,  122190135,  123111797,&
     &  133625482,  133409385,  133363363,  132318951,  122938919,&
     &  122877741,  122596481,  122251164,  123116790,  133517433,&
     &  133388364,  133340317,  133318295,  111346307,  111272224,&
     &  112140889,  122612244,  123123675,  133449356,  133185206,&
     &  133138114,  133136137,  330136000/
      DATA Y2110C/  124358230,  340230000,  142230505,  122145106,&
     &  134413230,  122610248,  122209106,  142230677,  122324285,&
     &  124161230,  122728367,  122326220,  340230000/
      DATA Y2314A/-1133828841,-1133849855,-1133858858,-1133859862,&
     &-1133866866,-1133867869,-1133869870,-1133818817,-1133819824,&
     &-1133826824,-1133825826,-1133826826,-1133825817,-1133813805,&
     &-1133808808,-1133808808,-1133808806,-1133807806,-1133806805,&
     &-1133800793,-1133783772,-1133767788,-1133796799,-1133798796,&
     &-1133796796,-1133793791,-1133786776,-1133765753,-1133666739,&
     &-1133770784,-1133788790,-1133790788,-1133785785,-1133779767,&
     &-1133754742,-1133797793,-1133790788,-1133787787,-1133785784,&
     &-1133779776,-1133772761,-1133746733,-1133799796,-1133792789,&
     &-1133786785,-1133784780,-1133775774,-1133767754,-1133741723,&
     &-1133826809,-1133798790,-1133784783,-1133780775,-1133769766,&
     &-1133759745,-1133732714,-1133847821,-1133806794,-1133785783,&
     &-1133779772,-1133762758,-1133751736,-1133721702,-1133824805,&
     &-1133793783,-1133776774,-1133771765,-1133756753,-1133745730,&
     &-1133713697/
      DATA Y2314B/-1122138141,-1122143144,-1122145145,-1122147147,&
     &-1122149149,-1122151153,-1122155157,-1122137136,-1122137138,&
     &-1122138139,-1122139139,-1122140140,-1122141141,-1122141142,&
     &-1122133134,-1122134135,-1122134135,-1122135135,-1122136136,&
     &-1122136136,-1122135135,-1122133133,-1122132132,-1122133133,&
     &-1122133133,-1122133132,-1122132132,-1122132130,-1122126130,&
     &-1122131132,-1122132132,-1122132131,-1122131131,-1122131130,&
     &-1122129127,-1122140135,-1122133131,-1122131131,-1122130130,&
     &-1122130130,-1122129128,-1122126126,-1122127129,-1122129130,&
     &-1122130130,-1122130129,-1122129128,-1122128127,-1122126124,&
     &-1122121125,-1122126127,-1122128128,-1122128128,-1122128127,&
     &-1122126125,-1122123122,-1122118122,-1122124125,-1122126126,&
     &-1122126126,-1122126126,-1122124123,-1122121119,-1122124124,&
     &-1122125125,-1122125125,-1122125125,-1122124124,-1122123122,&
     &-1122119117/
      DATA Y2314C/-1122189195,-1122198201,-1122202204,-1122206206,&
     &-1122209213,-1122215220,-1122225177,-1122185187,-1122188188,&
     &-1122189190,-1122191192,-1122193195,-1122196199,-1122171178,&
     &-1122181182,-1122182182,-1122182183,-1122183184,-1122185186,&
     &-1122186178,-1122178178,-1122178178,-1122178178,-1122178178,&
     &-1122178178,-1122178178,-1122163169,-1122172174,-1122174174,&
     &-1122174174,-1122174174,-1122173173,-1122172185,-1122179176,&
     &-1122175174,-1122173173,-1122173173,-1122172172,-1122169168,&
     &-1122146158,-1122163167,-1122168169,-1122170170,-1122169169,&
     &-1122168167,-1122165144,-1122156161,-1122164166,-1122167168,&
     &-1122168168,-1122167166,-1122164162,-1122139150,-1122155159,&
     &-1122161162,-1122163164,-1122164163,-1122162159,-1122156201,&
     &-1122188181,-1122177173,-1122171168,-1122166164,-1122160159,&
     &-1122156154/
      DATA Y2314D/-1122228237,-1122242245,-1122247249,-1122252254,&
     &-1122256258,-1122262269,-1122276210,-1122221225,-1122226227,&
     &-1122229229,-1122230233,-1122233234,-1122238242,-1122211215,&
     &-1122216217,-1122217218,-1122219219,-1122220220,-1122220223,&
     &-1122223206,-1122208209,-1122210211,-1122211211,-1122211211,&
     &-1122212212,-1122212213,-1122208207,-1122207207,-1122207207,&
     &-1122207207,-1122207207,-1122207206,-1122205203,-1122203203,&
     &-1122202202,-1122204204,-1122203203,-1122203202,-1122201200,&
     &-1122202202,-1122202202,-1122202201,-1122201201,-1122201201,&
     &-1122200198,-1122196176,-1122186191,-1122194195,-1122196196,&
     &-1122197197,-1122197196,-1122194191,-1122145167,-1122176182,&
     &-1122185187,-1122189190,-1122191191,-1122190187,-1122183173,&
     &-1122180183,-1122185186,-1122187187,-1122188188,-1122188187,&
     &-1122183181/
      DATA Y2317A/-1133142138,-1133130121,-1134113991,-1144879753,&
     &-1144692655,-1144625609,-1144580559,-1144552943,-1144881812,&
     &-1144672580,-1144475431,-1144371338,-1144317297,-1144288278,&
     &-1144258256,-1144696641,-1144534411,-1144349288,-1144250211,&
     &-1144187178,-1144174167,-1144151150,-1144148354,-1144249182,&
     &-1144130104,-1155776710,-1155639593,-1155572459,-1155412365,&
     &-1155342342,-1144214123,-1155900662,-1155525365,-1155343320,&
     &-1155274274,-1155252229,-1155205205, -350205000/
      DATA Y2317B/-1133410391,-1133366353,-1133340326,-1133302281,&
     &-1133267262,-1133248240,-1133233267,-1133247215,-1133197181,&
     &-1133175156,-1133140134,-1133126120,-1133119115,-1133198175,&
     &-1133143123,-1133108103,-1144904847,-1144810751,-1144678663,&
     &-1143659102,-1144668473,-1144368329,-1144318281,-1144267231,&
     &-1144206202,-1144163159,-1144660362,-1144221184,-1144159147,&
     &-1144134131,-1144118116,-1144111107, -340102000/
      DATA Y2317C/-1133681675,-1133659642,-1133624608,-1133591577,&
     &-1133562537,-1133521509,-1133490480,-1133469455,-1133434413,&
     &-1133387371,-1133354341,-1133319301,-1133279265,-1133257244,&
     &-1133239229,-1133330321,-1133296275,-1133258239,-1133220200,&
     &-1133183166,-1133158151,-1133147138,-1133135159,-1133143111,&
     &-1144869740,-1144667597,-1144538511,-1144455406,-1144392388,&
     &-1144385371,-1134114888,-1144571374,-1144322307,-1144278278,&
     &-1144198187,-1144186172,-1144191188, -340207000/
      DATA Y2317D/-1133932927,-1133914898,-1133889860,-1133836807,&
     &-1133778754,-1133743717,-1133707690,-1133612602,-1133576568,&
     &-1133550529,-1133495457,-1133425406,-1133389379,-1133360357,&
     &-1133460449,-1133424413,-1133382348,-1133319283,-1133266247,&
     &-1133241227,-1133214211,-1133234209,-1133179162,-1133134121,&
     &-1134101918,-1144849702,-1144686654,-1144645636,-1133177118,&
     &-1144927838,-1144648592,-1144524394,-1144398339,-1144323314,&
     &-1144305295/
      DATA X13170/2.,12./,X23170/0.,7.,0.,7./,Y23170/0.,0./
!
      MACH=FLC(IM+2)
      COTLE=1./TANLE
      IF(WGPL.AND.(.NOT.BO))GO TO 1000
      DB=(SSPN-SSPNE)/SSPN
      IF(DB.GT.0.3)RETURN
 1000 ASTAN2=AW*TANCO2
      BAW=BETA*AW
!     ---SUPER WING,WING-BODY ROLLING  DERIVATIVE,CLP---
!
!              FIGURE 7.1.2.2-25 A-E
      CALL INTEP3(ASTAN2,BAW,LAMDA,X1225A,X2225A,Y2225A,7,17,Q2225A,&
!
     &X1225B,X2225B,Y2225B,7,13,Q2225B,&
     &            X1225C,X2225C,Y2225C,7,13,Q2225C,&
     &            X1225D,X2225D,Y2225D,7,14,Q2225D,&
     &            X1225E,X2225E,Y2225E,7,17,Q2225E,CLPA)
      SAVE=4.*SW*SSPN**2/(RAD*SR*BLREF**2)
      CLPWBH=CLPA*CNACNA*SAVE*AW
!
!     ---SUPER WING,WING-BODY YAWING DERIVATIVE,CYP---
!           -- FIGURE 7.1.2.1-10 --
!
      CALL TLIP2X(X1110A,X2110A,Y2110A,14, 9,LAMLE,MACH,TRENS,2,1,2,1,&
     &            Q2110A,3,ROUTID)
      CALL TLIP2X(X1110B,X2110B,Y2110B,7,19,BAW,TRENS,CHENGE,2,1,2,1,&
     &            Q2110B,3,ROUTID)
      CHENGE=-CHENGE
      CALL TLIP2X(X1110C,X2110C,Y2110C,5,5,LAMDA,CHENGE,CYPA,1,1,2,1,&
     &            Q2110C,3,ROUTID)
      TEMP=CYPA*SW*SSPN/(SR*BLREF*1641.645)
      DO 1010 I=1,NALPHA
         CYPWSP(I)=TEMP*ALSCHD(I)
 1010 CONTINUE
!
!     ----SUPER WING,WING-BODY ROLLING DERIVATIVE,CNP---
!
      BCOTLE=BETA*COTLE
      IF(BCOTLE.GE.1.)GO TO 1030
!
!              FIGURE 7.1.2.3-14 A-D
!
      CALL INTEP3( BAW, BCOTLE, LAMDA, 0, 0, 0, 1, 1, 0&
     &            ,X1314A,X2314A,Y2314A,10,14,Q2314A&
     &            ,X1314B,X2314B,Y2314B,10,14,Q2314B&
     &            ,X1314C,X2314C,Y2314C,10,13,Q2314C&
     &            ,X1314D,X2314D,Y2314D,10,13,Q2314D,CNPTAS)
      CNPA1 =CNPTAS*TANLE
!
!           -- FIGURE 7.1.2.3-16 --
!
      CALL INTERX(1,X12316,BCOTLE,I22316,Y12316,CNPAAS,9,9,1,0,0,0,1,&
     &            0,0,0,Q12316,3,ROUTID)
      CNPA2=CNPAAS*AW
      CNPA3=CNPAAS*AW*TANLE**2
      CNPA=CNPA1+CNPA2+CNPA3
      CNAPE=SAVE*(CNPA+CYPA*(XCG-XW)/CR*AW*(1.+LAMDA))
      DO 1020 I=1,NALPHA
 1020 CNPWBH(I)=(CNPAE-CLPWBH)*ALSCHD(I)/RAD
      GO TO 1050
 1030 CONTINUE
!
!              FIGURE 7.1.2.3-17 A-D
!
      CALL INTEP3( BAW, BCOTLE, LAMDA, 0, 0, 0, 1, 1, 0,&
     &             X1317A,X2317A,Y2317A,5,15,Q2317A,&
     &             X1317B,X2317B,Y2317B,5,13,Q2317B,&
     &             X1317C,X2317C,Y2317C,5,15,Q2317C,&
     &             X1317D,X2317D,Y2317D,5,14,Q2317D,CNPBA)
      AAAAA=BETA*CNPBA
      BBBBB=2.*XCG/(BLREF*AW*(1.+LAMDA))-.5*TANLE
      CCCCC=(AAAAA+BBBBB*CYPA*BLREF/(2.*SSPN))*SAVE
      DO 1040 I=1,NALPHA
         CNPWBH(I)=(CCCCC-CLPWBH)*ALSCHD(I)/RAD
 1040 CONTINUE
 1050 CONTINUE
      RETURN
      END