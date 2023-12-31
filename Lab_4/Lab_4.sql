alter session set "_ORACLE_SCRIPT" = true;
-- ������ 1 --
select * from SYS.DBA_DATA_FILES;
select * from SYS.DBA_TEMP_FILES;
select * from V$DATAFILE;
-- ������ 2 --
CREATE TABLESPACE SAA_QDATA
DATAFILE 'SAA_QDATA.dbf'
SIZE 10M
AUTOEXTEND ON NEXT 5M
MAXSIZE 20M
OFFLINE;

CREATE USER SAA IDENTIFIED BY 123456
DEFAULT TABLESPACE SAA_QDATA
PROFILE default
ACCOUNT UNLOCK;

GRANT CREATE SESSION TO SAA;
GRANT dba to SAA;

ALTER TABLESPACE  SAA_QDATA ONLINE ;

ALTER USER SAA QUOTA 2M ON SAA_QDATA;

DROP TABLESPACE SAA_QDATA INCLUDING CONTENTS AND DATAFILES;

select * from dba_users; 

CREATE TABLE SAA_T1
(
    Id number(5) primary key,
    Name nvarchar2(20)
)TABLESPACE SAA_QDATA;
INSERT INTO  SAA_T1 (Id, Name) VALUES (1, 'Oleg');
INSERT INTO  SAA_T1 (Id, Name) VALUES (2, 'Anton');
INSERT INTO  SAA_T1 (Id, Name) VALUES (3, 'Kirill');
INSERT INTO  SAA_T1 (Id, Name) VALUES (4, 'Andrey');

commit;
select * from SAA_T1;

drop  table SAA_T1;
-- ������� 3 --
SELECT DISTINCT * FROM DBA_SEGMENTS WHERE TABLESPACE_NAME = 'SAA_QDATA';
-- ������� 4 --
DROP TABLE SAA_T1;
DROP TABLE SAA_T1 purge ;
SELECT DISTINCT * FROM DBA_SEGMENTS WHERE TABLESPACE_NAME = 'SAA_QDATA';
SELECT * FROM USER_RECYCLEBIN;
COMMIT;
-- ������� 5 --
FLASHBACK TABLE  SAA_T1 TO  BEFORE DROP;
SELECT * FROM  SAA_T1;
SELECT DISTINCT * FROM DBA_SEGMENTS WHERE TABLESPACE_NAME = 'SAA_QDATA';
-- ������� 6 --
BEGIN
FOR k in 1..10000
    LOOP
    INSERT INTO SAA_T1 (Id) VALUES (k);
    end loop;
    COMMIT;
END;
SELECT * FROM  SAA_T1;
-- ������� 7 --
SELECT SEGMENT_NAME, SEGMENT_TYPE, TABLESPACE_NAME, BYTES, BLOCKS, EXTENTS, BUFFER_POOL FROM DBA_SEGMENTS WHERE TABLESPACE_NAME = 'SAA_QDATA';
SELECT * FROM USER_EXTENTS WHERE TABLESPACE_NAME = 'SAA_QDATA';
-- ������� 8 --
DROP TABLESPACE SAA_QDATA INCLUDING CONTENTS AND DATAFILES;

select * from v$datafile;
-- ������� 9 --
SELECT GROUP#, STATUS, MEMBERS FROM V$LOG;
-- ������� 10 --
SELECT * FROM V$LOGFILE;
-- ������� 11 --
ALTER SYSTEM SWITCH LOGFILE;
SELECT GROUP#, STATUS, MEMBERS FROM V$LOG;
-- ������� 12 --
ALTER DATABASE  ADD LOGFILE GROUP 4 '/u04/app/oracle/redo/redo004.log'
SIZE  50M BLOCKSIZE 512;
ALTER  DATABASE  ADD LOGFILE MEMBER '/u04/app/oracle/redo/redo0041.log' TO GROUP 4;
ALTER  DATABASE  ADD LOGFILE MEMBER '/u04/app/oracle/redo/redo0042.log' TO GROUP 4;
SELECT * FROM V$LOG;
-- ������� 13 --
ALTER DATABASE DROP LOGFILE GROUP 4;
-- ������� 14 --
SELECT NAME, LOG_MODE FROM V$DATABASE;
SELECT INSTANCE_NAME, ARCHIVER, ACTIVE_STATE FROM V$INSTANCE;
-- ������� 15 --
SELECT MAX(SEQUENCE#) AS LAST_ARCHIVE_LOG
FROM V$LOG_HISTORY;
-- ������� 16 --
--SHUTDOWN IMMEDIATE;
--STARTUP MOUNT;
--ALTER DATABASE ARCHIVELOG;
--ALTER DATABASE OPEN;
SELECT NAME, LOG_MODE FROM V$DATABASE;
-- ������� 17 --
SELECT * FROM V$LOG;
ALTER SYSTEM SET LOG_ARCHIVE_DEST_1 ='LOCATION=/u04/app/oracle/redo/Archive';
ALTER SYSTEM SWITCH LOGFILE;
SELECT * FROM V$ARCHIVED_LOG;
-- ������� 18 --
--SHUTDOWN IMMEDIATE;
--STARTUP MOUNT;
--ALTER DATABASE NOARCHIVELOG;
--ALTER DATABASE OPEN;
select name, log_mode from v$database;
-- ������� 19 --
SELECT * FROM V$CONTROLFILE;

-- ������ �20 (� �������)
-- � �������: SHOW PARAMETER CONTROL;
--/u02/app/oracle/oradata/ORCLCDB/cntrlORCLCDB.dbf, /u03/app/oracle/fast_recovery_area/ORCLCDB/cntrlORCLCDB2.dbf

-- ������� �21 (� �������)
-- � �������: SHOW PARAMETER spfile;
--/u01/app/oracle/product/12.2.0/dbhome_1/dbs/spfileORCLCDB.ora
-- ������� 22 --
CREATE PFILE = 'SAA_PFILE.ora' FROM SPFILE;
--cat /ORCL/u01/app/oracle/product/12.2.0/dbhome_1/dbs/SAA_PFILE.ora
-- ������� 23 --
SELECT * FROM V$PWFILE_USERS;
--cat /ORCL/u01/app/oracle/product/12.2.0/dbhome_1/dbs/orapwORCLCDB
-- ������� 24 --
SELECT * FROM V$DIAG_INFO;
-- ������� 25
--cat /ORCL/u01/app/oracle/diag/tnslsnr/f151e170f4af/listener/alert/log.xml

--
select distinct segment_type from dba_segments;

SELECT value
FROM V$PARAMETER
WHERE name = 'db_block_size';
