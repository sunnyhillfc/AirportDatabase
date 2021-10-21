USE MASTER
IF EXISTS ( SELECT name 
            FROM  master..sysdatabases
            WHERE name = N'AIRPORT'
            )
DROP DATABASE AIRPORT;
GO
CREATE DATABASE AIRPORT;
GO
USE AIRPORT;
GO

CREATE TABLE PLANE_TYPE (
                PlaneType_ID NCHAR(8) NOT NULL,
                TypeDescription NVARCHAR(30) NOT NULL,
                FuelCapacity SMALLINT NOT NULL,
                MaxRange SMALLINT NOT NULL,
                CONSTRAINT PLANE_TYPE_pk PRIMARY KEY (PlaneType_ID)
);
GO
CREATE TABLE AIRLINE (
                Airline_ID NCHAR(3) NOT NULL,
                AirlineName NVARCHAR(25) NOT NULL,
                Phone NCHAR(10) NOT NULL,
                CONSTRAINT AIRLINE_pk PRIMARY KEY (Airline_ID)
);
GO
CREATE TABLE PILOT (
                Licence_ID NCHAR(8) NOT NULL,
                FirstName NVARCHAR(20) NOT NULL,
                Surname NVARCHAR(25) NOT NULL,
                DOB DATE NOT NULL,
                StreetAddress NVARCHAR(50) NOT NULL,
                Suburb NVARCHAR(50) NOT NULL,
                State NVARCHAR(3) NOT NULL,
                Postcode NVARCHAR(8) NOT NULL,
                Phone NVARCHAR(10) NOT NULL,
                Airline_Ref NCHAR(3) NOT NULL,
                CONSTRAINT PILOT_pk PRIMARY KEY (Licence_ID)
);
GO
CREATE TABLE PILOT_PLANETYPE (
                Licence_Ref NCHAR(8) NOT NULL,
                PlaneType_Ref NCHAR(8) NOT NULL,
                CONSTRAINT PILOT_PLANETYPE_pk PRIMARY KEY (Licence_Ref, PlaneType_Ref)
);
GO
CREATE TABLE PLANE (
                Plane_ID INT IDENTITY(1,1) NOT NULL,
                DateOfManuf DATE NOT NULL,
                DateOfLastMaintenance DATE NOT NULL,
                PlaneType_ID NCHAR(8) NOT NULL,
                Airline_Ref NCHAR(3),
                CONSTRAINT PLANE_pk PRIMARY KEY (Plane_ID)
);
GO

-- INSERT AIRPORT DATA HERE

-- NOTE:    This script MUST be edited to ensure that database object names used match
--          the names used to create the database.  Do not modify the data values.
GO
-- AIRLINE
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'ANA', N'All Nipon Airlines', N'0232322422')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'ANS', N'Ansett Airlines', N'0299991212')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'AOF', N'Aero Flot Airways', N'0212121234')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'BAW', N'British Airways', N'0242455222')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'CAN', N'Canadian Airways', N'0233331555')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'ITA', N'Alitalia Airways', N'2365478932')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'JAL', N'Japanese Airlines', N'0212121212')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'KAR', N'Karachi Airlines', N'0295673422')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'OLY', N'Olympic Airlines', N'0297897899')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'POR', N'Portugese Airlines', N'0723124543')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'QAN', N'Qantas', N'0212345678')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'SIN', N'Singapore Airlines', N'0345634733')
INSERT [dbo].[AIRLINE] ([Airline_ID], [AirlineName], [Phone]) VALUES (N'VIR', N'Virgin Airways', N'0296583421')
GO
-- PLANE_TYPE
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'BOEDC010', N'Boeing DC 10 Jet', 15000, 22000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'BOEDC112', N'Boeing DC 12 Jet', 18000, 26000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'CESNA010', N'Cesna Single Engine Two Seater', 312, 1600)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'CESNA221', N'Cesna Twin Engine Four Seater', 400, 2000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'HARRI323', N'Harrier Jump Jet - Fighter', 3000, 6000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'HAWKR111', N'Hawker Dehaviland Jet', 15000, 26000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'HAWKR122', N'Hawker Dehaviland Twin Prop', 10000, 18000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'JUMBO747', N'Boeing Jumbo Jet 747', 23000, 32000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'JUMBO767', N'Boeing Super Jumbo Jet 767', 30000, 28000)
INSERT [dbo].[PLANE_TYPE] ([PlaneType_ID], [TypeDescription], [FuelCapacity], [MaxRange]) VALUES (N'TIGER012', N'Rolls Royce Tiger Moth', 600, 3000)
GO

-- PLANE
SET DATEFORMAT DMY
SET IDENTITY_INSERT [dbo].[Plane] ON
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (1, CONVERT(DATE,CAST(0x0000838A00000000 AS DateTime)), '01/06/2007' , N'BOEDC010', N'ANS')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (2, CONVERT(DATE,CAST(0x000090A400000000 AS DateTime)), '12/01/1992', N'JUMBO767', N'ANS')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (3, CONVERT(DATE,CAST(0x0000641400000000 AS DateTime)), '19/03/2011', N'CESNA010', N'OLY')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (4, CONVERT(DATE,CAST(0x000090FB00000000 AS DateTime)), '21/04/2009', N'CESNA221', N'ANS')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (5, CONVERT(DATE,CAST(0x00008FB600000000 AS DateTime)), '11/09/2008', N'JUMBO747', N'QAN')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (6, CONVERT(DATE,CAST(0x0000591300000000 AS DateTime)), '15/10/2006', N'JUMBO747', N'VIR')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (7, CONVERT(DATE,CAST(0x0000402B00000000 AS DateTime)), '14/09/2005', N'HAWKR122', N'AOF')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (8, CONVERT(DATE,CAST(0x00006DFD00000000 AS DateTime)), '01/01/2009', N'BOEDC010', N'ANS')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (9, CONVERT(DATE,CAST(0x00007FF900000000 AS DateTime)), '20/02/2010', N'HAWKR111', N'QAN')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (10, CONVERT(DATE,CAST(0x0000860400000000 AS DateTime)), '23/05/2009', N'JUMBO767', N'CAN')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (11, CONVERT(DATE,CAST(0x00004A7E00000000 AS DateTime)), '23/03/2010', N'HAWKR122', N'KAR')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (12, CONVERT(DATE,CAST(0x00008DA400000000 AS DateTime)), '12/02/2010', N'HAWKR122', N'KAR')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (13, CONVERT(DATE,CAST(0x00006E7E00000000 AS DateTime)), '19/02/2010', N'JUMBO767', N'ANA')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (14, CONVERT(DATE,CAST(0x0000AE3900000000 AS DateTime)), '17/03/2010', N'BOEDC010', N'BAW')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (15, CONVERT(DATE,CAST(0x000070A400000000 AS DateTime)), '21/01/2010', N'CESNA010', N'ITA')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (16, CONVERT(DATE,CAST(0x00008B6400000000 AS DateTime)), '11/03/2010', N'BOEDC112', N'POR')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (17, CONVERT(DATE,CAST(0x00003C8400000000 AS DateTime)), '02/01/2007', N'TIGER012', N'VIR')
INSERT [dbo].[Plane] ([Plane_ID], [DateOfManuf], [DateOfLastMaintenance], [PlaneType_ID], [Airline_Ref]) VALUES (18, CONVERT(DATE,CAST(0x00008EA300000000 AS DateTime)), '11/09/2009', N'HARRI323', N'ANA')
SET IDENTITY_INSERT [dbo].[Plane] OFF
GO

-- PILOT
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'ADAM2112', N'Adam', N'Panagopoulos', CONVERT(DATE,CAST(0x00008FC100000000 AS DateTime)), N'11 Mulloka Road', N'MIRRABOOKA', N'NSW', N'2264', N'0249736049', N'BAW')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'DOMA3432', N'Nicole', N'Doman', CONVERT(DATE,CAST(0x0000680900000000 AS DateTime)), N'21 Dora Street', N'BURKETOWN', N'QLD', N'4830', N'0845378943', N'CAN')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'FRAS0099', N'Fraser', N'Denise', CONVERT(DATE,CAST(0x000066B900000000 AS DateTime)), N'32 Somewhere Street', N'ABBOTSBURY', N'NSW', N'2176', N'0212228844', N'KAR')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'FRAS8899', N'Cameron', N'Fraser', CONVERT(DATE,CAST(0x000073D000000000 AS DateTime)), N'13/45-50 Johns Street', N'WAHROONGA', N'NSW', N'2076', N'0294734214', N'VIR')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'GGSG3434', N'Eryl', N'Carter', CONVERT(DATE,CAST(0x0000949D00000000 AS DateTime)), N'12 Flat Street', N'MIRRABOOKA', N'NSW', N'2264', N'0234432222', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'GOSF1212', N'Gosford', N'Trainstation', CONVERT(DATE,CAST(0x0000070400000000 AS DateTime)), N'12 Main Street', N'GOSFORD', N'NSW', N'2250', N'0243737322', N'AOF')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'HARL2322', N'David', N'Harley', CONVERT(DATE,CAST(0x0000640100000000 AS DateTime)), N'33 Sharendon Road', N'CAMPERDOWN', N'NSW', N'2050', N'0823114455', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'HAWK1223', N'Caroline', N'Hawkins', CONVERT(DATE,CAST(0x00005CF900000000 AS DateTime)), N'12 Johnston Street', N'THORNLEIGH', N'NSW', N'2120', N'0231131131', N'KAR')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'HEFF2332', N'David', N'Heffernen', CONVERT(DATE,CAST(0x0000754100000000 AS DateTime)), N'23/12 - 16 Add Street', N'NGAPALA', N'NSW', N'5374', N'0398765464', N'ANA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'HIRD2564', N'Renee', N'Hird', CONVERT(DATE,CAST(0x00006B2500000000 AS DateTime)), N'38 Lenox Street', N'CAMPERDOWN', N'NSW', N'2050', N'0296602223', N'BAW')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'IAVE1123', N'Walter', N'Iavetz', CONVERT(DATE,CAST(0x00005D1F00000000 AS DateTime)), N'12 Somerville Road', N'GALSTON', N'NSW', N'2159', N'0212344555', N'OLY')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'JACK1234', N'Frederick', N'Jackson', CONVERT(DATE,CAST(0x0000836100000000 AS DateTime)), N'11 Somewhereville', N'NEWTOWN', N'NSW', N'2042', N'0122222222', N'VIR')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'JONS2142', N'Frederick', N'Johnston', CONVERT(DATE,CAST(0x000064F800000000 AS DateTime)), N'33 Brother Street', N'MIRRABOOKA', N'WA', N'6061', N'0213132145', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'KENN1123', N'Marianne', N'Kennedy', CONVERT(DATE,CAST(0x000073B200000000 AS DateTime)), N'34 Sunday Avenue', N'MARGARET RIVER', N'WA', N'6285', N'0521387933', N'BAW')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'KLMA2133', N'Kevin Liegh', N'Marsden', CONVERT(DATE,CAST(0x0000589C00000000 AS DateTime)), N'12 Church Street', N'ALBERTON', N'QLD', N'4207', N'0212345675', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'KURA1232', N'Azar', N'Kuramina', CONVERT(DATE,CAST(0x0000728000000000 AS DateTime)), N'34 Sunday Drive', N'SOUTHBANK', N'VIC', N'3006', N'0243232256', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'LAKS1111', N'Dave', N'Mcevoy', CONVERT(DATE,CAST(0x0001CB6800000000 AS DateTime)), N'1212 Street St', N'BEELIAR', N'WA', N'6164', N'0283373737', N'AOF')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'MACK1223', N'Peter', N'Mackaway', CONVERT(DATE,CAST(0x0000644000000000 AS DateTime)), N'12 Johnston Street', N'HORNSBY', N'NSW', N'1630', N'0212343332', N'BAW')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'PANA1234', N'Peter', N'Panagopoulos', CONVERT(DATE,CAST(0x0000591300000000 AS DateTime)), N'11 Mulloka Road', N'Mirrabooka', N'NSW', N'2264', N'0249736049', N'OLY')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'ROBE2311', N'Niell', N'Roberts', CONVERT(DATE,CAST(0x00004F2700000000 AS DateTime)), N'26 Johnston Street', N'Hornsby', N'NSW', N'2077', N'0294767321', N'JAL')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'SCHI9843', N'Sandy', N'Schieb', CONVERT(DATE,CAST(0x0000724500000000 AS DateTime)), N'12 Berowra Street', N'Berowra', N'NSW', N'2221', N'0212345678', N'ITA')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'WOLF4556', N'Sarah', N'Wolf', CONVERT(DATE,CAST(0x0000728000000000 AS DateTime)), N'23 Church Street', N'CAMPSIE', N'NSW', N'2194', N'0234535667', N'CAN')
INSERT [dbo].[PILOT] ([Licence_ID], [FirstName], [Surname], [DOB], [StreetAddress], [Suburb], [State], [Postcode], [Phone], [Airline_Ref]) VALUES (N'YUNG3342', N'Daniel', N'Yung', CONVERT(DATE,CAST(0x00002E0300000000 AS DateTime)), N'16 Pincer Avenue', N'Sunshine', N'QLD', N'8978', N'0723110988', N'ANS')
GO

-- PILOT_PLANETYPE
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ADAM2112', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ADAM2112', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'DOMA3432', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'DOMA3432', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'DOMA3432', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'DOMA3432', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS0099', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS0099', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS0099', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS0099', N'JUMBO747')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS0099', N'JUMBO767')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS8899', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS8899', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS8899', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'FRAS8899', N'TIGER012')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'GGSG3434', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'GGSG3434', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'GGSG3434', N'TIGER012')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'GOSF1212', N'HAWKR111')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'GOSF1212', N'JUMBO747')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HARL2322', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HARL2322', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HEFF2332', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HIRD2564', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HIRD2564', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HIRD2564', N'HAWKR111')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'HIRD2564', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'IAVE1123', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'IAVE1123', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'IAVE1123', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'IAVE1123', N'JUMBO747')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'IAVE1123', N'JUMBO767')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'JACK1234', N'BOEDC112')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'JACK1234', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'JACK1234', N'HAWKR111')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'KENN1123', N'BOEDC112')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'KENN1123', N'JUMBO767')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'KURA1232', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'PANA1234', N'HAWKR111')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'PANA1234', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'PANA1234', N'JUMBO747')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ROBE2311', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ROBE2311', N'CESNA010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ROBE2311', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'ROBE2311', N'HAWKR122')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'SCHI9843', N'JUMBO747')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'SCHI9843', N'JUMBO767')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'WOLF4556', N'BOEDC010')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'WOLF4556', N'CESNA221')
INSERT [dbo].[PILOT_PLANETYPE] ([Licence_Ref], [PlaneType_Ref]) VALUES (N'WOLF4556', N'HAWKR122')

-- END OF DATA INSERTS

ALTER TABLE PLANE ADD CONSTRAINT PLANE_TYPE_Plane_fk
FOREIGN KEY (PlaneType_ID)
RefERENCES PLANE_TYPE (PlaneType_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PILOT_PLANETYPE ADD CONSTRAINT PLANE_TYPE_PILOT_PLANETYPE_fk
FOREIGN KEY (PlaneType_Ref)
RefERENCES PLANE_TYPE (PlaneType_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PLANE ADD CONSTRAINT AIRLINE_Plane_fk
FOREIGN KEY (Airline_Ref)
RefERENCES AIRLINE (Airline_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PILOT ADD CONSTRAINT AIRLINE_PILOT_fk
FOREIGN KEY (Airline_Ref)
RefERENCES AIRLINE (Airline_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE PILOT_PLANETYPE ADD CONSTRAINT PILOT_PILOT_PLANETYPE_fk
FOREIGN KEY (Licence_Ref)
RefERENCES PILOT (Licence_ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION