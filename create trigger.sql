CREATE sequence U_ID 
increment by 1
start with 1;
/
create sequence US_ID 
increment by 1
start WITH 1;
/
create sequence F_ID 
increment by 1
start with 1;
/
create sequence M_ID 
increment by 1
start with 1;
/

CREATE TABLE mylog (
  ID NUMBER PRIMARY KEY,
  message VARCHAR2(128),
  data_time DATE
)
/
CREATE SEQUENCE SEQ_MYLOG_ID
INCREMENT BY 1
START WITH 1;
/

CREATE OR REPLACE TRIGGER trigger_mylog_insert 
BEFORE INSERT
ON mylog
FOR EACH ROW
BEGIN
  :new.id := seq_mylog_id.Nextval;
END;
/


create or replace trigger trigger_user_inf_insert
before insert
on user_inf
for each row
begin
   :new.u_id := U_ID.NEXTVAL;
end;
/

create or replace trigger trigger_friends_insert
before insert
on friends
for each row
begin
    :new.f_id := F_ID.NEXTVAL;
end;
/

create or replace trigger trigger_user_state_insert
before insert
on user_state
for each row
begin
    :new.us_id := US_ID.NEXTVAL;
end;
/

create or replace trigger trigger_messages_table_insert
before insert
on messages_table
for each row
begin
    :new.m_id := M_ID.NEXTVAL;
end;
/
create or replace trigger trigger_USER_INF_U_ID
after update of U_ID
on USER_INF
for each row
begin
     update friends set F_USERID = :new.u_id where F_USERID = :old.u_id;
     update friends set F_FRIENDID = :new.u_id where F_FRIENDID = :old.u_id;
     update Messages_Table set M_FROMUSERID = :new.u_id where M_FROMUSERID = :old.u_id;
     update messages_table set M_TOUSERID = :new.u_id where M_TOUSERID = :old.u_id;
end;
/
