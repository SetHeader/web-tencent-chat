DELETE messages_table;
DELETE friends;
DELETE User_Inf;
DELETE user_state;

INSERT INTO user_state VALUES(NULL, '����');
INSERT INTO user_state VALUES(NULL, '����');

insert into USER_INF values(null, '1001', '000000001', '���', '��', null);
insert into USER_INF values(null, '1002', '000000002', 'ֱ��', '��', null);
insert into USER_INF values(null, '1003', '000000003', 'С����', 'Ů', null);
insert into USER_INF values(null, '1004', '000000004', '������', '��', null);
insert into USER_INF values(null, '1005', '000000005', 'ά��', null, null);
insert into USER_INF values(null, '1006', '000000006', '����', '��', null);
insert into USER_INF values(null, '1007', '000000007', '��', 'Ů', null);
insert into USER_INF values(null, '1008', '000000008', 'Lucy', 'Ů', null);

insert into friends(F_USERID, F_FRIENDID) values(1, 2);
insert into friends(F_USERID, F_FRIENDID) values(2, 1);
insert into friends(F_USERID, F_FRIENDID) values(1, 3);
insert into friends(F_USERID, F_FRIENDID) values(3, 1);
insert into friends(F_USERID, F_FRIENDID) values(1, 4);
insert into friends(F_USERID, F_FRIENDID) values(4, 1);
insert into friends(F_USERID, F_FRIENDID) values(2, 4);
insert into friends(F_USERID, F_FRIENDID) values(4, 2);
insert into friends(F_USERID, F_FRIENDID) values(1, 6);
insert into friends(F_USERID, F_FRIENDID) values(6, 1);
insert into friends(F_USERID, F_FRIENDID) values(5, 2);
insert into friends(F_USERID, F_FRIENDID) values(2, 5);
insert into friends(F_USERID, F_FRIENDID) values(2, 6);
insert into friends(F_USERID, F_FRIENDID) values(6, 2);
insert into friends(F_USERID, F_FRIENDID) values(3, 4);
insert into friends(F_USERID, F_FRIENDID) values(4, 3);
insert into friends(F_USERID, F_FRIENDID) values(4, 6);
insert into friends(F_USERID, F_FRIENDID) values(6, 4);
insert into friends(F_USERID, F_FRIENDID) values(4, 5);
insert into friends(F_USERID, F_FRIENDID) values(5, 4);
insert into friends(F_USERID, F_FRIENDID) values(5, 6);
insert into friends(F_USERID, F_FRIENDID) values(6, 5);

insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('��ð�', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('��Ҳ�ð�', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('���ʲô����', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ҽ�XXX��������', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ҽ�YYY�����ڸ���', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('û����', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('���ټ�', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('��ð�', 1, 3);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ټ�', 3, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ټ�', 1, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('������', 4, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('ʲô', 4, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ո��и�����ʶ�ĸ���˵�ټ�', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('����̫�����', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ǰ�����һ������ټ�', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('��ʵ�ո�Ҳ������ô����˵', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('���Ǹ���XXX����', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('Ŷ�������ֶ�֪����', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�ǰ�', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('�������ɣ��ټ�', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('������', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('��������', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('����������', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('������������', 4, 2);

select * from user_inf;
select * from friends;
select * from messages_table;

COMMIT;



CREATE TABLE mylog (
  ID NUMBER PRIMARY KEY,
  message VARCHAR2(128),
  data_time DATE
);
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
CREATE OR REPLACE PACKAGE mypack AS
  PROCEDURE put(
     message VARCHAR2
  );
END;
/
CREATE OR REPLACE PACKAGE BODY mypack AS
  PROCEDURE put(
     message VARCHAR2
  ) AS
  BEGIN
    INSERT INTO mylog VALUES(NULL, message, SYSDATE());
  END;
END;
/




COMMIT;




