create table dynamic_menu(
menu_item varchar2(50),
link_page varchar2(256) ,
tool_tip varchar2(256),
item_type varchar2(50),
item_group varchar2(50),
item_order number);
------------------------inser data for java/j2ee link--------------------------------------------
insert into dynamic_menu values('Java/J2ee','#','click here','header','Java/J2ee',1);
insert into dynamic_menu values('Core Java','corejavapage.jsp','click here','item','Java/J2ee',1);
insert into dynamic_menu values('Jsp','jsppage.jsp','click here','item','Java/J2ee',2);
insert into dynamic_menu values('Servlet','servletpage.jsp','click here','item','Java/J2ee',3);
insert into dynamic_menu values('Struts','strutspage.jsp','click here','item','Java/J2ee',4);

------------------------inser data for Database link--------------------------------------------
insert into dynamic_menu values('Database','#','click here','header','Database',2);
insert into dynamic_menu values('Oracle','oraclepage.jsp','click here','item','Database',1);
insert into dynamic_menu values('PL/Sql','plsqlpage.jsp','click here','item','Database',2);
insert into dynamic_menu values('Sql server','sqlserverpage.jsp','click here','item','Database',3);
commit;

-------------select Query-------------------------

select menu_item from dynamic_menu where item_type='header'  order by item_order ;

select menu_item,link_page,tool_tip,item_order from dynamic_menu where item_type='item' and item_group='Java/J2ee' order by item_order;