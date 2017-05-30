drop table station_connect;
drop table review_comment;
drop table advertisement;
drop table burn_comment;
drop table burn_board;
drop table check_in;
drop table friend;
drop table hashtag;
drop table interested_place;
drop table review;
drop table place;
drop table station;
drop table member;
drop table manager;


create table member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	name varchar2(100) not null,
	sex varchar2(100) not null,
	tel varchar2(100) not null
);

create table station(
	name varchar2(100) primary key,
	detail clob not null,
	stayed_time number default 0
);

create table place(
	no number primary key,
	name varchar2(100) not null,
	station_name varchar2(100) not null,
	constraint fk_station_name foreign key(station_name) references station(name),
	area varchar2(100) not null
);
 
drop sequence place_seq;
create sequence place_seq nocache;


create table review(
	no number primary key,
	title varchar2(100) not null,
	content clob not null,
	posted_time date not null,
	recommend number default 0,
	hits number default 0,
	star number not null,
	place_no number not null,
	member_id varchar2(100) not null,
	constraint fk_place_no foreign key(place_no) references place(no),
	constraint fk_member_id foreign key(member_id) references member(id)	
);

drop sequence review_seq;
create sequence review_seq nocache;

create table review_comment(
	no number primary key,	
	content clob not null,
	posted_time date not null,
	recommend number default 0,
	review_no number, 
	member_id varchar2(100) not null,
	constraint fk_review_comment_no foreign key(review_no) references review(no),
	constraint fk_review_comment_member_id foreign key(member_id) references member(id)	
);
drop sequence review_comment_seq;
create sequence review_comment_seq nocache;

create table hashtag(
	no number primary key,
	word varchar2(100) not null,
	review_no number not null,
	constraint fk_hashtag_review_no foreign key(review_no) references review(no)
);
drop sequence hashtag_seq;
create sequence hashtag_seq nocache;

create table burn_board(
	no number primary key,
	title varchar2(100) not null,
	posted_time date not null,
	content clob not null,
	station_name varchar2(100) not null,
	member_id varchar2(100) not null,
	hits number default 0,	 
	constraint fk_burn_station_name foreign key(station_name) references station(name),
	constraint fk_burn_board_id foreign key(member_id) references member(id)	
); 
 
drop sequence burn_board_seq;
create sequence burn_board_seq nocache;


create table burn_comment(
	no number primary key,
	content clob not null,
	posted_time date not null,
	recomment number default 0,
	burn_no number not null,
	member_id varchar2(100) not null,
	constraint fk_burn_comment_no foreign key(burn_no) references burn_board(no),
	constraint fk_burn_comment_id foreign key(member_id) references member(id)	
);
drop sequence burn_comment_seq;
create sequence burn_comment_seq nocache;


create table advertisement(
	no number primary key,
	link varchar2(1000) not null
);
drop sequence advertisement_seq;
create sequence advertisement_seq nocache;


create table manager(
	id varchar2(100) primary key,
	password varchar2(100) not null
);

create table friend(
	sender_id varchar2(100) not null,
	receiver_id varchar2(100) not null,
	state varchar2(100) not null,
	put_date date not null,
	constraint fk_sender_id foreign key(sender_id) references member(id),
	constraint fk_receiver_id foreign key(receiver_id) references member(id),
	primary key(sender_id,receiver_id)
);

create table interested_place(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_interested_id foreign key(member_id) references member(id),
	constraint fk_interested_no foreign key(place_no) references place(no)	
);

create table check_in(
	member_id varchar2(100),
	place_no number,
	primary key(member_id, place_no),
	constraint fk_check_id foreign key(member_id) references member(id),
	constraint fk_check_no foreign key(place_no) references place(no)	
);

create table station_connect(
	depart varchar2(100),
	arrived varchar2(100),
	spent_time number default 0,
	constraint fk_connect_depart foreign key(depart) references station(name),	
	constraint fk_connect_arrived foreign key(arrived) references station(name),
	primary key (depart,arrived)	
);

--------------연습장-------------

insert into member values('java','1234','아이유','여자','112');

insert into STATION(name,detail)
values('서울역','주소 : 서울특별시 용산구 한강대로 405 서울역
							지번-서울특별시 용산구 동자동 43-205 서울역
				전화번호 : 1544-7788
				관련정보 : 승차권 예매, 승차권 이용안내, 기차시간 및 운임표
				부가정보 : 기차역 검색, 고객센터, 유실물 찾기');



insert into burn_board values(burn_board_seq.nextval,'연습제목',sysdate,'연습내용','서울역','java',0);
delete from BURN_BOARD where no='2'


insert into station values('서울역','서울에 있어염',10);

select * from member;
select * from BURN_BOARD;
select * from STATION;
		

select A.* from(select row_number() 
over(order by no desc) rnum, no, title, station_name, member_id, 
to_char(posted_time,'YYYY.MM.DD') as posted_time from BURN_BOARD) A 
where rnum between 1 and 5;

insert into station(name,detail) values('전주','주소 : 전라북도 전주시 덕진구 동부대로 680 전주역
														지번-전라북도 전주시 덕진구 우아동3가 235
												전화번호 : 1544-7788
												관련정보 : 승차권 예매, 승차권 이용안내, 기차시간 및 운임표
												부가정보 : 기차역 검색, 고객센터, 유실물 찾기');
insert into place values(place_seq.nextval,'한옥마올','전주','전라도');

select sysdate from dual

select * from BURN_COMMENT where recomment!=0;

select * from BURN_COMMENT where recomment=1;

