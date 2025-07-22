REM   Script: Library DBMS - Final Group 28
REM   Finalised Oracle Live SQL Worksheet

create table Library_Member (   
    memberid number(10) primary key,    
    fullname varchar2(100) not null,   
    mobile varchar2 (11) not null,   
    address varchar2 (255) not null   
    );

create table Staff (   
	memberid number(10) primary key,   
    title varchar2 (50),   
    department varchar2 (50),   
    maxstaffloans number default 10,   
    constraint foreignkeystaff_memberid_ foreign key (memberid)   
    	references Library_Member (memberid)   
    	on delete cascade   
);

create table Student (   
	memberid number(10) primary key,    
    course varchar (100),   
	maxstudentloans number default 5,   
    constraint foreignkey_memberid foreign key (memberid)   
    	references Library_Member (memberid)   
    	on delete cascade   
);

create table Item (   
	itemid number(30) primary key,   
    itemtitle varchar2 (100),   
    itemtype varchar(15) not null check  
    (itemtype in('PhysicalBook', 'Ebook', 'Device'))       
);

create table Location (   
    locationid number (20) primary key,   
    floornum number(1) not null check (floornum between 1 and 3),   
    shelfnum number (20)   
);

create table Devices (   
    itemid number (30) primary key,   
    devicenum number (20),   
    devicetype varchar2 (30),   
    devicesavailable number default 0 not null,   
    locationid number(20),   
    maxdeviceloan interval day to second,  
    constraint fkdevices_location foreign key (locationid)   
    	references Location(locationid)   
);

create table PhysicalBooks (   
	itemid number(30) primary key,   
    author varchar2 (20),   
    ISBN number (13),   
    bookclass varchar2 (30),   
    numbooksavailable number default 0 not null,   
    locationid number(20),   
    maxloanbook interval day to second,  
    constraint fk_location foreign key (locationid)   
    	references Location(locationid),   
    constraint foreignkeyphysicalbooks_itemid foreign key (itemid)   
    	references Item (itemid)   
    	on delete cascade   
);

create table Ebooks (   
	itemid number(30) primary key,   
    author varchar2 (20),   
    ISBN number (13),   
    ebookclass varchar2 (30),   
    URL varchar2 (255),   
    numebooksavailable number default 0 not null,   
    maxebookloan interval day to second,   
    constraint foreignkeyebooks_itemid foreign key (itemid)   
    	references Item (itemid)   
    	on delete cascade   
);

create table Reservations (   
    reservationid number (30) primary key,   
    memberid number (10),   
    itemid number (30),   
    reservationstartdate date not null,   
    reservationenddate date,   
    reservationstatus varchar2 (20) not null check  
    (reservationstatus in ('Active', 'Offered', 'Closed')),   
    constraint fkmemberidreservations foreign key (memberid)   
    	references Library_Member(memberid),   
    constraint fkitemidreservations foreign key (itemid)   
    	references Item(itemid)   
);

create table Loan (   
    loanid number (30) primary key,   
    memberid number(10),   
    itemid number(30),   
    startdate date not null,   
    duedate date not null,   
    returndate date,   
    loanstatus varchar2(15) not null check (loanstatus in('Active', 'Completed', 'Overdue')),   
    constraint fkmemberid foreign key (memberid)   
    	references Library_Member(memberid),   
    constraint fkitemid foreign key (itemid)   
    	references Item(itemid)   
);

create table Fines (   
    finesid number (30) primary key,   
    loanid number (30),   
    startfinedate date not null,    
    finestatus varchar2 (30) not null check (finestatus in ('No payment', 'Payment Recieved')),   
    constraint fkloanidfines foreign key (loanid)   
    	references Loan (loanid)   
);

create table LoanHistory (   
    lhistory number,   
    loanid number,    
    condition varchar2 (30),   
    datelogged date not null,    
    constraint pklhistory primary key (lhistory, loanid),   
    constraint fkloanidlh foreign key (loanid)   
    	references Loan (loanid)   
);

INSERT INTO Library_member values (5739281046, 'Emma Richardson', 3128459021,	'245 Elm Street, Springfield, IL 62701');

INSERT INTO Library_member values (8492153076, 'Liam Harper', 4157293814,	'389 Maple Avenue, Boston, MA 02115');

INSERT INTO Library_member values (1947628350, 'Olivia Bennett', 2126475803, '1207 Pine Ridge Road, Denver, CO 80206');

INSERT INTO Library_member values (3028174695, 'Noah Sullivan', 6194328957, '56 Riverwalk Drive, Austin, TX 78704');

INSERT INTO Library_member values (7614032895, 'Ava Mitchell', 3037152948, '8902 Lakeview Boulevard, Orlando, FL 32819');

INSERT INTO Library_member values (5892047613, 'Ethan Carter', 5048327610, '311 Oakwood Lane, Portland, OR 97229');

INSERT INTO Library_member values (4381206975, 'Sophia Anderson', 7025942381, '74 Crescent Way, Seattle, WA 98122');

INSERT INTO Library_member values (9176405283, 'Mason Ramirez', 8084567213, '1010 Birchwood Court, Nashville, TN 37211');

INSERT INTO Library_member values (3645908217, 'Isabella Cooper', 9728134902, '5507 Meadowbrook Lane, Phoenix, AZ 85018');

INSERT INTO Library_member values (8504791264, 'Logan Parker', 6469273458,	'433 Sunset Drive, San Diego, CA 92103	');

INSERT INTO Library_member values (4839201567, 'Olivia Bennett', 31284750293, '324 Maple Street, Springfield, IL 62701');

INSERT INTO Library_member values (1028473956, 'Ethan Parker', 41592038471, '892 River Drive, Boston, MA 02115');

INSERT INTO Library_member values (6753891420, 'Sophia Davis', 81837465029, '1457 Oak Lane, Denver, CO 80202');

INSERT INTO Library_member values (2948165730, 'Mason Harris', 70256198341, '567 Pinecrest Road, Austin, TX 78701');

INSERT INTO Library_member values (5071348962, 'Ava Johnson', 30374219584	, '12 Birchwood Avenue, Phoenix, AZ 85001');

INSERT INTO Library_member values (8397214058, 'Liam Mitchell', 61948736250, '230 Cedar Boulevard, Portland, OR 97201');

INSERT INTO Library_member values (6145782930, 'Isabella Carter', 64693280173, '476 Elmwood Circle, Seattle, WA 98101');

INSERT INTO Staff values (5739281046,	'Ms',	'Computer Science', 10);

INSERT INTO Staff values (8492153076,	'Mr',	'Mathematics',	10);

INSERT INTO Staff values (1947628350,	'Dr',	'English',	10);

INSERT INTO Staff values (4839201567,	'Mr.', 'Psychology', 10);

INSERT INTO Staff values (1028473956,	'Ms.', 'Computer Science', 10);

INSERT INTO Staff values (6753891420,	'Dr.',	'Biology',	10);

INSERT INTO Staff values (2948165730,	'Prof.', 'History', 10);

INSERT INTO Staff values (5071348962,	'Mrs.', 'Mathematics', 10);

INSERT INTO Staff values (8397214058,	'Sir',	'Sociology', 10);

INSERT INTO Staff values (6145782930,	'Hon.', 'Philosophy',	10);

INSERT INTO Student values (5739281046, 'CSC101', 5);

INSERT INTO Student values (8492153076, 'MAT204', 5);

INSERT INTO Student values (1947628350, 'ENG315', 5);

INSERT INTO Student values (3028174695, 'PHY122', 5);

INSERT INTO Student values (7614032895, 'BIO210', 5);

INSERT INTO Student values (5892047613, 'CHE305', 5);

INSERT INTO Student values (4381206975, 'HIS403', 5);

INSERT INTO Student values (9176405283, 'ART150', 5);

INSERT INTO Student values (3645908217, 'PSY220', 5);

INSERT INTO Student values (8504791264, 'ECO330', 5);

INSERT INTO Item values (908472039182470000000000000000, 'Advances in Quantum Mechanics', 'PhysicalBook');

INSERT INTO Item values (238509283745092000000000000000, 'Exploring the Cosmos: A New Era', 'PhysicalBook');

INSERT INTO Item values (509283746092837000000000000000, 'EbookReader', 'Device');

INSERT INTO Item values (758230948302847000000000000000, 'The Role of Nanotechnology in Medicine', 'Ebook');

INSERT INTO Item values (384750293847509000000000000000, 'Understanding Climate Change: Impacts and Solutions', 'PhysicalBook');

INSERT INTO Item values (928374650293847000000000000000, 'The Physics of Black Holes',	'Ebook');

INSERT INTO Item values (103948572039487000000000000000, 'Laptop', 'Device');

INSERT INTO Item values (509283746029384000000000000000, 'Cellular Regeneration: The Future of Healing', 'PhysicalBook');

INSERT INTO Item values (238474506928374000000000000000, 'The Behavior of Subatomic Particles',	'Ebook');

INSERT INTO Item values (748392750928374000000000000000, 'Harnessing Renewable Energy for a Sustainable Future', 'Ebook');

INSERT INTO Location values (38392015673487500000, 3, 8392015673487500000);

INSERT INTO Location values (10284739562048300000, 1, 284739562048300000);

INSERT INTO Location values (17538914207395100000, 1, 7538914207395100000);

INSERT INTO Location values (29481657302938400000, 2, 9481657302938400000);

INSERT INTO Location values (30713489621573900000, 3, 713489621573900000);

INSERT INTO Location values (33972140586128300000, 3, 3972140586128300000);

INSERT INTO PhysicalBooks values (908472039182470000000000000000, 'Evelyn Hartfield', 9781234567890, 'Physics', 1, 38392015673487500000, INTERVAL '21 00:00:00' DAY TO SECOND);

INSERT INTO PhysicalBooks values (238509283745092000000000000000, 'Nathaniel Blackwood', 9780987654321, 'Astronomy', 2, 10284739562048300000, INTERVAL '21 00:00:00' DAY TO SECOND);

INSERT INTO PhysicalBooks values (384750293847509000000000000000, 'Clara Winters', 9783141592657, 'ClimateScience', 1, 17538914207395100000, INTERVAL '3 00:00:00' DAY TO SECOND);

INSERT INTO PhysicalBooks values (509283746029384000000000000000, 'Simon Hawthorne', 9780123456789, 'Biology', 1, 29481657302938400000, INTERVAL '21 00:00:00' DAY TO SECOND);

INSERT INTO Devices values(509283746092837000000000000000, 39485720394857200000, 'EbookReader', 3, 30713489621573900000, INTERVAL '21 00:00:00' DAY TO SECOND);

INSERT INTO Devices values(103948572039487000000000000000, 58029374650293800000, 'Laptop', 1, 33972140586128300000, INTERVAL '10 00:00:00' DAY TO SECOND);

INSERT INTO Ebooks values (758230948302847000000000000000, 'Cassandra Westbrook', 9781234567890, 'Biomedicine', 'www.greenwoodlibrary.com', 999, INTERVAL '21 00:00:00' DAY TO SECOND);

INSERT INTO Ebooks values (238474506928374000000000000000, 'Julian Ainsley', 9780987654321, 'Physics', 'www.urbanexplorer.com', 8, INTERVAL '99 00:00:00' DAY TO SECOND);

INSERT INTO Ebooks values (748392750928374000000000000000, 'Harper Blythe', 9782345678901, 'ClimateScience', 'www.fictionalbookshelf.org', 1, INTERVAL '3 00:00:00' DAY TO SECOND);

INSERT INTO Reservations values (492857203948750000000000000000, 5739281046, 384750293847509000000000000000, TO_DATE('2024-11-27' , 'YYYY-MM-DD'), TO_DATE('2024-11-30' , 'YYYY-MM-DD'), 'Closed');

INSERT INTO Reservations values (102938475092837000000000000000, 8492153076, 384750293847509000000000000000, TO_DATE('2024-12-01' , 'YYYY-MM-DD'), TO_DATE('2024-12-04' , 'YYYY-MM-DD'), 'Offered');

INSERT INTO Reservations values (675849302847561000000000000000, 1947628350, 908472039182470000000000000000, TO_DATE('2024-11-29' , 'YYYY-MM-DD'), TO_DATE('2024-12-02' , 'YYYY-MM-DD'), 'Closed');

INSERT INTO Reservations values (839204785630928000000000000000, 5739281046, 748392750928374000000000000000, TO_DATE('2024-11-28' , 'YYYY-MM-DD'), TO_DATE('2024-12-01' , 'YYYY-MM-DD'), 'Offered');

INSERT INTO Reservations values (294857103948750000000000000000, 7614032895, 908472039182470000000000000000, TO_DATE('2024-11-30' , 'YYYY-MM-DD'), TO_DATE('2024-12-03' , 'YYYY-MM-DD'), 'Offered');

INSERT INTO Loan values (384750293847560000000000000000, 5739281046, 384750293847509000000000000000, TO_DATE('27/11/2024' , 'DD/MM/YYYY'), TO_DATE('30/11/2024' , 'DD/MM/YYYY'), null, 'Active');

INSERT INTO Loan values (758203948572039000000000000000, 1947628350, 908472039182470000000000000000, TO_DATE('29/11/2024' , 'DD/MM/YYYY'), TO_DATE('30/11/2024' , 'DD/MM/YYYY'), TO_DATE('20/12/2024' , 'DD/MM/YYYY'),  
    'Completed');

INSERT INTO Loan values (384684900187560000000000000000, 5739281046, 509283746092837000000000000000, TO_DATE('09-10-2024' , 'DD-MM-YYYY'), TO_DATE('30-10-2024' , 'DD-MM-YYYY'), TO_DATE('29-10-2024' , 'DD-MM-YYYY'),  
    'Completed');

INSERT INTO Loan values (123695453847560000000000000000, 7614032895, 509283746092837000000000000000, TO_DATE('10-10-2024' , 'DD-MM-YYYY'), TO_DATE('31-10-2024' , 'DD-MM-YYYY'), null, 'Overdue');

INSERT INTO LoanHistory values (1090285941, 384750293847560000000000000000, 'Active', TO_DATE('30/11/2024' , 'DD/MM/YYYY'));

INSERT INTO LoanHistory values (1003759927, 758203948572039000000000000000, 'Completed', TO_DATE('29/11/2024' , 'DD/MM/YYYY'));

INSERT INTO Fines values (2885647385, 384750293847560000000000000000, TO_DATE('30/11/2024' , 'DD/MM/YYYY'), 'No payment');

INSERT INTO Fines values (8834666300, 123695453847560000000000000000, TO_DATE('31-10-2024' , 'DD-MM-YYYY'), 'Payment Recieved');

CREATE VIEW Overdue_Loans AS 
SELECT loanid, memberid, itemid 
FROM Loan 
WHERE loanstatus = 'Overdue';

CREATE VIEW Active_Loans AS 
SELECT loanid, memberid, itemid 
FROM Loan 
WHERE loanstatus = 'Active';

select * from overdue_loans;

select * from active_loans;

CREATE VIEW Available_Physical_Books AS 
SELECT itemid, ISBN , locationid 
FROM PhysicalBooks 
WHERE numbooksavailable > 0;

CREATE VIEW Unpaid_Fines AS 
SELECT finesid, loanid 
FROM Fines 
WHERE finestatus = 'No payment';

select * from available_physical_books;

select * from unpaid_fines;

select fullname, address from library_member where address like '%Springfield%';

select reservationid, memberid, itemid, reservationstartdate, reservationenddate from reservations where reservationstatus = 'Offered';

select loanid, memberid, itemid from loan where loanstatus = 'Active';

select itemtitle, itemtype from item where itemtype = 'Ebook';

select itemtitle, numbooksavailable from physicalbooks join item on physicalbooks.itemid = item.itemid where numbooksavailable > 1;

select m.memberid, m.fullname, l.itemid, case when l.returndate is null then round(sysdate - l.duedate) else round(l.returndate - l.duedate) end as daysoverdue, l.loanstatus 
from library_member m join loan l on m.memberid = l.memberid where l.loanstatus = 'Overdue' and (case when l.returndate is null then round(sysdate - l.duedate) else round(l.returndate - l.duedate) end) >= 10 
order by daysoverdue desc;

select reservations.memberid, library_member.fullname from reservations join library_member on reservations.memberid = library_member.memberid  
join item on reservations.itemid = item.itemid 
where item.itemtitle = 'Advances in Quantum Mechanics';

select itemtitle, author, numebooksavailable from ebooks join item on ebooks.itemid = item.itemid where author = 'Cassandra Westbrook';

select itemtype, count(l.loanid) as totalloans from item i join loan l on i.itemid = l.itemid group by i.itemtype order by totalloans desc;

select itemtype, avg(returndate - startdate) as averageloanlength from item i join loan l on i.itemid = l.itemid group by itemtype order by averageloanlength desc;

select i.itemtitle as Title, count(r.reservationid) as totalreservations from Item i join Reservations r on i.itemid = r.itemid group by i.itemtitle order by totalreservations desc;

select m.memberid as libraryID, m.fullname AS StudentName, count(l.loanid) AS TotalLoans from library_member m join student s on m.memberid = s.memberid
left join loan l on m.memberid = l.memberid 
group by m.memberid, m.fullname
order by TotalLoans desc;
