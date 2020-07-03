DELETE messages_table;
DELETE friends;
DELETE User_Inf;
DELETE user_state;

INSERT INTO user_state VALUES(NULL, '离线');
INSERT INTO user_state VALUES(NULL, '在线');

insert into USER_INF values(null, '1001', '000000001', '茶道', '男', null);
insert into USER_INF values(null, '1002', '000000002', '直男', '男', null);
insert into USER_INF values(null, '1003', '000000003', '小清新', '女', null);
insert into USER_INF values(null, '1004', '000000004', '大清新', '男', null);
insert into USER_INF values(null, '1005', '000000005', '维他', null, null);
insert into USER_INF values(null, '1006', '000000006', '柠檬', '男', null);
insert into USER_INF values(null, '1007', '000000007', '茶', '女', null);
insert into USER_INF values(null, '1008', '000000008', 'Lucy', '女', null);

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

insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('你好啊', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('你也好啊', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('你叫什么名字', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('我叫XXX，那你呢', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('我叫YYY，你在干嘛', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('没干嘛', 2, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('那再见', 1, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('你好啊', 1, 3);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('再见', 3, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('再见', 1, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('？？？', 4, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('什么', 4, 1);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('刚刚有个刚认识的跟我说再见', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('真是太奇怪了', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('是啊，第一句就是再见', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('其实刚刚也有人这么跟我说', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('那是个叫XXX的人', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('哦，连名字都知道了', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('是啊', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('就这样吧，再见', 2, 4);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('？？？', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('？？？？', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('？？？？？', 4, 2);
insert into messages_table(M_MeSSAGE, m_Fromuserid, m_touserid) values('？？？？？？', 4, 2);

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




