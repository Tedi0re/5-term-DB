alter session set nls_date_format = 'DD-MM-YYYY';

------------------------------------ Çàäàíèå ¹1

alter table TEACHER
    add BIRTHDAY date;
alter table TEACHER
    add SALARY number;

update TEACHER
set BIRTHDAY = '05-06-1985'
where TEACHER = 'ÑÌËÂ';
update TEACHER
set BIRTHDAY = '15-09-1973'
where TEACHER = 'ÀÊÍÂ×';
update TEACHER
set BIRTHDAY = '03-11-1982'
where TEACHER = 'ÊËÑÍÂ';
update TEACHER
set BIRTHDAY = '20-08-1971'
where TEACHER = 'ÃĞÌÍ';
update TEACHER
set BIRTHDAY = '02-03-1995'
where TEACHER = 'ËÙÍÊ';
update TEACHER
set BIRTHDAY = '18-12-1978'
where TEACHER = 'ÁĞÊÂ×';
update TEACHER
set BIRTHDAY = '09-04-1986'
where TEACHER = 'ÄÄÊ';
update TEACHER
set BIRTHDAY = '30-10-1979'
where TEACHER = 'ÊÁË';
update TEACHER
set BIRTHDAY = '15-06-1987'
where TEACHER = 'ÓĞÁ';
update TEACHER
set BIRTHDAY = '25-09-1980'
where TEACHER = 'ĞÌÍÊ';
update TEACHER
set BIRTHDAY = '18-03-1968'
where TEACHER = 'ÏÑÒÂËÂ';
update TEACHER
set BIRTHDAY = '05-05-1986'
where TEACHER = '?';
update TEACHER
set BIRTHDAY = '14-02-1992'
where TEACHER = 'ÃĞÍ';
update TEACHER
set BIRTHDAY = '03-09-1974'
where TEACHER = 'ÆËÊ';
update TEACHER
set BIRTHDAY = '08-11-1970'
where TEACHER = 'ÁĞÒØÂ×';
update TEACHER
set BIRTHDAY = '19-05-1988'
where TEACHER = 'ŞÄÍÊÂ';
update TEACHER
set BIRTHDAY = '28-07-1990'
where TEACHER = 'ÁĞÍÂÑÊ';
update TEACHER
set BIRTHDAY = '10-04-1969'
where TEACHER = 'ÍÂĞÂ';
update TEACHER
set BIRTHDAY = '09-10-1975'
where TEACHER = 'ĞÂÊ×';
update TEACHER
set BIRTHDAY = '23-06-1981'
where TEACHER = 'ÄÌÄÊ';
update TEACHER
set BIRTHDAY = '01-11-1977'
where TEACHER = 'ÌØÊÂÑÊ';
update TEACHER
set BIRTHDAY = '15-03-1994'
where TEACHER = 'ËÁÕ';
update TEACHER
set BIRTHDAY = '22-08-1979'
where TEACHER = 'ÇÂÃÖÂ';
update TEACHER
set BIRTHDAY = '07-01-1981'
where TEACHER = 'ÁÇÁĞÄÂ';
update TEACHER
set BIRTHDAY = '30-09-1972'
where TEACHER = 'ÏĞÊÏ×Ê';
update TEACHER
set BIRTHDAY = '12-12-1995'
where TEACHER = 'ÍÑÊÂÖ';
update TEACHER
set BIRTHDAY = '02-04-1986'
where TEACHER = 'ÌÕÂ';
update TEACHER
set BIRTHDAY = '24-02-1973'
where TEACHER = 'ÅÙÍÊ';
update TEACHER
set BIRTHDAY = '19-08-1985'
where TEACHER = 'ÆĞÑÊ';




update TEACHER
set SALARY = 1200
where TEACHER = 'ÑÌËÂ';
update TEACHER
set SALARY = 1200
where TEACHER = 'ÀÊÍÂ×';
update TEACHER
set SALARY = 1100
where TEACHER = 'ÊËÑÍÂ';
update TEACHER
set SALARY = 1250
where TEACHER = 'ÃĞÌÍ';
update TEACHER
set SALARY = 700
where TEACHER = 'ËÙÍÊ';
update TEACHER
set SALARY = 1000
where TEACHER = 'ÁĞÊÂ×';
update TEACHER
set SALARY = 950
where TEACHER = 'ÄÄÊ';
update TEACHER
set SALARY = 1130
where TEACHER = 'ÊÁË';
update TEACHER
set SALARY = 1680
where TEACHER = 'ÓĞÁ';
update TEACHER
set SALARY = 1320
where TEACHER = 'ĞÌÍÊ';
update TEACHER
set SALARY = 1450
where TEACHER = 'ÏÑÒÂËÂ';
update TEACHER
set SALARY = 443
where TEACHER = '?';
update TEACHER
set SALARY = 1720
where TEACHER = 'ÃĞÍ';
update TEACHER
set SALARY = 1630
where TEACHER = 'ÆËÊ';
update TEACHER
set SALARY = 1100
where TEACHER = 'ÁĞÒØÂ×';
update TEACHER
set SALARY = 1075
where TEACHER = 'ŞÄÍÊÂ';
update TEACHER
set SALARY = 1170
where TEACHER = 'ÁĞÍÂÑÊ';
update TEACHER
set SALARY = 980
where TEACHER = 'ÍÂĞÂ';
update TEACHER
set SALARY = 1350
where TEACHER = 'ĞÂÊ×';
update TEACHER
set SALARY = 1015
where TEACHER = 'ÄÌÄÊ';
update TEACHER
set SALARY = 1115
where TEACHER = 'ÌØÊÂÑÊ';
update TEACHER
set SALARY = 1260
where TEACHER = 'ËÁÕ';
update TEACHER
set SALARY = 1560
where TEACHER = 'ÇÂÃÖÂ';
update TEACHER
set SALARY = 1115
where TEACHER = 'ÁÇÁĞÄÂ';
update TEACHER
set SALARY = 925
where TEACHER = 'ÏĞÊÏ×Ê';
update TEACHER
set SALARY = 1100
where TEACHER = 'ÍÑÊÂÖ';
update TEACHER
set SALARY = 955
where TEACHER = 'ÌÕÂ';
update TEACHER
set SALARY = 815
where TEACHER = 'ÅÙÍÊ';
update TEACHER
set SALARY = 1070
where TEACHER = 'ÆĞÑÊ';
commit;


------------------------------------ Çàäàíèå ¹2
select regexp_substr(teacher_name, '(\S+)', 1, 1) || ' ' ||
       substr(regexp_substr(teacher_name, '(\S+)', 1, 2), 1, 1) || '. ' ||
       substr(regexp_substr(teacher_name, '(\S+)', 1, 3), 1, 1) || '. ' as ÔÈÎ
from teacher;

------------------------------------ Çàäàíèå ¹3
select *
from teacher
where TO_CHAR(birthday, 'd') = 1;

------------------------------------ Çàäàíèå ¹4
--drop view next_month

create or replace view next_month as
select *
from TEACHER
where TO_CHAR(birthday, 'mm') =
      (select substr(to_char(trunc(last_day(sysdate)) + 1), 4, 2)
       from dual);

select *
from next_month;

------------------------------------ Çàäàíèå ¹5
--drop view number_months
create or replace view number_months as
select to_char(birthday, 'Month') Ìåñÿö,
       count(*)                   Êîëè÷åñòâî
from teacher
group by to_char(birthday, 'Month')
having count(*) >= 1
order by Êîëè÷åñòâî desc;

select *
from number_months;

------------------------------------ Çàäàíèå ¹6
declare
    cursor teacher_birthday
        return teacher%rowtype is
        select *
        from teacher
        where MOD((TO_CHAR(sysdate, 'yyyy') - TO_CHAR(birthday, 'yyyy') + 1), 5) = 0;
    v_teacher  TEACHER%rowtype;
begin
    open teacher_birthday;

    fetch teacher_birthday into v_teacher;

    while (teacher_birthday%found)
        loop
            dbms_output.put_line(v_teacher.teacher || ' ' || v_teacher.teacher_name || ' ' || v_teacher.pulpit || ' ' ||
                                 v_teacher.birthday || ' ' || v_teacher.salary);
            fetch teacher_birthday into v_teacher;
        end loop;

    close teacher_birthday;
end;

------------------------------------ Çàäàíèå ¹7
declare
    cursor teachers_avg_salary is
        select pulpit, floor(avg(salary)) as AVG_SALARY
        from TEACHER
        group by pulpit;
    cursor faculty_avg_salary is
        select FACULTY, AVG(SALARY)
        from TEACHER
                 join PULPIT P on TEACHER.PULPIT = P.PULPIT
        group by FACULTY;
    cursor faculties_avg_salary is
        select AVG(SALARY)
        from TEACHER;
    m_pulpit  TEACHER.PULPIT%type;
    m_salary  TEACHER.SALARY%type;
    m_faculty PULPIT.FACULTY%type;
begin

    dbms_output.put_line('--------------- Ïî êàôåäğàì -----------------');
    open teachers_avg_salary;
    fetch teachers_avg_salary into m_pulpit, m_salary;

    while (teachers_avg_salary%found)
        loop
            dbms_output.put_line(m_pulpit || ' ' || m_salary);
            fetch teachers_avg_salary into m_pulpit, m_salary;
        end loop;
    close teachers_avg_salary;

    dbms_output.put_line('--------------- Ïî ôàêóëüòåòàì -----------------');
    open faculty_avg_salary;
    fetch faculty_avg_salary into m_faculty, m_salary;

    while (faculty_avg_salary%found)
        loop
            dbms_output.put_line(m_faculty || ' ' || m_salary);
            fetch faculty_avg_salary into m_faculty, m_salary;
        end loop;
    close faculty_avg_salary;

    dbms_output.put_line('--------------- Ïî âñåì ôàêóëüòåòàì -----------------');
    open faculties_avg_salary;
    fetch faculties_avg_salary into m_salary;
    dbms_output.put_line(round(m_salary, 2));
    close faculties_avg_salary;
end;

------------------------------------ Çàäàíèå ¹8
DECLARE
    TYPE SupplierType IS RECORD (
        SupplierName VARCHAR2(100),
        SupplierLocation VARCHAR2(50)
    );
    
    TYPE ProductType IS RECORD (
        ProductName VARCHAR2(100),
        Price NUMBER,
        Quantity NUMBER,
        SupplierInfo SupplierType
    );
    
    supplier_info SupplierType;
    product_info  ProductType;
BEGIN
    supplier_info.SupplierName := 'Ñèìîíîâ Àíäğåé';
    supplier_info.SupplierLocation := 'Ìèíñê';
    
    product_info.ProductName := '10 ëàáà';
    product_info.Price := 1;
    product_info.Quantity := 1;
    product_info.SupplierInfo := supplier_info;

    dbms_output.put_line('Òîâàğ: ' || product_info.ProductName);
    dbms_output.put_line('Öåíà: $' || product_info.Price);
    dbms_output.put_line('Êîëè÷åñòâî: ' || product_info.Quantity);
    dbms_output.put_line('Ïîñòàâùèê: ' || product_info.SupplierInfo.SupplierName);
    dbms_output.put_line('Ãîğîä: ' || product_info.SupplierInfo.SupplierLocation);
END;


create table T_HASH(
    str varchar2(50),    id  number
)partition by hash (str)
(    partition k0 tablespace t1,
    partition k1 tablespace t2,    partition k2 tablespace t3,
    partition k3 tablespace t4);
