USE POTEL;

CREATE TABLE IF NOT EXISTS USERS(
	USERID		INT				NOT NULL,
	ROLEID		INT				NOT NULL,
	NAME		VARCHAR(30)		NOT NULL,
	STATUS		CHAR(1)			NOT NULL DEFAULT '1',
	EMAIL		VARCHAR(100)	NOT NULL,
	PASSWD		VARCHAR(30)		NOT NULL,
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE USERS ADD CONSTRAINT PK_USERS_USERID PRIMARY KEY(USERID);
ALTER TABLE USERS MODIFY USERID INT AUTO_INCREMENT;
ALTER TABLE USERS AUTO_INCREMENT = 10;
-- ALTER TABLE USERS ADD CONSTRAINT FK_USERS_ROLEID FOREIGN KEY(ROLEID) REFERENCES ROLES(ROLEID);



CREATE TABLE IF NOT EXISTS ROLES(
	ROLEID		INT				NOT NULL,
	DESCPT		VARCHAR(15)		NOT NULL,
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE ROLES ADD CONSTRAINT PK_ROLES_ROLEID PRIMARY KEY(ROLEID);
ALTER TABLE ROLES MODIFY ROLEID INT AUTO_INCREMENT;
-- ALTER TABLE ROLES AUTO_INCREMENT = 10;



CREATE TABLE IF NOT EXISTS NOTIFYMSG(
	MESSAGEID	INT				NOT NULL,
	TITLE		VARCHAR(50)		NOT NULL,
	MESSAGE		VARCHAR(250)	NOT NULL,
	CREATORID	INT				,
	SENDDATE	DATE			,
	RECEIVETYPE	CHAR(1)			NOT NULL,
	USERID		INT 			,
	MEMBERID	INT				,
	STATUS		CHAR(1)			NOT NULL DEFAULT '0',
	TSTATUS		CHAR(1)			NOT NULL DEFAULT '0',
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE NOTIFYMSG ADD CONSTRAINT PK_NOTIFYMSG_MESSAGEID PRIMARY KEY(MESSAGEID);
ALTER TABLE NOTIFYMSG MODIFY MESSAGEID INT AUTO_INCREMENT;
-- ALTER TABLE NOTIFYMSG AUTO_INCREMENT = 10;
-- ALTER TABLE NOTIFYMSG ADD CONSTRAINT FK_NOTIFYMSGE_CREATORID FOREIGN KEY(CREATORID) REFERENCES USERS(USERID);
-- ALTER TABLE NOTIFYMSG ADD CONSTRAINT FK_NOTIFYMSGE_USERID FOREIGN KEY(USERID) REFERENCES USERS(USERID);
-- ALTER TABLE NOTIFYMSG ADD CONSTRAINT FK_NOTIFYMSGE_MEMBERID FOREIGN KEY(MEMBERID) REFERENCES MEMBERS(MEMBERID);


CREATE TABLE IF NOT EXISTS MEMBERS(
	MEMBERID	INT			    NOT NULL,
	NAME		VARCHAR(30)		NOT NULL,
	CELLPHONE	VARCHAR(20)		NOT NULL,
	ADDRESS		VARCHAR(100)	NOT NULL,
	GENDER		CHAR(1)			NOT NULL,
	BIRTHDAY	DATE			,
	EMAIL		VARCHAR(100)	NOT NULL,
	PASSWD		VARCHAR(30)		NOT NULL,
	IMAGEID		INT				,
	STATUS		CHAR(1)			NOT NULL DEFAULT '1',
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE MEMBERS ADD CONSTRAINT PK_MEMBERS_MEMBERID PRIMARY KEY(MEMBERID);
ALTER TABLE MEMBERS MODIFY MEMBERID INT AUTO_INCREMENT;
-- ALTER TABLE MEMBERS AUTO_INCREMENT = 1;
-- ALTER TABLE MEMBERS ADD CONSTRAINT FK_MEMBERS_IMAGEID FOREIGN KEY(IMAGEID) REFERENCES IMAGES(IMAGEID);

CREATE TABLE IF NOT EXISTS PETS(
	PETID		INT				NOT NULL,
	PETTYPE		CHAR(1)			NOT NULL DEFAULT 'D',
	NICKNAME	VARCHAR(20)		NOT NULL,
	WEIGHT		DECIMAL(5,1)	NOT NULL,
	BREED		VARCHAR(15)		,
	IMAGEID		INT				,
	STATUS		CHAR(1)			NOT NULL DEFAULT '1',
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE PETS ADD CONSTRAINT PK_PETS_PETID PRIMARY KEY(PETID);
ALTER TABLE PETS MODIFY PETID INT AUTO_INCREMENT;
-- ALTER TABLE PETS AUTO_INCREMENT = 10;
-- ALTER TABLE PETS ADD CONSTRAINT FK_PETS_IMAGEID FOREIGN KEY(IMAGEID) REFERENCES IMAGES(IMAGEID);



CREATE TABLE IF NOT EXISTS MEMPETREL(
	MEMBERID	INT				NOT NULL,
	PETID		INT				NOT NULL,
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE MEMPETREL ADD CONSTRAINT PK_MEMPETREL_MEMBERID_PETID PRIMARY KEY(MEMBERID,PETID);
-- ALTER TABLE MEMPETREL ADD CONSTRAINT FK_MEMPETREL_MEMBERID FOREIGN KEY(MEMBERID) REFERENCES MEMBERS(MEMBERID);
-- ALTER TABLE MEMPETREL ADD CONSTRAINT FK_MEMPETREL_PETID FOREIGN KEY(PETID) REFERENCES PETS(PETID);


CREATE TABLE IF NOT EXISTS CARELOGS(
	LOGID		INT				NOT NULL,
	ORDERID		INT				NOT NULL,
	PETID		INT				NOT NULL,
	NOTE		VARCHAR(500)	NOT NULL,
	USERID		INT				NOT NULL,
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE CARELOGS ADD CONSTRAINT PK_CARELOGS_LOGID PRIMARY KEY(LOGID);
ALTER TABLE CARELOGS MODIFY LOGID INT AUTO_INCREMENT;
-- ALTER TABLE CARELOGS AUTO_INCREMENT = 10;
-- ALTER TABLE CARELOGS ADD CONSTRAINT FK_CARELOGS_ORDERID FOREIGN KEY(ORDERID) REFERENCES ORDERS(ORDERID);
-- ALTER TABLE CARELOGS ADD CONSTRAINT FK_CARELOGS_PETID FOREIGN KEY(PETID) REFERENCES PETS(PETID);
-- ALTER TABLE CARELOGS ADD CONSTRAINT FK_CARELOGS_USERID FOREIGN KEY(USERID) REFERENCES USERS(USERID);


CREATE TABLE IF NOT EXISTS ROOMTYPE(
	ROOMTYPEID	INT				NOT NULL,
	DESCPT		VARCHAR(300)	NOT NULL,
	IMAGEID		INT				NOT NULL,
	PRICE		INT				NOT NULL,
	PETTYPE		CHAR(1)			NOT NULL DEFAULT 'D',
	WEIGHTL		INT				,
	WEIGHTH		INT				,
	STATUS		CHAR(1)			NOT NULL DEFAULT '1',
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE ROOMTYPE ADD CONSTRAINT PK_ROOMTYPE_ROOMTYPEID PRIMARY KEY(ROOMTYPEID);
ALTER TABLE ROOMTYPE MODIFY ROOMTYPEID INT AUTO_INCREMENT;
-- ALTER TABLE ROOMTYPE ADD CONSTRAINT FK_ROOMTYPE_IMAGEID FOREIGN KEY(IMAGEID) REFERENCES IMAGES(IMAGEID);


CREATE TABLE IF NOT EXISTS ROOM(
	ROOMID			VARCHAR(10)		NOT NULL,
	ROOMTYPEID		INT				NOT NULL,
	CSTATUS			CHAR(1)			NOT NULL DEFAULT '0',
	LSTATUS			CHAR(1)			NOT NULL DEFAULT '0',
	MONITORSTATUS	CHAR(1)			NOT NULL DEFAULT '0',
	PETID			INT				,
	CREATEDATE	DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  DATETIME
);
ALTER TABLE ROOM ADD CONSTRAINT PK_ROOM_ROOMID PRIMARY KEY(ROOMID);
ALTER TABLE ROOM MODIFY ROOMID INT AUTO_INCREMENT;
-- ALTER TABLE ROOM ADD CONSTRAINT FK_ROOM_ROOMTYPEID FOREIGN KEY(ROOMTYPEID) REFERENCES ROOMTYPE(ROOMTYPEID);
-- ALTER TABLE ROOM ADD CONSTRAINT FK_ROOM_PETID FOREIGN KEY(PETID) REFERENCES PETS(PETID);




CREATE TABLE IF NOT EXISTS ORDERS(
	ORDERID			INT				NOT NULL,
	MEMBERID		INT				NOT NULL,
	ROOMTYPEID		INT				NOT NULL,
	ROOMID			INT				NOT NULL,
	EXPDATES		DATE			NOT NULL,
	EXPDATEE		DATE			NOT NULL,
	DATES			DATE			,
	DATEE			DATE			,
	AMOUNT			INT				NOT NULL,
	REFUNDAMOUNT	INT				,
	PETID			INT				NOT NULL,
	ORDERSTATE		CHAR(1)			NOT NULL DEFAULT '0',
	PAYMENTSTATE	CHAR(1)			NOT NULL DEFAULT '0',
	REFUNDSTATE		CHAR(1)			NOT NULL DEFAULT '0',
	SCORE			INT				,
	COMMENT			VARCHAR(300)	,
	PAYDATETIME		DATETIME		,
	REFUNDDATETIME	DATETIME		,
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDERS_ORDERID PRIMARY KEY(ORDERID);
ALTER TABLE ORDERS MODIFY ORDERID INT AUTO_INCREMENT;
-- ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_MEMBERID FOREIGN KEY(MEMBERID) REFERENCES MEMBERS(MEMBERID);
-- ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_ROOMTYPEID FOREIGN KEY(ROOMTYPEID) REFERENCES ROOMTYPE(ROOMTYPEID);
-- ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_ROOMID FOREIGN KEY(ROOMID) REFERENCES ROOM(ROOMID);
-- ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_PETID FOREIGN KEY(PETID) REFERENCES PETS(PETID);



CREATE TABLE IF NOT EXISTS ROOMTYPECTRL(
	ROOMTYPEID		INT				NOT NULL,
	BOOKDAY			DATE			NOT NULL,
	TOTALCOUNT		INT				NOT NULL,
	ORDEREDCOUNT	INT				NOT NULL,
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE ROOMTYPECTRL ADD CONSTRAINT PK_ROOMTYPECTRL_ROOMTYPEID_BOOKDAY PRIMARY KEY(ROOMTYPEID,BOOKDAY);


CREATE TABLE IF NOT EXISTS PRODUCTS(
	PRDID			INT				NOT NULL,
	PRDNAME			VARCHAR(50)		NOT NULL,
	PRICE			INT				NOT NULL,
	IMAGEID			INT				NOT NULL,
	PRDDESC			VARCHAR(250)	NOT NULL,
	PRDTYPE         CHAR(1)			NOT NULL DEFAULT 'D',
    STATUS			CHAR(1)			NOT NULL DEFAULT 'e',
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE PRODUCTS ADD CONSTRAINT PK_PRODUCTS_PRDID PRIMARY KEY(PRDID);
ALTER TABLE PRODUCTS MODIFY PRDID INT AUTO_INCREMENT;
-- ALTER TABLE PRODUCTS ADD CONSTRAINT FK_PRODUCTS_IMAGEID FOREIGN KEY(IMAGEID) REFERENCES IMAGES(IMAGEID);




CREATE TABLE IF NOT EXISTS PRDORDERS(
	PRDORDERID		INT				NOT NULL,
	MEMBERID		INT				NOT NULL,
	AMOUNT			INT				NOT NULL,
	STATUS			CHAR(1)			NOT NULL DEFAULT '1',
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE PRDORDERS ADD CONSTRAINT PK_PRDORDERS_PRDORDERID PRIMARY KEY(PRDORDERID);
ALTER TABLE PRDORDERS MODIFY PRDORDERID INT AUTO_INCREMENT;
-- ALTER TABLE PRDORDERS ADD CONSTRAINT FK_PRDORDERS_MEMBERID FOREIGN KEY(MEMBERID) REFERENCES MEMBERS(MEMBERID);



CREATE TABLE IF NOT EXISTS PRDORDITEMS(
	PRDORDITEMID	INT				NOT NULL,
	PRDORDERID		INT				NOT NULL,
	PRDID			INT				NOT NULL,
	PRDCOUNT		INT				NOT NULL,
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE PRDORDITEMS ADD CONSTRAINT PK_PRDORDITEMS_PRDORDITEMID PRIMARY KEY(PRDORDITEMID);
ALTER TABLE PRDORDITEMS MODIFY PRDORDITEMID INT AUTO_INCREMENT;
-- ALTER TABLE PRDORDITEMS ADD CONSTRAINT FK_PRDORDITEMS_PRDORDERID FOREIGN KEY(PRDORDERID) REFERENCES PRDORDERS(PRDORDERID);
-- ALTER TABLE PRDORDITEMS ADD CONSTRAINT FK_PRDORDITEMS_PRDID FOREIGN KEY(PRDID) REFERENCES PRODUCTS(PRDID);



CREATE TABLE IF NOT EXISTS IMAGES(
	IMAGEID			INT				NOT NULL,
	IMAGEDATA		MEDIUMBLOB		NOT NULL,
	CREATEDATE		DATETIME		NOT NULL DEFAULT CURRENT_TIMESTAMP,
	MODIFYDATE  	DATETIME
);
ALTER TABLE IMAGES ADD CONSTRAINT PK_IMAGES_IMAGEID PRIMARY KEY(IMAGEID);
ALTER TABLE IMAGES MODIFY IMAGEID INT AUTO_INCREMENT;



CREATE TABLE IF NOT EXISTS FORUM (
    POSTID INT NOT NULL AUTO_INCREMENT PRIMARY KEY , -- 貼文編號
    MEMBERID INT NOT NULL, -- 會員編號
    TITLE VARCHAR(200) NOT NULL, -- 討論標題
    CONTENT VARCHAR(1000) NOT NULL, -- 討論內容
    CREATEDATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 建立日期
    MODIFYDATE DATETIME,
    POSTIMAGEID INT -- 貼文圖片（可選）
);
-- ALTER TABLE FORUM ADD CONSTRAINT FK_FORUM_MEMBERID FOREIGN KEY(MEMBERID) REFERENCES MEMBERS(MEMBERID);
-- ALTER TABLE FORUM ADD CONSTRAINT FK_FORUM_IMAGEID FOREIGN KEY(IMAGEID) REFERENCES IMAGES(IMAGEID);



CREATE TABLE IF NOT EXISTS COMMENTS (
    COMMENTID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 留言編號
    POSTID INT NOT NULL, -- 貼文編號
    MEMBERID INT NOT NULL, -- 留言會員編號
    CONTENT VARCHAR(150) NOT NULL, -- 討論貼文內容
    CREATEDATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 建立日期
    MODIFYDATE DATETIME -- 修改日期（可選）
);
-- ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_POSTID FOREIGN KEY (POSTID) REFERENCES FORUM(POSTID);
-- ALTER TABLE COMMENTS ADD CONSTRAINT FK_COMMENTS_MEMBERID FOREIGN KEY (MEMBERID) REFERENCES MEMBERS(MEMBERID);



CREATE TABLE IF NOT EXISTS LIKES (
    LIKEID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- 按讚內容編號
    MEMBERID INT NOT NULL, -- 按讚會員編號
    POSTID INT NOT NULL, -- 貼文編號
    CREATEDATE DATETIME DEFAULT CURRENT_TIMESTAMP -- 按讚時間
);
-- ALTER TABLE LIKES ADD CONSTRAINT FK_LIKES_MEMBERID FOREIGN KEY (MEMBERID) REFERENCES MEMBERS(MEMBERID);
-- ALTER TABLE LIKES ADD CONSTRAINT FK_LIKES_POSTID FOREIGN KEY (POSTID) REFERENCES FORUM(POSTID);
-- ALTER TABLE LIKES ADD CONSTRAINT UQ_LIKES_MEMBER_POST UNIQUE (MEMBERID, POSTID);
