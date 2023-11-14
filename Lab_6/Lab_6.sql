-- Задание 1 --
-- В докере
-- docker exec -it oracle_db bash
-- find / -name sqlnet.ora 2>/dev/null
-- cat /u01/app/oracle/product/12.2.0/dbhome_1/admin/ORCLCDB/sqlnet.ora (после cat тот путь, который выдала первая команда, можно ещё vi)
-- cat /u01/app/oracle/product/12.2.0/dbhome_1/network/admin/samples/tnsnames.ora

--vi  /u01/app/oracle/product/12.2.0/dbhome_1/admin/ORCLCDB/tnsnames.ora
-- Задание 2 --
--bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
-- show parameter instance
-- Задание 3 --
SELECT * FROM V$PDBS; -- В консоли
SELECT * FROM V$TABLESPACE;
SELECT * FROM DBA_DATA_FILES;
SELECT * FROM ALL_USERS;
SELECT * FROM DBA_ROLE_PRIVS;
--connect pdb_admin/123456@localhost:1521/SAA_PDB.localdomain;
-- Задание 6 - 7 --
--conn u1_saa_pdb/123456@localhost:1521/SAA_PDB.localdomain;
-- Задание 8 - 9 --
-- Включить измерение времени выполнения
--SET TIMING ON;
-- Выполнить SQL-запрос (например, SELECT)
--SELECT * FROM your_table_name;
-- Получить описание столбцов таблицы
--DESCRIBE your_table_name;


select * from SAA_TABLE_KEEP ;
-- Задание №10
SELECT * FROM DBA_SEGMENTS WHERE OWNER = 'DB_USER';
-- Задание 11
CREATE VIEW All_extents AS SELECT EXTENTS, BLOCKS, BYTES FROM DBA_SEGMENTS;
SELECT * FROM All_extents;

--docker exec -it oracle_db bash -c "source /home/oracle/.bashrc; sqlplus /nolog"






































