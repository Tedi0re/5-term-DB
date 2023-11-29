alter session set "_ORACLE_SCRIPT" = true;
------------------------------------ Задание №1
grant create sequence, create cluster,
    create synonym, create public synonym, create materialized view
    to U1_SAA_PDB;
-- sys in pdb
grant select on SYS.DBA_CLUSTERS to U1_SAA_PDB;
grant select on SYS.DBA_TABLES to U1_SAA_PDB;
grant execute on DBMS_MVIEW to U1_SAA_PDB;

------------------------------------ Задание №2
--drop sequence U1_SAA_PDB.S1;

create sequence U1_SAA_PDB.S1
    increment by 10
    start with 1000
    nomaxvalue
    nominvalue
    nocycle
    nocache
    noorder;

select S1.nextval
from dual;
select S1.currval
from dual;

------------------------------------ Задание №3-4
--drop sequence U1_SAA_PDB.S2;

create sequence U1_SAA_PDB.S2
    start with 10
    increment by 10
    maxvalue 100
    nocycle;

select S2.nextval
from dual;
select S2.currval
from dual;

------------------------------------ Задание №5
--drop sequence U1_SAA_PDB.S3;

create sequence U1_SAA_PDB.S3
    start with 10
    increment by -10
    minvalue -100
    maxvalue 10
    nocycle
    order;

select S3.nextval
from dual;
select S3.currval
from dual;

------------------------------------ Задание №6
--drop sequence U1_SAA_PDB.S4;

create sequence U1_SAA_PDB.S4
    start with 1
    increment by 1
    maxvalue 10
    cycle
    cache 5
    noorder;

select S4.nextval
from dual;
select S4.currval
from dual;

------------------------------------ Задание №7
select *
from USER_SEQUENCES;

------------------------------------ Задание №8
--drop table T1;

create table T1
(
    N1 number(20),
    N2 number(20),
    N3 number(20),
    N4 number(20)
) cache storage
(
    buffer_pool keep
);

begin
    for i in 1..7
        loop
            insert into T1 (N1, N2, N3, N4)
            VALUES (U1_SAA_PDB.S1.nextval, U1_SAA_PDB.S2.nextval,
                    U1_SAA_PDB.S3.nextval, U1_SAA_PDB.S4.nextval);
        end loop;
end;

select *
from T1;

SELECT SEGMENT_NAME, TABLESPACE_NAME, BUFFER_POOL FROM USER_SEGMENTS;

------------------------------------ Задание №9
--drop cluster U1_SAA_PDB.ABC;

create cluster U1_SAA_PDB.ABC
    (
    X number(10),
    V varchar2(12)
    )
    hashkeys 200
    tablespace TS_SAA;

------------------------------------ Задание №10
--drop table A;

create table A
(
    XA number(10),
    VA varchar2(12),
    Y  int
) cluster U1_SAA_PDB.ABC (XA, VA);

------------------------------------ Задание №11
--drop table B;

create table B
(
    XB number(10),
    VB varchar2(12),
    Y  int
) cluster U1_SAA_PDB.ABC (XB, VB);

------------------------------------ Задание №12
--drop table C;

create table C
(
    XC number(10),
    VC varchar2(12),
    Y  int
) cluster U1_SAA_PDB.ABC (XC, VC);


select * from SYS.DBA_CLUSTERS
------------------------------------ Задание №13
select cluster_name, owner
from SYS.DBA_CLUSTERS;
select *
from SYS.DBA_TABLES
where cluster_name = 'ABC';

------------------------------------ Задание №14
--drop synonym SYNONYM_C;

create synonym SYNONYM_C for U1_SAA_PDB.C;
insert into SYNONYM_C
values (1, 'a', 7);
select *
from SYNONYM_C;

------------------------------------ Задание №15
--drop synonym SYNONYM_B;

create public synonym SYNONYM_B for U1_SAA_PDB.B;
insert into SYNONYM_B
values (2, 'b', 9);
select *
from SYNONYM_B;

------------------------------------ Задание №16
--drop table Task_A;

create table Task_A
(
    X number(20) primary key
);

--drop table Task_B;

create table Task_B
(
    Y number(20),
    constraint fk_y foreign key (Y) references Task_A (X)
);

insert into Task_A(X)
values (1);
insert into Task_A(X)
values (2);
insert into Task_B(Y)
values (1);
insert into Task_B(Y)
values (2);
commit;

--drop view V1;

create view V1
as
select * from Task_A inner join Task_B TB on Task_A.X = TB.Y;

select *
from V1;

------------------------------------ Задание №17
--drop materialized view MV;

create materialized view MV
    build immediate
    refresh complete on demand
    next sysdate + numtodsinterval(1, 'minute')
as
select * from Task_A full join Task_B TB on Task_A.X = TB.Y;

select * from MV;
--delete from TASK_A where x = 5;
insert into Task_A(X) values (5);
commit;

begin
    DBMS_MVIEW.REFRESH('MV');
end;