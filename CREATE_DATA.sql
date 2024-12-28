insert into members(NAME,CELLPHONE,ADDRESS,GENDER,EMAIL,PASSWD)
 values('Dawn','0911123457','104台北市中山區南京東路三段219號4F','F','dawn@gmail.com',x'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae'),
 ('Jim','0911123458','104台北市中山區南京東路三段219號4F','M','jim@gmail.com',x'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae'),
 ('Riley','0911123459','104台北市中山區南京東路三段219號4F','F','riley@gmail.com',x'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae'),
 ('Sen','0911123460','104台北市中山區南京東路三段219號4F','M','sen@gmail.com',x'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae'),
 ('Kent','0911123461','104台北市中山區南京東路三段219號4F','M','kent@gmail.com',x'e9cee71ab932fde863338d08be4de9dfe39ea049bdafb342ce659ec5450b69ae');


insert into orders(MEMBERID,ROOMTYPEID,ROOMID,EXPDATES,EXPDATEE,AMOUNT,PETID)
values(1,1,1,'2025-01-15','2025-01-18',5000,1),
(2,1,2,'2025-01-15','2025-01-18',5000,2),
(3,1,3,'2025-01-15','2025-01-18',5000,3),
(1,2,4,'2025-01-15','2025-01-18',5000,4);

insert into roomtype(ROOMTYPEID,DESCPT,IMAGEID,PRICE,PETTYPE,WEIGHTL,WEIGHTH)
VALUES(1,'海景房',1,1000,'D',5,8),
(2,'山景房',2,2000,'C',null,null);

insert into room(ROOMID,ROOMTYPEID)
values(1,1),
(2,1),
(3,1),
(4,2);

insert into images(IMAGEDATA)
values(x'1234'), -- 1. roomtype 海景房
(x'1234'); -- 2.roomtype 山景房
