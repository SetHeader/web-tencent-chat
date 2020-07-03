
--通过U_ID 来保存信息
CREATE OR REPLACE PROCEDURE add_message(
  message IN messages_table.m_message%TYPE,
  FROMUSERID IN user_inf.u_id%TYPE,
  TOUSERID IN user_inf.u_id%TYPE
) AS
begin
  INSERT INTO messages_table(M_MESSAGE, M_FROMUSERID, M_TOUSERID) VALUES(message, FROMUSERID, TOUSERID);
end;
/
--通过 U_LOGINID 来保存信息
CREATE OR REPLACE PROCEDURE add_message2 (
  message IN messages_table.m_message%TYPE,
  FROMLOGINID IN user_inf.u_loginid%TYPE,
  TOLOGINID IN user_inf.u_loginid%TYPE
) AS 
FROMUSERID user_inf.u_id%TYPE;
TOUSERID user_inf.u_id%TYPE;
BEGIN
  SELECT u_id INTO FROMUSERID FROM user_inf WHERE u_loginid = FROMLOGINID;
  SELECT u_id INTO TOUSERID FROM user_inf WHERE u_loginid = TOLOGINID;
  add_message(message, FROMUSERID, TOUSERID);
END;
/

--通过U_ID来添加朋友
CREATE OR REPLACE PROCEDURE add_friend(
  uid1 user_inf.u_id%TYPE,
  uid2 user_inf.u_id%TYPE
) AS
BEGIN
  INSERT INTO friends VALUES(NULL, uid1, uid2);
  INSERT INTO friends VALUES(NULL, uid2, uid1);
END;
/
CREATE OR REPLACE PROCEDURE user_register(
  v_loginid user_inf.u_loginid%TYPE,
  v_password user_inf.u_password%TYPE,
  v_nickname user_inf.u_nickname%TYPE,
  v_sex user_inf.u_sex%TYPE,
  isOK OUT int
) AS
flag BOOLEAN := FALSE;
BEGIN
  INSERT INTO user_inf VALUES(NULL, v_loginid, v_password, v_nickname, v_sex, NULL);
  isOK := 1;
  EXCEPTION
  WHEN OTHERS THEN
    isOK := 0;
END;
/

CREATE OR REPLACE PROCEDURE user_login(
  v_uid user_inf.u_id%TYPE
) AS
  v_usid user_state.us_id%TYPE;
BEGIN
  SELECT us_id INTO v_usid FROM user_state WHERE us_name = '在线';
  UPDATE user_inf SET u_state = v_usid WHERE u_id = v_uid;
END;
/

CREATE OR REPLACE PROCEDURE user_offline(
  v_uid user_inf.u_id%TYPE
)  AS
  v_usid user_state.us_id%TYPE;
BEGIN
  SELECT us_id INTO v_usid FROM user_state WHERE us_name = '离线';
  UPDATE user_inf SET u_state = v_usid WHERE u_id = v_uid;
END;
/

CREATE OR REPLACE FUNCTION isUserExist(
  v_uid NUMBER
) RETURN BOOLEAN AS
returnVal BOOLEAN := FALSE;
v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count FROM user_inf WHERE u_id = v_uid;
  IF (SQL%FOUND) THEN
    returnVal := TRUE;
  END IF;
  RETURN returnVal;
END;
/

CREATE OR REPLACE TYPE friendsType AS OBJECT (
  v_id NUMBER,
  v_uid VARCHAR2(20),
  v_uname VARCHAR2(20), 
  v_usex VARCHAR2(3), 
  v_ustate VARCHAR2(5)
)
/

CREATE OR REPLACE TYPE friendsTable AS TABLE OF friendstype;
/

CREATE OR REPLACE PROCEDURE getUserFriends(
  v_uid user_inf.u_id%TYPE
) RETURN friendsTable AS
f_table friendsTable := friendsTable();
BEGIN
  SELECT U_ID, U_LOGINID, U_NICKNAME, U_SEX, U_STATE
  FROM user_inf
  JOIN friends ON U_ID = F_FRIENDID
  WHERE F_USERID = 1;
  RETURN f_table;
END;
/

CREATE OR REPLACE PROCEDURE getUserMessage(
  v_uid user_inf.u_id%TYPE,
  v_friendid user_inf.u_id%TYPE
) AS
BEGIN
  SELECT M_message, m_time, m_fromuserid, m_touserid 
  FROM messages_table
  WHERE (m_fromuserid = v_uid AND m_touserid = v_friendid) OR 
        (m_fromuserid = v_friendid AND m_touserid = v_userid)
END;
/
