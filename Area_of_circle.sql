
create table circle(radius number,area number);


declare
  radius number;
  area number;
begin
   for radius in 5..9 loop
   Area:=3.14*radius*radius;
   dbms_output.put_line('Area = '||area);
   insert into circle values(radius,area);
   end loop;
end;
/

select * from circle;
