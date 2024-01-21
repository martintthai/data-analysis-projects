MartinThai

DataAnalyticsProject:Danny’sDiner
Inthisproject,IuseDannyMa’scasestudyhere.ThankyouDannyandifyouare

interestedinmorecasestudies,IsuggestyougivehimafollowonLinkedIn.Inthis

project,wewillbeusingSQL,specificallyMySqlinVSCodetoanalyzetherelevant

datasets.

Introduction:

Inthiscasestudy,ItakealookatthedatagatheredbyDanny’sDiner,aJapanese

restaurantthatsellsramen,sushi,andcurry,inthesolemonthofJanuary.Thegoalof

thisprojectistosimulateanalyzingdatafromarealworldrestaurant(by

understandingvisitingpatterns,moneyspent,andpopularitems)andtousethisdata

toincreasesalesandcustomersatisfaction.TheproblemathandinDanny’sDineris

thatthedinerwantstoseeiftheyshouldexpandtheirexistingcustomerloyalty

programorsimplyresume/cutito.

WhatIdidinanutshell:

LeveragedMySQLandvariousaggregate/joifunctionstoanalyzecustomer
data,extractactionableinsightsonvisitingpatterns,customerspending
habits,andmenufavorites,optimizemenuoerings,andmaximize
profitability
Evaluatedtheeectivenessoftherestaurant’sloyaltyprogramusing
data-drivenanalyses,providingkeyrecommendationsforitsexpansion,
influencingstrategicdecisionsanddrivingrevenuegrowthforthe
establishment
Datasets:

Thereare 3 datasetsthatIwillbeusing:

sales
menu
members
Belowisthe EntityRelationshipDiagram :

Table1:sales

Thesalestablecontainscustomer_id,order_date,andproduct_id(referstowhat

menuitemwasordered).

Table2:menu

Themenutablehasproduct_id,product_name,andprice.

Table3:members

Thememberstablehascustomer_id,andjoin_date(thedatewhenthecustomer

joinedtheloyaltyprogram).

QuestionstoAnswer:

1.Whatisthetotalamounteachcustomerspentattherestaurant?

IusedGROUPBYandSUMfunctionstofindouthowmucheachcustomerspentatthe

restaurant.Inaddition,IusedJOINtorelatethesalesandmenutables.

SELECT sales.customer_id, SUM(menu.price) AS total_amt_spent
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
GROUP BY sales.customer_id

QueryResult:
Answer:

● CustomerAspent$76.
● CustomerBspent$74.
● CustomerCspent$36.
2.Howmanydayshaseachcustomervisitedtherestaurant?

IusedGROUPBYandCOUNTtofindouthowmanydayseachcustomercametothe

diner.

SELECT customer_id, COUNT(DISTINCT(order_date)) AS days_visited
FROM martintthai.sales sales
GROUP BY customer_id

QueryResult:
Answer:
● CustomerAvisited 4 times.
● CustomerBvisited 6 times.
● CustomerCvisited 2 times.

3.Whatwasthefirstitemonthemenupurchasedbyeachcustomer?
IusedGROUPBYandMIN(order_date)->(thischoosestheearliestdate)tofindthe
firstitempurchasedbyeachcustomer.

QueryResult:
Answer:
● CustomerAfirstorderedsushi.
● CustomerBfirstorderedcurry.
● CustomerCfirstorderedramen.

4.Whatisthemostpurchaseditemonthemenuandhowmanytimeswasit
purchasedbyallcustomers?
IusedGROUPBYproduct_nameandCOUNTtofindouthowmanytimeseachitem
waspurchased.IalsousedJOINonsalesandmenu.
SELECT product_name, COUNT(product_name) AS times_purchased
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
GROUP BY product_name

QueryResult:
Answer:
● Ramenwasthemostpurchaseditem(8times).

5.Whichitemwasthemostpopularforeachcustomer?
IdidthesameasabovebutinsteadofGROUPBYjustproduct_name,Ialsogroupedby
customer_id.
SELECT customer_id, product_name, COUNT(product_name) AS times_purchased
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
GROUP BY customer_id, product_name
ORDER BY times_purchased DESC

QueryResult:
Answer:
● CustomerA’smostpopularitemwasramen.
● CustomerB’smostpopularitemwasatiebetweencurry,sushi,andramen.
● CustomerC’smostpopularitemwasramen.

6.Whichitemwaspurchasedfirstbyeachcustomeraftertheybecameamember?
IusedJOINtwicetorelatesales,menu,andmembersasweneededallofthedataon
everytable.Ididorder_date-join_datetofindthetimepasseduntiltheirfirst

purchase.IthenfilteredusingWHEREtoonlydisplaytherowswherejoin_dateis
beforetheorder_datetoonlyseeordersAFTERtheybecameamember.
SELECT *, order_date-join_date AS time_passed_til_first_purchase
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
JOIN martintthai.members members ON sales.customer_id =
members.customer_id
WHERE join_date < order_date
ORDER BY time_passed_til_first_purchase ASC

QueryResult:
Answer:
● CustomerA’sfirstpurchasesincemembershipisramen.
● CustomerB’sfirstpurchasesincemembershipissushi.
● CustomerCisnotamember.

7.Whichitemwaspurchasedjustbeforethecustomerbecameamember?
IdidthesameasthepreviousqueryexceptIfilteredtoonlyselectrowswhere
join_datewasafterorder_datetoonlyseeordersthatcamebeforetheywerea

member.Ialsodidjoin_date-order_datetofindthetimepasseduntileachcustomer
becameamember.
SELECT *, join_date - order_date AS time_passed_til_became_member
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
JOIN martintthai.members members ON sales.customer_id =
members.customer_id
WHERE join_date > order_date
ORDER BY time_passed_til_became_member ASC

QueryResult:
Answer:
● CustomerAlastorderedsushiandcurrybeforetheybecameamember.
● CustomerBlastorderedsushibeforetheybecameamember.
● CustomerCisnotamember.

8.Whatisthetotalitemsandamountspentforeachmemberbeforetheybecamea
member?

IusedJOINtorelateallthetables.IfilteredusingWHEREtoonlyfindordersthat
occurredbeforemembership.IalsousedGROUPBY,COUNT,andSUM(twodierent
queriesforCOUNT(totalitems)andSUM(amountspent)).
SELECT sales.customer_id, COUNT(sales.product_id) AS total_items_bought
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
JOIN martintthai.members members ON sales.customer_id =
members.customer_id
WHERE join_date > order_date
GROUP BY sales.customer_id

QueryResult:
SELECT sales.customer_id, SUM(menu.price) AS total_amt_spent
FROM martintthai.sales sales
JOIN martintthai.menu menu ON sales.product_id = menu.product_id
JOIN martintthai.members members ON sales.customer_id =
members.customer_id
WHERE join_date > order_date
GROUP BY sales.customer_id

QueryResult:
Answer:
● CustomerAbought 2 itemsandspent$25beforetheybecameamember.
● CustomerBbought 3 itemsandspent$40beforetheybecameamember.

9.Ifeach$1spentequatesto 10 pointsandsushihasa2xpointsmultiplier-how
manypointswouldeachcustomerhave?
IusedLEFTJOINtorelatesales,members,andmenuandusedCASEWHENtoconvert
pricetopoints.IthenusedGROUPBYandSUMtofindoutthetotalpointsofeach
customer.

FortheCASEWHENstatement,whenproduct_id= 1 (whichissushi)thenthetotal
pointsisprice* 2 * 10 (becauseeachdollarisworth 10 pointsandsushipointsare
doubled).Therestoftheproductids(2and3)arejustprice*10.
SELECT sales.customer_id,
SUM(CASE WHEN sales.product_id = 1 THEN price * 20
WHEN sales.product_id = 2 THEN price * 10
WHEN sales.product_id = 3 THEN price * 10
END) AStotal_points
FROM martintthai.sales sales
LEFT JOIN martintthai.members members ON sales.customer_id =
members.customer_id
LEFT JOIN martintthai.menu menu ON sales.product_id = menu.product_id
GROUP BY sales.customer_id

QueryResult:
Answer:
● CustomerAhas 860 totalpoints.
● CustomerBhas 940 totalpoints.
● CustomerChas 360 totalpoints.

10.Inthefirstweekafteracustomerjoinstheprogram(includingtheirjoindate)
theyearn2xpointsonallitems,notjustsushi-howmanypointsdocustomerAand
BhaveattheendofJanuary?
Step1.Ifirstcreatedatemporarytablewithallthedataincludinganewcolumn
(end_double_pts_week)whichfindsthelastdaywherethedoublepointsinterval
applies.
Step2.IthenusedthistableandaCASEWHENstatementtodoubleallpointson
ordersbetweenjoin_dateandend_double_pts_week.Ifthepurchasewasn’tinthis
timeinterval,thenapplythedoublepointsonlyifitissushi.
Step3.IusedGROUPBYtogroupbycustomerandfilteredusingWHEREtoonlyselect
ordersinthemonthofJanuary.
WITH sales_with_membership_wk AS
(SELECT sales.customer_id,
sales.order_date,

members.join_date,
DATE_ADD(join_date, INTERVAL 6 DAY) AS end_double_pts_week,
menu.product_name,
menu.price
FROM martintthai.sales sales
JOIN martintthai.menu menu ONsales.product_id = menu.product_id
JOIN martintthai.members members ON sales.customer_id =
members.customer_id)

SELECT ,
SUM(CASE WHEN order_date BETWEEN join_date AND end_double_pts_week THEN
price * 20
WHEN (order_date NOT BETWEEN join_date AND end_double_pts_week) AND
product_name = 'sushi' THEN price * 20
ELSE price 10
END) points
FROM sales_with_membership_wk
WHERE order_date < '2021-02-01'
GROUP BY customer_id

QueryResult:
Answer:
● CustomerAhas 1370 totalpoints.
● CustomerBhas 820 totalpoints

ConclusionsandFinalThoughts:

CustomerAandCustomerBspentthemostamountofmoneyatthediner,both
spendingmorethanCustomerC.CustomerAandBarealsomembersofthe
loyaltyprogram,whichisagoodsignthattheloyaltyprogramisbringingin
morerevenue.
ThemostfrequentvisitorisCustomerB(6times).
Themostpopularitembyfarisramen.Allthecustomersseemtohaveenjoyed
it.
Assumingthatinthefirstweekacustomerjoinstheprogramtheyearn2x
pointsonallitems,notjustsushi-CustomerAwouldhave1370,Bwouldhave
820,andCwouldhave360.
CustomerAmadethemostoftheirmembership,orderingalotfromthediner
intheweekaftertheybecameamember.
Thereisgoodindicationthattheloyaltyprogramissuccessfulinbringingin
thedinermorerevenue,sotheyshouldkeepitaroundfornowandseehowifit
bringsinmorerevenue/customersinthemonthofFebruary.
