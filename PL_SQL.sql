/*create table borrowBook(roll_no integer,name varchar(20),date_of_issue date,book_name varchar(20),status varchar(20));
create table fineAmount(roll_no integer,sys_date date,fine integer);

insert into borrow values(22,'Atharva','8-15-2022','TOC','issued');
insert into borrow values(36,'Pravin','8-27-2022','DBMS','issued');
insert into borrow values(1,'Aditya','9-5-2022','CNS','issued');
insert into borrow values(18,'Swapnil','8-10-2022','SPM','issued');
insert into borrow values(68,'Rutik','9-11-2022','IOT','issued');
insert into borrow values(25,'Om','7-23-2022','SPOS','issued');
*/
DECLARE
    rollno number;
    name1 varchar(20);
    amt int;
    doi date;
    System_date date;
    no_of_days number(20);

BEGIN
    rollno:=:roll_no;
    name1:=:name1;
    select Sysdate into System_date from dual;
    select date_of_issue into doi from borrowBook where roll_no=rollno and book_name =name1;
    dbms_output.put_line(doi);
    no_of_days:=System_date-doi;
    dbms_output.put_line(no_of_days);

    IF no_of_days>15 and no_of_days<30 THEN
    amt:=no_of_days*5;
    dbms_output.put_line('amount' || amt);
    ELSIF no_of_days>30 THEN
    amt:=no_of_days*50; 
    dbms_output.put_line('amount' || amt);
    ELSE
    dbms_output.put_line('No fine');   
    END IF;
    IF no_of_days>15 THEN
    insert into fine values(rollno,sysdate,amt);
    update borrow set status='returned' where roll_no=rollno;
    END IF;
    exception
    WHEN no_data_found THEN
    dbms_output.put_line(rollno ||'not found');
END;
/    
