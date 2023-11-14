-- ������� 1 --
SELECT SUM(VALUE) FROM V$SGA;
-- ������� 2 --
SELECT * FROM V$SGA;
-- ������� 3 --
SELECT COMPONENT, GRANULE_SIZE, CURRENT_SIZE / GRANULE_SIZE AS RATIO FROM V$SGA_DYNAMIC_COMPONENTS;
-- ������� 4 --
SELECT CURRENT_SIZE FROM V$SGA_DYNAMIC_FREE_MEMORY;

-- ������� 5 --
SELECT NAME, HASH FROM v$parameter WHERE name = 'sga_max_size';
SELECT NAME, HASH  FROM v$parameter WHERE name = 'sga_target';

-- ������� 6 --

SELECT COMPONENT, MIN_SIZE, CURRENT_SIZE FROM V$SGA_DYNAMIC_COMPONENTS WHERE COMPONENT = 'DEFAULT buffer cache' or COMPONENT = 'KEEP buffer cache' or COMPONENT = 'RECYCLE buffer cache';

--������� 7 --
CREATE TABLE SAA_TABLE_KEEP (
    ID number(2)
)STORAGE ( BUFFER_POOL KEEP );
INSERT INTO SAA_TABLE_KEEP (ID) VALUES (1);
INSERT INTO SAA_TABLE_KEEP (ID) VALUES (2);
INSERT INTO SAA_TABLE_KEEP (ID) VALUES (3);
INSERT INTO SAA_TABLE_KEEP (ID) VALUES (4);
COMMIT;

drop  table  SAA_TABLE_KEEP purge;
FLASHBACK TABLE  SAA_TABLE_KEEP TO  BEFORE DROP;
SELECT * FROM  SAA_TABLE_KEEP;


SELECT SEGMENT_NAME, TABLESPACE_NAME, BUFFER_POOL FROM USER_SEGMENTS;
-- ������� 8 --
CREATE TABLE SAA_TABLE_KEEP2
(
    Id number(2)
)STORAGE ( BUFFER_POOL DEFAULT );
INSERT INTO SAA_TABLE_KEEP2 (ID) VALUES (1);
INSERT INTO SAA_TABLE_KEEP2 (ID) VALUES (2);
INSERT INTO SAA_TABLE_KEEP2 (ID) VALUES (3);
COMMIT;
SELECT SEGMENT_NAME, TABLESPACE_NAME, BUFFER_POOL FROM USER_SEGMENTS;
drop  table  SAA_TABLE_KEEP purge;
-- ������� 9 --
SELECT NAME, HASH  FROM v$parameter WHERE name = 'log_buffer';
-- ������� 10 --
SELECT *
FROM V$SGASTAT
WHERE NAME = 'free memory' AND POOL = 'large pool';
-- ������� 11 --
SELECT USERNAME, SID, SERVER, STATUS FROM V$SESSION WHERE USERNAME iS NOT NULL;
-- ������� 12 --
SELECT NAME, DESCRIPTION FROM V$BGPROCESS;
-- ������� 13 --
SELECT * FROM v$process;
-- ������� 14 --
SELECT COUNT(*) FROM V$BGPROCESS WHERE PADDR != '00' AND NAME LIKE 'DBW%';
-- ������� 15 --
SELECT * FROM V$SESSION where  USERNAME is not null;
-- ������� 16 --
SELECT * FROM V$DISPATCHER;
-- ������� 17 --
-- � ������ ��� ������ �������, ������ ���� �� ���������� ����� �� �����
-- ������� 18 --
 --find / -name listener.ora 2>/dev/null
 --cat /u01/app/oracle/product/12.2.0/dbhome_1/admin/ORCLCDB/listener.ora
 -- 19 --
-- help --> start, stop,status - ready, blocked, unknown
-- services, version
-- servacls - get access control lists
-- reload - reload the parameter files and SIDs
-- save_config - saves configuration changes to parameter file
-- ������� 20 --
SELECT NAME FROM DBA_SERVICES;

/*alter system set large_pool_size =2m;
alter system set sga_target =2m;
startup;
shutdown immediate;
startup;
SHOW PARAMETER log_buffer*/