drop table messages_table;
drop table friends;
drop table user_inf;
drop table user_state;

create table user_state (
	US_ID int primary key,
	US_Name varchar2(10) not null
  );
/

create table user_inf (
	U_ID int primary key,
	U_LoginID varchar2(20) unique not null,
	U_Password varchar2(20) check(length(U_Password) > 8) not null,
	U_NickName varchar2(20),
	U_Sex varchar2(3) check(U_Sex in ('ÄÐ', 'Å®', 'ÎÞ')),
	U_State int references user_state(US_ID)
);
/

create table friends (
	F_ID int primary key,
  F_UserID int references user_inf(U_ID),
	F_FriendID int references user_inf(U_ID),
  UNIQUE(F_UserID, F_FriendID)
);
/

create table  messages_table (
	M_ID int primary key,
	M_Message varchar2(256),
	M_Time date default(sysdate),
	M_FromUserID int references user_inf(U_ID),
	M_ToUserID int references user_inf(U_ID)
);
/

