create table borrow2(roll_no integer, name varchar2(20),date_of_issue date,book_name varchar2(20), status varchar2(20));

insert into borrow2 values(22,'Atharva','8-15-2022','TOC','issued');
insert into borrow2 values(36,'Pravin','8-27-2022','DBMS','issued');
insert into borrow2 values(1,'Aditya','9-5-2022','CNS','issued');
insert into borrow2 values(18,'Swapnil','8-10-2022','SPM','issued');
insert into borrow2 values(68,'Rutik','9-11-2022','IOT','issued');
insert into borrow2 values(25,'Om','7-23-2022','SPOS','issued');

select *from borrow2;


create table fne2(roll_no integer,sys_date date,fine integer);
select *from fne2;

declare
   rollno number;
   name1 varchar(20);
   amt int;
  doi date;
   System_date date;
   no_of_days number(20);
   begin
    rollno:=:roll_no;
   name1:=:name1;
   select Sysdate into System_date from dual;
   select date_of_issue into doi from borrow2 where roll_no=rollno and book_name=name1;
   dbms_output.put_line(doi);
   no_of_days:=System_date-doi;
   dbms_output.put_line(no_of_days);
   if no_of_days>15 and no_of_days<30 then
   amt:=no_of_days*5;
   dbms_output.put_line('amount'||amt);
   elsif no_of_days>30 then
   amt:=no_of_days*50;
   dbms_output.put_line('amount'||amt);
   else
   dbms_output.put_line('no fine');
   end if;
   if no_of_days>15 then
   insert into fne2 values(rollno,sysdate,amt);
   update borrow2 set status='r'where roll_no=rollno;
  end if;
  exception
  when no_data_found then
  dbms_output.put_line(rollno||'not found');
   end;
