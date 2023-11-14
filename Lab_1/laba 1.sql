create table XXX_t(ID number(3), s varchar(50));

insert into XXX_t (ID, s) VALUES (1, 'ddd');
insert into XXX_t (ID, s) VALUES (2, 'gf');
insert into XXX_t (ID, s) VALUES (3, 'ggg');
insert into XXX_t (ID, s) VALUES (4, 'asd');
insert into XXX_t (ID, s) VALUES (5, 'dsfsdf');
commit;
select * from  XXX_t;

update XXX_t set s = '1' where ID = 1;
update XXX_t set s = '2' where ID = 2;
commit;
select * from  XXX_t;

select * from XXX_t where s = '1' or  s = '2';
select sum(ID) from XXX_t where s = '1' or  s = '2';

delete XXX_t where ID = 5;
commit;
select * from XXX_t;

ALTER TABLE XXX_t ADD CONSTRAINT unique_s UNIQUE (ID);

create table XXX_t1(
    ID number,
    data varchar(50),
    constraint fk FOREIGN KEY (ID) REFERENCES XXX_t (ID)
                   ) ;

insert into XXX_t1 (ID, data) values (1, 'data1');
insert into XXX_t1 (ID, data) values (2, 'data2');

commit;

select *
from XXX_t left join XXX_t1 X on XXX_t.ID = X.ID;

select *
from XXX_t right join XXX_t1 X on XXX_t.ID = X.ID;


drop table XXX_t1;
drop table XXX_t;