-- DROP TABLE FACULTY
CREATE TABLE FACULTY
(
    FACULTY      CHAR(10) NOT NULL,
    FACULTY_NAME VARCHAR2(100),
    CONSTRAINT PK_FACULTY PRIMARY KEY (FACULTY)
);

truncate table FACULTY;
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('����', '����������� ���� � ����������');
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('����', '���������� ���������� � �������');
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('���', '����������������� ���������');
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('���', '���������-������������� ���������');
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('����', '���������� � ������� ������ ��������������');
insert into FACULTY (FACULTY, FACULTY_NAME)
values ('���', '���������� ������������ �������');

select * from faculty

--------------------------------------------------------------------------------------------
-- DROP TABLE PULPIT
CREATE TABLE PULPIT
(
    PULPIT      CHAR(20) NOT NULL,
    PULPIT_NAME VARCHAR2(160),
    FACULTY     CHAR(10) NOT NULL,
    CONSTRAINT FK_PULPIT_FACULTY FOREIGN KEY (FACULTY) REFERENCES FACULTY (FACULTY),
    CONSTRAINT PK_PULPIT PRIMARY KEY (PULPIT)
);

truncate table PULPIT;
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('����', '�������������� ������ � ���������� ', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('������', '���������������� ������������ � ������ ��������� ���������� ', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��', '�����������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��', '������������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��', '��������������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('�����', '���������� � ����������������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('������', '������������ �������������� � ������-��������� �������������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��', '���������� ����', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('�����', '������ ����� � ���������� �������������', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��', '������������ �����', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��������', '���������� ���������������� ������� � ����������� ���������� ����������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('�������', '���������� �������������� ������� � ����� ���������� ���������� ', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('��������', '�����, ���������� ����������������� ����������� � ���������� ����������� �������', '����');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('����', '������������� ������ � ����������', '���');
insert into PULPIT (PULPIT, PULPIT_NAME, FACULTY)
values ('����', '����������� � ��������� ������������������', '���');
select * from faculty

select * from pulpit;
------------------------------------------------------------------------------------------------------------------------
-- DROP  TABLE TEACHER
CREATE TABLE TEACHER
(
    TEACHER      CHAR(20) NOT NULL,
    TEACHER_NAME VARCHAR2(100),
    PULPIT       CHAR(20) NOT NULL,
    CONSTRAINT PK_TEACHER PRIMARY KEY (TEACHER),
    CONSTRAINT FK_TEACHER_PULPIT FOREIGN KEY (PULPIT) REFERENCES PULPIT (PULPIT)
);

truncate table TEACHER;
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������ �������� �������������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '�������� ��������� ��������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '���������� ������ ����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������ ���� �����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������� �������� ��������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '�������� ������ ���������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '����� ��������� ����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '������� ��������� �����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '��������� ����� ��������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '��������� ������� ����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '����������� ������� ����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('?', '�����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '����� ������� ��������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '����� ������� �������������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '���������� ��������� �������������', '������');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '������� ������ ����������', '������');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '����������� ��������� ��������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������� ��������� ����������', '����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������ ������ ��������', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������� ������ ����������', '������');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '���������� �������� ��������', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '������ ���������� ������������', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '��������� �������� ���������', '�����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '���������� �������� ����������', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('������', '��������� ������� ���������', '��������');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('�����', '�������� ������ ����������', '��');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('���', '����� ������ ��������', '�����');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������ ������� ���������', '�������');
insert into TEACHER (TEACHER, TEACHER_NAME, PULPIT)
values ('����', '������� ���� ����������', '��������');

select * from teacher;
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE SUBJECT
CREATE TABLE SUBJECT
(
    SUBJECT      CHAR(20)      NOT NULL,
    SUBJECT_NAME VARCHAR2(100) NOT NULL,
    PULPIT       CHAR(20)      NOT NULL,
    CONSTRAINT PK_SUBJECT PRIMARY KEY (SUBJECT),
    CONSTRAINT FK_SUBJECT_PULPIT FOREIGN KEY (PULPIT) REFERENCES PULPIT (PULPIT)
);

truncate table SUBJECT;
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '������� ���������� ������ ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '���� ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '�������������� ����������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '������ �������������� � ����������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '������������� ������ � ������������ ��������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '��������������� ������� ����������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '������������� ������ ��������� ����������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '�������������� �������������� ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '������������ ��������� ', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('�����', '��������������� ������, �������� � �������� �����', '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '������������ �������������� �������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '����������� ���������������� ������������', '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '���������� ���������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '�������������� ����������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '���������� ������ ���', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '��������-��������������� ����������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '��������� ������������������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '������������� ������', '����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('������OO', '�������� ������ ������ � ���� � ���. ������.', '��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('�������', '������ ��������������� � ������������� ���������', '������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '���������� �������� ', '��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '�����������', '�����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('��', '������������ �����', '��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '���������� ��������� �������', '��������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '������ ��������� ����', '��');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '���������� � ������������ �������������', '�����');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('����', '���������� ���������� �������� ���������� ', '�������');
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
values ('���', '���������� ������������', '��������');

select * from subject;
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM_TYPE
create table AUDITORIUM_TYPE
(
    AUDITORIUM_TYPE     char(10)
        constraint AUDITORIUM_TYPE_PK primary key,
    AUDITORIUM_TYPENAME varchar2(100)
        constraint AUDITORIUM_TYPENAME_NOT_NULL not null
);

truncate table AUDITORIUM_TYPE;
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values ('��', '����������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values ('��-�', '������������ �����');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values ('��-�', '���������� � ���. ������������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values ('��-X', '���������� �����������');
insert into AUDITORIUM_TYPE (AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
values ('��-��', '����. ������������ �����');

select * from auditorium_type;
---------------------------------------------------------------------------------------------------------------------
-- DROP TABLE AUDITORIUM
create table AUDITORIUM
(
    AUDITORIUM          char(10) primary key, -- ��� ���������
    AUDITORIUM_NAME     varchar2(200),        -- ���������
    AUDITORIUM_CAPACITY number(4),            -- �����������
    AUDITORIUM_TYPE     char(10) not null     -- ��� ���������
        references AUDITORIUM_TYPE (AUDITORIUM_TYPE)
);

truncate table AUDITORIUM;
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('206-1', '206-1', '��-�', 15);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('301-1', '301-1', '��-�', 15);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('236-1', '236-1', '��', 60);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('313-1', '313-1', '��', 60);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('324-1', '324-1', '��', 50);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('413-1', '413-1', '��-�', 15);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('423-1', '423-1', '��-�', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('408-2', '408-2', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('103-4', '103-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('105-4', '105-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('107-4', '107-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('110-4', '110-4', '��', 30);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('111-4', '111-4', '��', 30);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('114-4', '114-4', '��-�', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('132-4', '132-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('02�-4', '02�-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('229-4', '229-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('304-4', '304-4', '��-�', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('314-4', '314-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('320-4', '320-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('429-4', '429-4', '��', 90);
insert into AUDITORIUM (AUDITORIUM, AUDITORIUM_NAME, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY)
values ('311-1', '311-1', '��', 90);

select * from auditorium;
-----------------------------------------------------------------------------------------------------------------------
commit;