CREATE TABLE Insurance.ADMIN
(
    SYSTEM_ID INT PRIMARY KEY AUTO_INCREMENT, -- primary key column
    NAME VARCHAR(16) NOT NULL UNIQUE,
    USERNAME VARCHAR(45) NOT NULL,
    PASWORD VARCHAR(45) NOT NULL UNIQUE,
    CONTACT INT NOT NULL,
    EMAIL_ID VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE Insurance.ENTITY_EMPLOYEE
(
    EMPLOYEE_ID INT PRIMARY KEY, -- primary key column
    NAME VARCHAR(45) NOT NULL,
    CONTACT INT NOT NULL,
    EMAIL_ID VARCHAR(50) NOT NULL UNIQUE,
    SYSTEM_ID INT NOT NULL,
    FOREIGN KEY(SYSTEM_ID)  REFERENCES ADMIN(SYSTEM_ID) 
);

CREATE TABLE Insurance.COMPANY(
    COMPANY_CODE INT PRIMARY KEY,
    COMPANY_NAME VARCHAR(50) NOT NULL UNIQUE,
    LICENSE_NUMBER VARCHAR(12) NOT NULL UNIQUE,
    CREATED_DATE DATE NOT NULL,
    SYSTEM_ID INT NOT NULL,
    FOREIGN KEY(SYSTEM_ID)  REFERENCES ADMIN(SYSTEM_ID) 
    );
    
CREATE TABLE Insurance.INSURANCE_POLICIES(
    POLICY_NUMBER INT PRIMARY KEY,
    POLICY_TYPE VARCHAR(50) NOT NULL,
    PREMIUM INT NOT NULL,
    C_CODE INT NOT NULL , 
    FOREIGN KEY(C_CODE)REFERENCES COMPANY(COMPANY_CODE),
    TIME_PERIOD VARCHAR(5) NOT NULL,
    SUM_ASSUARED INT NOT NULL,
    POLICY_BENEFITS VARCHAR(255) NOT NULL
    );
    
CREATE TABLE Insurance.Customer(
    Customer_id INT PRIMARY KEY,
    Customer_NAME VARCHAR(50) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Contact VARCHAR(10) NOT NULL,
    policy_number INT NOT NULL,
    FOREIGN KEY (policy_number) REFERENCES INSURANCE_POLICIES(POLICY_NUMBER),
    Premium INT Unique,
    Employee_id INT NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES entity_employee(EMPLOYEE_ID),
    card_id INT NOT NULL UNIQUE ,
    Status Varchar(5),
    Login_email Varchar(50) NOT NULL UNIQUE,
    Password Varchar(50) NOT NULL UNIQUE,
    Gender Varchar(20),
    City Varchar(20),
    Street Varchar(20),
    State Varchar(20),
    Zipcode INT
    );
    
Create Table Insurance.Card_Details(
  CID INT Not Null PRIMARY KEY,
  CARD_NAME VARCHAR(50) Not Null Unique,
  CARD_NUMBER VARCHAR(16) Not Null,
  EXPIRY_DATE Date Not Null,
  CVV INT Not Null
); 

create table Insurance.policy_prerequisites(
Policy_prerequisite_test_code INT PRIMARY KEY,
Policy_number INT NOT NULL,
FOREIGN KEY(Policy_number) REFERENCES INSURANCE_POLICIES(POLICY_NUMBER),
Prerequisite_disease VARCHAR(100) Not NULL,
Prerequisite_test_name Varchar(100) Not Null,
Status Varchar(5)
);

CREATE table Insurance.HOSPITAL(
    HOSPITAL_ID INT PRIMARY KEY,
    H_NAME VARCHAR(55) NOT NULL UNIQUE,
    ADDRESS VARCHAR(255) NOT NULL UNIQUE,
    IS_NETWORK CHAR(1) check(IS_NETWORK in('Y','N'))
    );

CREATE TABLE Insurance.LAB_ORDER_LINE(
    LABID INT PRIMARY KEY,
    HOSPITAL_ID INT ,
    FOREIGN KEY(HOSPITAL_ID) REFERENCES HOSPITAL(HOSPITAL_ID),
    CUSTOMER_ID INT,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(Customer_id),
    PRE_REQUISITE_TEST_CODE INT NOT NULL, 
    FOREIGN KEY (PRE_REQUISITE_TEST_CODE) REFERENCES policy_prerequisites(Policy_prerequisite_test_code),
    PRICE INT NOT NULL 
    );

CREATE TABLE Insurance.TRANSACTION_ENTITY(

    TRANSACTION_ID  INT PRIMARY KEY,
    TRANSACTION_TYPE VARCHAR(30) NOT NULL UNIQUE,
    TIME_STAMP DATE NOT NULL,
    STATUS CHAR(1) check(STATUS in('Y','N')),
    CUSTOMER_ID INT UNIQUE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(Customer_id),
    ISSUED_AMOUNT INT NOT NULL 
);

CREATE TABLE Insurance.ENTITY_BILLING(
    BILL_ID  INT PRIMARY KEY,
    TRANSACTION_ID INT NOT NULL UNIQUE,
    FOREIGN KEY(TRANSACTION_ID) REFERENCES TRANSACTION_ENTITY(TRANSACTION_ID),
    BILL_AMMOUNT FLOAT(20) NOT NULL,
    TIME_STAMP DATE NOT NULL,
    CUSTOMER_ID INT UNIQUE ,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(Customer_id),
    POLICY_ID INT,
    FOREIGN KEY(POLICY_ID) REFERENCES INSURANCE_POLICIES(POLICY_NUMBER),
    LAB_ID INT,
    FOREIGN KEY (LAB_ID) REFERENCES LAB_ORDER_LINE(LABID)
);

INSERT INTO Insurance.ADMIN VALUES(1,'Logan Asher','Logan','Q1On6wiQdyvUNITJ2hjfV3RrK66u8ejjKR4I22LQvrteq',1083651275,'Logan_Asher5776@womeona.net');
INSERT INTO Insurance.ADMIN VALUES(2,'Kieth Booth','Kieth','yR9OLJ5OKQAVSunJxB4rIv6wGi1ogiVZLb7ZuPfGTjyur',1685963309,'Kieth_Booth3439@gembat.biz');
INSERT INTO Insurance.ADMIN VALUES(3,'Mary Dyson','Mary','Qsl4lJ1xOYhfyYj6LE80SpTw003t3EiH2xD1M0G80vvyO',705283140,'Mary_Dyson3994@hourpy.biz');
INSERT INTO Insurance.ADMIN VALUES(4,'Raquel Lee','Raquel','I3J0anAUrtV8A9g4eh0G9lx4a7FwccXvVss2l7yVtiaXy',814670038,'Raquel_Lee989@eirey.tech');
INSERT INTO Insurance.ADMIN VALUES(5,'Peter Pearson','Peter','O2PVknRRnSgteXbLZGRxRSviFhrcLwWhUxfqLBOg1f0XX',293558685,'Peter_Pearson1180@nimogy.biz');
INSERT INTO Insurance.ADMIN VALUES(6,'Bart Callan','Bart','yF169Yr2uAY2v5vbXLgyao0GNYpgjievLkDa9bXKBZDUS',444959015,'Bart_Callan2441@bauros.biz');
INSERT INTO Insurance.ADMIN VALUES(7,'Blake Maxwell','Blake','LSMgnrK2Vc6xWwBkfx7A5BFz8B6F2KOrwb0G1ypjN1JBx',237194591,'Blake_Maxwell2171@gmail.com');
INSERT INTO Insurance.ADMIN VALUES(8,'Andrea Alexander','Andrea','FAKNOB465srIXxE2DCRpflRbR5Koq2eREyH08yiqcfi2B',622383431,'Andrea_Alexander7229@brety.org');
INSERT INTO Insurance.ADMIN VALUES(9,'Dani Cavanagh','Dani','QPCNZEipN4OdkM9CZadhW5ZsKBHjoHP2PzLPgoltzJfX5',366899973,'Dani_Cavanagh8542@bretoux.com');
INSERT INTO Insurance.ADMIN VALUES(10,'Molly Jarrett','Molly','9BFpWOvBuguyusNaBxSWYUNy6adU0YNlNw0HZsjm3se4j',921464154,'Molly_Jarrett8088@twipet.com');
INSERT INTO Insurance.ADMIN VALUES(11,'Carter Dale','Carter','bKWTIk72FATNqdq0SPbsaC6jr1LOMTI9n2biHla3uLM3f',714696265,'Carter_Dale2192@naiker.biz');
INSERT INTO Insurance.ADMIN VALUES(12,'Anabel Andrews','Anabel','tqv2UkyBIsqyh7P0CDYxmXYxFrahCUU9JeBfaAKsQgsEy',550818748,'Anabel_Andrews2781@infotech44.tech');
INSERT INTO Insurance.ADMIN VALUES(13,'Adina Jordan','Adina','Q8yYrpC6uaC2qgFoU917LceJkwpspNcNhjAh4pHirSUHI',376439815,'Adina_Jordan4845@muall.tech');
INSERT INTO Insurance.ADMIN VALUES(14,'Daniel Owen','Daniel','UQg8yUHghto1TP2IXBtQrB7RdS1lMDQ1MiWByITgYaI8S',282647901,'Daniel_Owen3103@eirey.tech');
INSERT INTO Insurance.ADMIN VALUES(15,'Clint Rixon','Clint','gTedxpu30UOrN1Q299Wqbhh7nxiPDsinxC2Gofeb0gNV1',254212687,'Clint_Rixon7772@womeona.net');
INSERT INTO Insurance.ADMIN VALUES(16,'Kieth Wright','Kieth','f0Ivk3K9KOee5z4TMFr6wOmYSf7B3UHofUVqFjRCqw1Mz',805651943,'Kieth_Wright2219@brety.org');
INSERT INTO Insurance.ADMIN VALUES(17,'Roger Brooks','Roger','JGzGz8kdNOnyoQ9WajfS74NvqfbAEcVGLGgqBGAxmg3b6',919441704,'Roger_Brooks8751@dionrab.com');
INSERT INTO Insurance.ADMIN VALUES(18,'Janice Norburn','Janice','jYu2gmitTUTisqbAwyEBoqKpLJZIRy7qrQCHIiaA5EAjd',546238372,'Janice_Norburn2318@deons.tech');
INSERT INTO Insurance.ADMIN VALUES(19,'Tara Jenkins','Tara','ZbfXn1bnT2NYEGkplLj4TmCsrVZYJ3C1DwgmfL0uxcNW1',520495339,'Tara_Jenkins4089@naiker.biz');
INSERT INTO Insurance.ADMIN VALUES(20,'Jayden Bradshaw','Jayden','DeazWURj8KZUzH1Zq0zEOG5QItl3tMsejSu7wgfgAlTCN',327637382,'Jayden_Bradshaw5621@nanoff.biz');
select * from Insurance.ADMIN;

INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(1,'Logan Asher', 1083651275, 'Logan_Asher5776@womeona.net',1);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(2,'Kieth Booth',1685963309,'Kieth_Booth3439@gembat.biz',2);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(3,'Mary Dyson',705283140,'Mary_Dyson3994@hourpy.biz',3);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(4,'Raquel Lee',814670038,'Raquel_Lee989@eirey.tech',4);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(5,'Peter Pearson',293558685,'Peter_Pearson1180@nimogy.biz',5);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(6,'Bart Callan',444959015,'Bart_Callan2441@bauros.biz',6);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(7,'Blake Maxwell',237194591,'Blake_Maxwell2171@gmail.com',7);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(8,'Andrea Alexander',622383431,'Andrea_Alexander7229@brety.org',8);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(9,'Dani Cavanagh',366899973,'Dani_Cavanagh8542@bretoux.com',9);
INSERT INTO Insurance.ENTITY_EMPLOYEE VALUES(10,'Molly Jarrett',921464154,'Molly_Jarrett8088@twipet.com',10);

select * from Insurance.COMPANY;
delete from Insurance.COMPANY;
INSERT INTO Insurance.COMPANY VALUES('1', 'AECOM',	'3496b865-dfd',	'08-05-11',	'11');    
INSERT INTO Company VALUES('2',	'Telekom',	'd96c046c-b4b',	'09-08-03',	'12');
INSERT INTO Company VALUES('3',	'Comcast',	'02580bd2-afe',	'19-01-1',	'13');
INSERT INTO Company VALUES('4',	'Vodafone',	'dcfdbca0-60f',	'18-12-06',	'14');
INSERT INTO Company VALUES('5',	'Mars',	'108ae5e2-8a',	'06-08-20',	'15');
INSERT INTO Company VALUES('6',	'Biolife Grup',	'45b3c506-94b',	'17-04-11',	'16');
INSERT INTO Company VALUES('7',	'Demaco',	'c08ab180-92a',	'07-11-10',	'17');
INSERT INTO Company VALUES('8',	'Zepter',	'35fe0d76-917',	'03-09-30',	'18');
INSERT INTO Company VALUES('9',	'UPC',	'be340542-1b',	'15-11-09',	'19');
INSERT INTO Company VALUES('10',	'Carrefour',	'ea47d3df-79d',	'17-10-07',	'20');
select * from Insurance.INSURANCE_POLICIES;
INSERT INTO Insurance.Insurance_policies VALUES(1,'Private',500,1,'1y',50000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(2,'Public',300,1,'2y',40000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(3,'Government',100,1,'3y',30000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(4,'Private',500,2,'1y',45000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(5,'Public',300,2,'1y',35000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(6,'Government',70,2,'1y',25000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(7,'Private',450,3,'1y',40000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(8,'Public',250,3,'2y',32000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(9,'Government',150,3,'2y',30000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(10,'Private',550,4,'2y',60000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(11,'Public',340,4,'1y',30000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(12,'Government',120,4,'1y',10000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(13,'Private',440,5,'1y',50000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(14,'Public',240,5,'1y',30000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(15,'Government',140,5,'1y',10000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(16,'Private',540,6,'3y',65000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(17,'Public',340,6,'2y',45000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(18,'Government',140,6,'1y',35000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(19,'Private',500,7,'1y',45000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(20,'Public',300,7,'1y',36000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(21,'Government',100,7,'1y',16000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(22,'Private',600,8,'3y',66000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(23,'Public',400,8,'2y',36000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(24,'Government',200,8,'1y',15000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(25,'Private',430,9,'1y',56000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(26,'Public',230,9,'1y',26000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(27,'Government',130,9,'1y',10000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(28,'Private',730,10,'3y',76000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(29,'Public',530,10,'3y',56000,'Health insurance protects you from unexpected, high medical costs.' );
INSERT INTO Insurance_policies VALUES(30,'Government',330,10,'3y',36000,'Health insurance protects you from unexpected, high medical costs.' );

select * from Insurance.Card_Details;
INSERT INTO card_details VALUES('1','Makenzie Richardson','7123576431937452','22-08-12','263');
INSERT INTO card_details VALUES('2','Peter Addis','2582678692687262','2024-11-4','260');
INSERT INTO card_details VALUES('3','Wade Appleton','2525487267979379','2023-10-18','422');
INSERT INTO card_details VALUES('4','Lynn Young','5798689367998294','2024-1-2','499');
INSERT INTO card_details VALUES('5','Lindsay Clark','2687658973857093','2024-2-12','366');
INSERT INTO card_details VALUES('6','Raquel Carpenter','5798798173875573','2024-8-4','973');
INSERT INTO card_details VALUES('7','Moira Denton','5793897507085093','2022-7-12','903');
INSERT INTO card_details VALUES('8','Sebastian Rycroft','8927409860820026','25-11-4','143');
INSERT INTO card_details VALUES('9','Sebastian Morrison','6789287687208332','23-12-24','711');
INSERT INTO card_details VALUES('10','Rocco Tailor','2556268783783783','24-11-9','424');
INSERT INTO card_details VALUES('11','Tyson Chappell','5361698471974161','23-08-28','243');
INSERT INTO card_details VALUES('12','Makena Willis','1967366532631651','25-11-14','223');
INSERT INTO card_details VALUES('13','Mark Richardson','1647817508150823','24-10-8','452');
INSERT INTO card_details VALUES('14','Angelina Young','1581750838048048','23-1-12','649');
INSERT INTO card_details VALUES('15','Cadence Blackburn','6591598759874975','25-2-2','246');
INSERT INTO card_details VALUES('16','Rick Bright','5789228084257654','25-8-14','943');
INSERT INTO card_details VALUES('17','Domenic Knight','8197592797297522','2023-7-8','833');
INSERT INTO card_details VALUES('18','Amelia Phillips','7592759792792793','2024-11-14','192');
INSERT INTO card_details VALUES('19','Kirsten Bell','2569826929952692','2025-12-18','744');
INSERT INTO card_details VALUES('20','Victoria Hood','6856826592797592','2024-11-19','444');
INSERT INTO card_details VALUES('21','Caleb Shields','2965265828386586','2024-5-22','853');
INSERT INTO card_details VALUES('22','Alan Wild','5625927597297297','2024-10-1','456');
INSERT INTO card_details VALUES('23','Audrey Cox','1759739759379379','2025-1-18','789');
INSERT INTO card_details VALUES('24','Ada James','1649179719794171','25-8-12','234');
INSERT INTO card_details VALUES('25','Cassandra Benfield','5619765917917511','2025-4-7','732');
INSERT INTO card_details VALUES('26','Lucas Bradshaw','3875983725698723','2026-7-4','678');
INSERT INTO card_details VALUES('27','Leanne Davies','1867592759759729','2025-7-29','433');
INSERT INTO card_details VALUES('28','Michael Knight','6972857785975392','2025-5-24','199');
INSERT INTO card_details VALUES('29','Susan Rosenbloom','8695619591791563','2025-5-4','469');
INSERT INTO card_details VALUES('30','Erick Anderson','1786592837037953','2024-5-19','696');

select * from Insurance.Customer;


INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(1,'Makenzie Richardson','93-8-22','6123344325', 1,1,1,'Makenzie_Richardson2063657414@twipet.com','Northeastern@21', 'M',	'New York',	'12 Smith Street',	'NY',	'02314');
INSERT INTO Customer (CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
 VALUES(2, 'Peter Addis', '95-5-31', '4785442613',2, 2,2, 'Peter_Addis1226906224@grannar.com',	'Northeastern@22', 'M',	'New Jersy', '23 Warner Street',	'NJ',	'01124');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(3,	'Wade Appleton',	'91-4-10',	'0277666064',		3,	3,3,			'Wade_Appleton2129676548@gompie.com',	'Northeastern@23', 'M',	'San Diego',	'37 Stephan Street',	'CA',	'01244');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(4,	'Lynn Young	',	'91-3-9',	'3136610666',		4,	3,	4,		'Lynn_Young1049801551@guentu.biz',	'Northeastern@24', 'M',	'Boston', '58 QA Street',	'MA',	'02215');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(5,	'Lindsay Clark ',	'99-12-24',	'6820722573',		5,		5,	5,		'Lindsay_Clark1937253766@elnee.tech',	'Northeastern@25', 'F',	'Atlanta',	'15 Heisenberg Street',	'GA',	'01456');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(6,	'Raquel Carpenter ', '89-2-19',	'1774086173', 6,6,6,			'Raquel_Carpenter1337250263@nimogy.biz',	'Northeastern@26', 'F',	'Worchester',	'45 RM Street',	'MA',	'01145');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(7,	'Moira Denton ',	'06-2-18',	'0354865082',	7,			7,	7,		'Moira_Denton1621390545@gmail.com',	'Northeastern@27', 'F',	'Boston',	'Park Drive',	'MA',	'01425');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(8,	'Sebastian Rycroft',	'96-7-18',	'4257160817',	8,			8,	8	,	'Sebastian_Rycroft812483468@brety.org',	'Northeastern@28', 'M',	'Lowell',	'13 Stark Street',	'MA',	'01225');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(9,	'Sebastian Morrison	',	'91-2-23',	'0218440144',	9,		9,9,			'Sebastian_Morrison1065165198@bretoux.com',	'Northeastern@29', 'M',	'Dallas',	'JA Park',	'TX',	'14562');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(10,	'Rocco Tailor ', '04-4-20',	'6248005275',		10,	10,		10,	'Rocco_Tailor1689568041@bulaffy.com',	'Northeastern@30', 'M',	'Austin',	'OT Street',	'TX',	'01245');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(11,	'Tyson Chappell	', '87-2-1',	'5469876569',		11,		2,11,			'Tyson_Chappell888199334@jiman.com',	'Northeastern@31', 'M',	'Chicago',	'NW Street',	'IL',	'01451');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(12,	'Makena Willis',	'03-7-1',	'2355646564'	,	12,		1,12,			'Makena_Willis585382553@gompie.com',	'Northeastern@32', 'F',	'Seattle',	'JFK Street',	'WA',	'01052');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(13,	'Mark Richardson ',	'96-9-9',	'7895642122',			13,	5,		13,	'Mark_Richardson1680930294@irrepsy.com',	'Northeastern@33', 'M',	'San Jose',	'SJSU Street',	'CA',	'02312');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(14,	'Angelina Young',	'01-4-5',	'4578972465',		14,	6,14,			'Angelina_Young1883813933@cispeto.com',	'Northeastern@34', 'F',	'Las Vegas',	'LV Street',	'NV',	'01455');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(15,	'Cadence Blackburn	',	'02-5-12',	'7899878521',	15,		6,15,			'Cadence_Blackburn1943268910@extex.org',	'Northeastern@35', 'F',	'Penuelas',	'PR Street',	'PR',	'01245');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(16,	'Rick Bright',	'08-9-17',	'4875618965',			16,	2,	16,		'Rick_Bright47520000@joiniaa.com',	'Northeastern@36', 'M',	'Sharon',	'SP Street',	'MA',	'04521');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(17,	'Domenic Knight ',	'95-1-4',	'1248979860',		17,	2,	17,		'Domenic_Knight2002797611@naiker.biz',	'Northeastern@37', 'M',	'Troy',	'TD Street',	'NH',	'01451');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(18,	'Amelia Phillips',	'98-5-4',	'1245698000',		18,		5,	18,		'Amelia_Phillips82892398@vetan.org',	'Northeastern@38', 'F',	'Lisbon',	'LT Street',	'NH',	'15463');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(19,	'Kirsten Bell ',	'99-5-6',	'7815899632',		19,		4	,	19,	'Kirsten_Bell793718949@brety.org',	'Northeastern@39', 'F',	'Blaine',	'BG Street',	'ME',	'01452');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(20,	'Victoria Hood ',	'95-3-8',	'1234567890',		20,		4,20,			'Victoria_Hood1734072221@gembat.biz',	'Northeastern@40', 'F',	'Fairfax',	'VT Street',	'VT',	'04512');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(21,	'Caleb Shields ',	'98-10-2',	'4589658521',		21,	2,	21,		'Caleb_Shields401362496@cispeto.com',	'Northeastern@41', 'M',	'Red Bank',	'RB Street',	'NJ',	'01478');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(22,	'Alan Wild',	'03-9-7',	'1249658965',		22,	6,	22,		'Alan_Wild780471328@hourpy.biz',	'Northeastern@42', 'M',	'Brooklyn',	'Watt Street',	'NY',	'01452');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(23,	'Audrey Cox	',	'91-6-5',	'7856549632',		23,	6,	23,		'Audrey_Cox413450124@ubusive.com',	'Northeastern@43', 'F',	'Holmes',	'Roxbury',	'NY',	'01452');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(24, 'Ada James',	'85-2-8',	'7845693215',			24,	6,	24,		'Ada_James316668414@bretoux.com',	'Northeastern@44', 'F',	'Robinson',	'TS Street',	'PA',	'07896');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    VALUES(25,	'Cassandra Benfield',	'98-1-6',	'1259637895',	25,		6,25,			'Cassandra_Benfield1367201885@sheye.org',	'Northeastern@45', 'F',	'Butler',	'BCG Street',	'PA',	'04213');    
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    values (26,'Lucas Bradshaw', '87-8-17','4589634521',26,4,26,'Lucas_Bradshaw418027303@bauros.biz','Northeastern@46', 'M',	'Reston',	'LA Street',	'VA',	'04451');
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    values (27,'Leanne Davies', '05-11-11','5649863215',27,2,27,'Leanne_Davies1656102163@acrit.org','Northeastern@51', 'M',	'Laurel',	'MG Street',	'MD',	'21453');  
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    values (28,'Michael Knight', '89-2-1','4569637115',28,7,28,'Michael_Knight865421450@brety.org','Northeastern@47', 'F',	'Lanexa',	'RG Street',	'VA',	'78512');
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    values (29,'Susan Rosenbloom','98-4-13','4589638513',29,7,29,'Susan_Rosenbloom537515968@dionrab.com','Northeastern@48', 'M',	'Susan',	'NM Street',	'VA',	'03695');
INSERT INTO Customer(CUSTOMER_ID, CUSTOMER_NAME, DATE_OF_BIRTH, CONTACT,policy_number,EMPLOYEE_ID,card_id,login_email,Password, Gender, City, Street, State, Zipcode) 
    values (30,'Erick Anderson','01-1-17','7896534521',30,1,30,'Erick_Anderson1959329508@ovock.tech','Northeastern@50', 'F',	'Dowell',	'Beacon Street',	'MD',	'01452');

select * from Insurance.policy_prerequisites;
insert into policy_prerequisites values( 1, 1, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 4, 2, 'Lung','spirometry' ,'AV');
insert into policy_prerequisites values( 7, 3, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 9, 5, 'Diabties','Insulin_resistance','AV');
insert into policy_prerequisites values( 10, 7, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 12, 10, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 13, 14, 'Lung','spirometry','AV');
insert into policy_prerequisites values( 15, 21, 'Diabties','Insulin_resistance','AV');
insert into policy_prerequisites values( 16, 16, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 18, 24, 'Diabties','Insulin_resistance','AV');
insert into policy_prerequisites values( 19, 3, 'Diabties','Insulin_resistance','AV');
insert into policy_prerequisites values( 20, 14, 'Blood', 'Leucocyte Count','AV');
insert into policy_prerequisites values( 21, 20, 'Blood', 'Leucocyte Count','AV');  

select * from Insurance.HOSPITAL;

INSERT INTO HOSPITAL VALUES('1',	'Tylenol',	'Mr. Eduardo Collins, King 44233137, Jacksonville - 0000, Myanmar',	'Y');    
INSERT INTO HOSPITAL VALUES('2','City',	'Ms. Beatrice Darcy, Westcott  353751533, Stockton - 0000, India, Myanmar',	'Y');    
INSERT INTO HOSPITAL VALUES('3','Miralax',	'Mr. Peter Knight, Bacton   1315134742, Zurich - 0000, Syria, Myanmar',	'N');    
INSERT INTO HOSPITAL VALUES('4','Magne B6'	,'Mr. Liam Dwyer, Blackheath  707082971, Portland - 0000, Central African Republic, Myanmar',	'Y');    
INSERT INTO HOSPITAL VALUES('5','Vaqta'	,	'Mr. Manuel Swift, Durham 1140972097, Sacramento - 0000, Peru',	'N');    
INSERT INTO HOSPITAL VALUES('6','Ibalgin'	,	'Mr. Kieth Amstead, Central  143309062, Memphis - 0000, Eritrea',	'Y');    
INSERT INTO HOSPITAL VALUES('7','Emend'	,	'Mrs. Allison Knight, Longman   413702774, Kansas City - 0000, Samoa',	'Y');    
INSERT INTO HOSPITAL VALUES('8','Capital'	,	'Ms. Sylvia Holt, Geffrye   1356821637, Indianapolis - 0000, Albania',	'N');    
INSERT INTO HOSPITAL VALUES('9','Novolin'	,	'Mrs. Angelique Foxley, Rail 398813426, Baltimore - 0000, Ireland',	'Y');    
INSERT INTO HOSPITAL VALUES('10','Advil'	,	'Miss Harmony Wilcox, Collins  2071095077, San Diego - 0000, Switzerland',	'N'); 

select * from Insurance.LAB_ORDER_LINE;
insert  into lab_order_line (labid, Hospital_id,customer_id, PRE_REQUISITE_TEST_CODE, price)  values(1,1,26,13,30);
insert  into lab_order_line (labid, Hospital_id,customer_id, PRE_REQUISITE_TEST_CODE, price) values(3,1,26,21,15);

select * from Insurance.TRANSACTION_ENTITY;
Insert into TRANSACTION_ENTITY (TRANSACTION_ID,TRANSACTION_TYPE,TIME_STAMP,STATUS,CUSTOMER_ID,ISSUED_AMOUNT) values (5,'Online','22-4-20','Y',26,295);
Insert into TRANSACTION_ENTITY (TRANSACTION_ID,TRANSACTION_TYPE,TIME_STAMP,STATUS,CUSTOMER_ID,ISSUED_AMOUNT) values (6,'Cash','22-4-20','N',27,550);
Insert into TRANSACTION_ENTITY (TRANSACTION_ID,TRANSACTION_TYPE,TIME_STAMP,STATUS,CUSTOMER_ID,ISSUED_AMOUNT) values (7,'Card','22-4-20','Y',30,500);
Insert into TRANSACTION_ENTITY (TRANSACTION_ID,TRANSACTION_TYPE,TIME_STAMP,STATUS,CUSTOMER_ID,ISSUED_AMOUNT) values (8,'APPLE PAY','22-4-20','Y',28,240);
 


select * from Insurance.ENTITY_BILLING;
Insert into entity_billing(bill_id, transaction_id,bill_ammount, time_stamp,customer_id,policy_id,lab_id)
values(1,5,295,'22-4-20' , 26,14,1);
Insert into entity_billing(bill_id, transaction_id,bill_ammount, time_stamp,customer_id,policy_id)
values(2,6,550,'22-4-20', 27,10);
Insert into entity_billing(bill_id, transaction_id,bill_ammount, time_stamp,customer_id,policy_id)
values(3,7,500,'22-4-20', 30,1);
Insert into entity_billing(bill_id, transaction_id,bill_ammount, time_stamp,customer_id,policy_id)
values(4,8,240,'22-4-20' , 28,28);



