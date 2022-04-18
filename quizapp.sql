create database QuizApp
go 
use QuizApp

create table Account
(
	username varchar(50) primary key,
	password varchar(50) not null,
	name nvarchar(50) not null,
	age int not null,
	role int not null
)

create table TitleQuiz
(
	catelogy nvarchar(50),
	title nvarchar(50) not null
)

create table Quiz
(
	quizID int identity(1,1) primary key,
	name nvarchar(50) not null,
	catelogy nvarchar(50) not null,
	image varchar(500) not null,
	numberQuestion int not null
)

create table Question
(
	questionID int identity(1,1) primary key,
	question nvarchar(500) null,
	answerA nvarchar(500)  null,
	answerB nvarchar(500)  null,
	answerC nvarchar(500)  null,
	answerD nvarchar(500)  null,
	correctAnswer nvarchar(50) not null,
	image varchar(500) null,
	audio varchar(500) null,
	quizID int not null,
	CONSTRAINT FK_Quiz_Quiztion FOREIGN KEY (quizID)
    REFERENCES Quiz(quizID)
)

create table User_Quiz
(
	username varchar(50),
	quizID int,
	score int not null,
	primary key(username,quizID),
	CONSTRAINT FK_UserQuiz FOREIGN KEY (username)
    REFERENCES Account(username),
	CONSTRAINT FK_QuizUser FOREIGN KEY (quizID)
    REFERENCES Quiz(quizID)
)

insert into Account values
(
	'nghia1','123',N'Nghĩa',6,1
)

insert into Quiz values
(
	N'Toán 1 sơ cấp','toan1','https://teky.edu.vn/blog/wp-content/uploads/2020/12/tai-sao-phai-hoc-toan.jpg',3
)

insert into Question(question,answerA,answerB,answerC,answerD,correctAnswer,quizID) values
(
	'1+1=','1','2','3','4','B',1
),
(
	'1+2=','1','2','3','4','C',1
),
(
	'1+4=','1','2','5','4','C',1
)

select * from Quiz where catelogy='toan1'

select title from TitleQuiz where catelogy='toan1'

select * from User_Quiz


insert into Question(correctAnswer,audio,quizID) values
('A','chucai/e.mp3',9),
('C','chucai/g.mp3',9),
('D','chucai/i.mp3',9),
('B','chucai/l.mp3',9),
('A','chucai/n.mp3',9),
('B','chucai/o1.mp3',9),
('D','chucai/p.mp3',9),
('C','chucai/r.mp3',9),
('C','chucai/t.mp3',9),
('D','chucai/u1.mp3',9),
('A','chucai/x.mp3',9),
('A','chucai/e1.mp3',9),
('A','chucai/h.mp3',9),
('B','chucai/k.mp3',9),
('B','chucai/m.mp3',9),
('A','chucai/o.mp3',9),
('C','chucai/o2.mp3',9),
('C','chucai/q.mp3',9),
('B','chucai/s.mp3',9),
('D','chucai/u.mp3',9),
('D','chucai/v.mp3',9),
('A','chucai/y.mp3',9)

insert into Question(correctAnswer,audio,quizID) values
('A','chuso/0.mp3',10),
('C','chuso/1.mp3',10),
('D','chuso/2.mp3',10),
('B','chuso/3.mp3',10),
('A','chuso/4.mp3',10),
('B','chuso/5.mp3',10),
('D','chuso/6.mp3',10),
('C','chuso/7.mp3',10),
('C','chuso/8.mp3',10),
('C','chuso/9.mp3',10)

update Account
set password='1234',name='Nghĩa',age=4
where username=?

select * from Account where username='n'

select count(1) from Account where role>0

SELECT * FROM Account WHERE role>0 ORDER BY username OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY

update Quiz
set name='1234',catelogy='Nghĩa',image=?,numberQuestion=4
where quizID=?

select catelogy from TitleQuiz
select * from Quiz

/* update xóa */
declare @quizID as int 
set @quizID = (select quizID from Question where questionID=1)
update Quiz
set numberQuestion= questionUpdate.number
from
(select count(1)-1 as number from Question 
where quizID=@quizID) as questionUpdate
where Quiz.quizID=@quizID

select * from Question where quizID=1
/* update thêm */
update Quiz 
set numberQuestion= questionUpdate.number
from (select count(1) as number from Question where quizID=17) as questionUpdate
where quizID=17

-- quiz da lam

select q.*,uq.score
from User_Quiz as uq join Quiz as q on uq.quizID=q.quizID
where username='nghia1'	

select * from Question

update Question
set question='1+1=',answerA='1',answerB='2',answerC='8',answerD='4',correctAnswer='B',image=null,audio=null,quizID='1'
where questionID=1 

select * from Account