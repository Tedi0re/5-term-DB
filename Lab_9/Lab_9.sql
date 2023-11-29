---------------------------------------1
declare 
    faculty_rec faculty%rowtype;
begin
    select * into faculty_rec from faculty where faculty = '���';
    dbms_output.put_line(faculty_rec.faculty || faculty_rec.faculty_name );
exception
    when others
    then dbms_output.put_line(sqlerrm);
end;
---------------------------------------2
declare 
    faculty_rec faculty%rowtype;
begin
    select * into faculty_rec from faculty;
    dbms_output.put_line(faculty_rec.faculty || faculty_rec.faculty_name );
exception
    when others
    then dbms_output.put_line(sqlerrm);
end;
---------------------------------------3
declare 
    faculty_rec faculty%rowtype;
begin
    select * into faculty_rec from faculty;
    dbms_output.put_line(faculty_rec.faculty || faculty_rec.faculty_name );
exception
    when too_many_rows
    then dbms_output.put_line('��������� ������� �� ���������� ����� (ORA' || sqlcode || ')');
    when others
    then dbms_output.put_line(sqlerrm);
end;
---------------------------------------4
declare 
    faculty_rec faculty%rowtype;
begin
    select * into faculty_rec from faculty where faculty = 'XXX';
    dbms_output.put_line(faculty_rec.faculty || faculty_rec.faculty_name );
exception
    when no_data_found then dbms_output.put_line('������ �� ������� (ORA' || sqlcode || ')');
    when others
    then dbms_output.put_line(sqlerrm);
end;

declare
    faculty_rec faculty%rowtype;
begin
    select * into faculty_rec from faculty where faculty = '���';
    dbms_output.put_line(rtrim(faculty_rec.faculty) || ': ' || faculty_rec.faculty_name);

    if sql%found then
        dbms_output.put_line('%found:     true');
    else
        dbms_output.put_line('%found:     false');
    end if;

    if sql%isopen then
        dbms_output.put_line('$isopen:    true');
    else
        dbms_output.put_line('$isopen:    false');
    end if;

    if sql%notfound then
        dbms_output.put_line('%notfound:  true');
    else
        dbms_output.put_line('%notfound:  false');
    end if;

    dbms_output.put_line('%rowcount:  ' || sql%rowcount);
end;
---------------------------------------5
begin
    update auditorium
    set auditorium          = '200-3a',
        auditorium_name     = '200-3a',
        auditorium_capacity = 200,
        auditorium_type     = '��'
    where auditorium = '236-1';
    commit;
    --rollback;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;

begin
    update auditorium
    set auditorium          = '236-1',
        auditorium_name     = '236-1',
        auditorium_capacity = 200,
        auditorium_type     = '��'
    where auditorium = '200-3a';
    commit;
    --rollback;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;

select *
from auditorium
where auditorium like '200%';
---------------------------------------6
begin
    update auditorium
    set auditorium_capacity = 'qwerty'
    where auditorium = '200-3a';
exception
    when others then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;
---------------------------------------7
begin
    insert into auditorium VALUES ('200-3b', '200-3b', 200, '��');
    commit;
    insert into auditorium VALUES ('200-3c', '200-3b', 200, '��');
    rollback;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;

select *
from auditorium
where auditorium like '200%';
---------------------------------------8
begin
    insert into auditorium VALUES ('200-3b', '200-3b', 200, '��');
    commit;
    exception
        when others
            then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;
---------------------------------------9
select *
from auditorium
where auditorium like '200%';

begin
    delete from auditorium where auditorium = '200-3b';
    commit;
    delete from auditorium where auditorium like '200%';
    rollback;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;
---------------------------------------10
begin
    delete from auditorium_type where auditorium_type = 'XXXX';
    if (sql%rowcount = 0) then
        raise no_data_found;
    end if;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;

select *
from AUDITORIUM_TYPE;
---------------------------------------11
declare
    cursor curs_teachers is select TEACHER, TEACHER_NAME, PULPIT
                            from TEACHER;
    m_teacher      TEACHER.TEACHER%type;
    m_teacher_name TEACHER.TEACHER_NAME%type;
    m_pulpit       TEACHER.PULPIT%type;
begin
    open curs_teachers;
    loop
        fetch curs_teachers into m_teacher, m_teacher_name, m_pulpit;
        exit when curs_teachers%notfound;
        dbms_output.put_line(' ' || curs_teachers%rowcount || ' '
            || m_teacher || ' '
            || m_teacher_name || ' '
            || m_pulpit);
    end loop;
    close curs_teachers;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------12
declare
    cursor curs_subject is
        select subject, subject_name, pulpit
        from subject;
    rec_subject subject%rowtype;
begin
    open curs_subject;
    dbms_output.put_line('rowcount = ' || curs_subject%rowcount);
    fetch curs_subject into rec_subject;
    while (curs_subject%found)
        loop
            dbms_output.put_line(' ' || curs_subject%rowcount || ' '
                || rec_subject.subject || ' '
                || rec_subject.subject_name || ' '
                || rec_subject.pulpit);
            fetch curs_subject into rec_subject;
        end loop;
    dbms_output.put_line('rowcount = ' || curs_subject%rowcount);
    close curs_subject;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------13
declare
    cursor curs_pulpit is
        select pulpit.pulpit, teacher.teacher_name
        from pulpit
                 join teacher
                      on pulpit.pulpit = teacher.pulpit;
    rec_pulpit curs_pulpit%rowtype;
begin
    for rec_pulpit in curs_pulpit
        loop
            dbms_output.put_line(' ' || curs_pulpit%rowcount || ' '
                || rec_pulpit.pulpit || ' '
                || rec_pulpit.teacher_name);
        end loop;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------14
declare
    cursor curs (capacity auditorium.auditorium_capacity%type, capacity1 auditorium.auditorium_capacity%type)
        is select auditorium, auditorium_capacity, auditorium_type
           from auditorium
           where auditorium_capacity >= capacity
             and auditorium_capacity <= capacity1;
    record curs%rowtype;
begin
    dbms_output.put_line('capacity < 20 :');
    for aum in curs(0, 20)
        loop
            dbms_output.put_line(aum.auditorium || ' ');
        end loop;

    dbms_output.put_line('21 < capacity < 30 :');
    open curs(21, 30);
    fetch curs into record;
    while curs%found
        loop
            dbms_output.put_line(record.auditorium || ' ');
            fetch curs into record;
        end loop;
    close curs;

    dbms_output.put_line('31 < capacity < 60 :');
    for aum in curs(31, 60)
        loop
            dbms_output.put_line(aum.auditorium || ' ');
        end loop;

    dbms_output.put_line('61 < capacity < 80 :');
    open curs(61, 80);
    fetch curs into record;
    loop
        dbms_output.put_line(record.auditorium || ' ');
        fetch curs into record;
        exit when curs%notfound;
    end loop;
    close curs;

    dbms_output.put_line('81 < capacity:');
    for aum in curs(81, 1000)
        loop
            dbms_output.put_line(aum.auditorium || ' ');
        end loop;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;
---------------------------------------15
declare
    type auditorium_ref is ref cursor return auditorium%rowtype;
    xcurs     auditorium_ref;
    xcurs_row xcurs%rowtype;
begin
    open xcurs for select * from auditorium;
    fetch xcurs into xcurs_row;
    loop
        exit when xcurs%notfound;
        dbms_output.put_line(' ' || xcurs_row.auditorium || ' ' || xcurs_row.auditorium_capacity);
        fetch xcurs into xcurs_row;
    end loop;
    close xcurs;

exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------16
declare
    cursor curs_aut
        is
        select auditorium_type,
               cursor
                   (select auditorium
                    from auditorium aum
                    where aut.auditorium_type = aum.auditorium_type)
        from auditorium_type aut;
    curs_aum sys_refcursor;
    aut      auditorium_type.auditorium_type%type;
    txt      varchar2(1000);
    aum      auditorium.auditorium%type;
begin
    open curs_aut;
    fetch curs_aut into aut, curs_aum;
    while(curs_aut%found)
        loop
            txt := rtrim(aut) || ': ';

            loop
                fetch curs_aum into aum;
                exit when curs_aum%notfound;
                txt := txt || rtrim(aum) || '; ';
            end loop;

            dbms_output.put_line(txt);
            fetch curs_aut into aut, curs_aum;
        end loop;

    close curs_aut;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------17
select *
from auditorium
order by auditorium;

declare
    cursor curs_auditorium(capacity auditorium.auditorium%type, capac auditorium.auditorium%type)
        is
        select auditorium, auditorium_capacity
        from auditorium
        where auditorium_capacity >= capacity
          and AUDITORIUM_CAPACITY <= capacity
            for update;
    aum auditorium.auditorium%type;
    cty auditorium.auditorium_capacity%type;
begin
    open curs_auditorium(40, 80);
    fetch curs_auditorium into aum, cty;

    while(curs_auditorium%found)
        loop
            cty := cty * 0.9;
            update auditorium
            set auditorium_capacity = cty
            where current of curs_auditorium;
            dbms_output.put_line(' ' || aum || ' ' || cty);
            fetch curs_auditorium into aum, cty;
        end loop;

    close curs_auditorium;
    --commit;
    rollback;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------18
select *
from auditorium
order by auditorium;

declare
    cursor curs_auditorium(minCapacity auditorium.auditorium%type, maxCapacity auditorium.auditorium%type)
        is
        select auditorium, auditorium_capacity
        from auditorium
        where auditorium_capacity >= minCapacity
          and AUDITORIUM_CAPACITY <= maxCapacity
            for update;
    aum auditorium.auditorium%type;
    cty auditorium.auditorium_capacity%type;
begin
    open curs_auditorium(0, 20);
    fetch curs_auditorium into aum, cty;

    while(curs_auditorium%found)
        loop
            delete auditorium
            where current of curs_auditorium;
            fetch curs_auditorium into aum, cty;
        end loop;
    close curs_auditorium;

    for pp in curs_auditorium(0, 120)
        loop
            dbms_output.put_line(' ' || pp.auditorium || ' ' || pp.auditorium_capacity);
        end loop;
    --commit;
    rollback;
exception
    when others then
        dbms_output.put_line(sqlerrm);
end;
---------------------------------------19
declare
    cursor cur(capacity auditorium.AUDITORIUM_CAPACITY%type)
        is select auditorium, auditorium_capacity, rowid
           from auditorium
           where auditorium_capacity >= capacity for update;
    aum auditorium.auditorium%type;
    cap auditorium.auditorium_capacity%type;
begin
    for xxx in cur(80)
        loop
            if xxx.auditorium_capacity >= 90
            then
                delete auditorium where rowid = xxx.rowid and xxx.auditorium_capacity >= 90;
            elsif xxx.auditorium_capacity >= 40
            then
                update auditorium
                set auditorium_capacity = auditorium_capacity + 3
                where rowid = xxx.rowid;
            end if;
        end loop;
    for yyy in cur(80)
        loop
            dbms_output.put_line(yyy.auditorium || ' ' || yyy.auditorium_capacity);
        end loop;
    --commit;
    rollback;
end;
---------------------------------------20
declare
    cursor curs_teachers is select TEACHER, TEACHER_NAME, PULPIT
                            from teacher;
    m_teacher      teacher.teacher%type;
    m_teacher_name teacher.teacher_name%type;
    m_pulpit       teacher.pulpit%type;
begin
    open curs_teachers;
    loop
        fetch curs_teachers into m_teacher, m_teacher_name, m_pulpit;
        exit when curs_teachers%notfound;
        dbms_output.put_line(' ' || curs_teachers%rowcount || ' ' || m_teacher || ' ' || m_teacher_name ||
                             ' ' || m_pulpit);
        if (mod(curs_teachers%rowcount, 3) = 0) then
            dbms_output.put_line('-----------------------');
        end if;
    end loop;
    close curs_teachers;
exception
    when others
        then dbms_output.put_line(sqlcode || ' ' || sqlerrm);
end;
