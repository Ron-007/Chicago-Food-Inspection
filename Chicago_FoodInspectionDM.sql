/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      chicago_FoodInspection_DM_PGroup09.DM1
 *
 * Date Created : Thursday, October 06, 2022 17:51:44
 * Target DBMS : Microsoft SQL Server 2019
 */

USE damg7370_states
go

/* 
 * TABLE: Dim_BusinessLicense 
 */

CREATE TABLE Dim_BusinessLicense(
    Chicago_Business_ID_SK    int              NOT NULL,
    ID                        varchar(500)     NULL,
    ApplicationType           varchar(20)      NULL,
    ConditionalApproval       char(10)         NULL,
    [Business Activity ID]    varchar(100)     NULL,
    [Business Activity]       varchar(1000)    NULL,
    [Account Number]          int              NULL,
    [Site Number]             int              NULL,
    [Legal Name]              varchar(100)     NULL,
    LicenseNumber             int              NULL,
    LicenseStatus             char(25)         NULL,
    LicenseCode               int              NULL,
    LicenseDescription        varchar(200)     NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (Chicago_Business_ID_SK)
)

go



/* 
 * TABLE: Dim_Date 
 */

CREATE TABLE Dim_Date(
    Date_SK                              int     NOT NULL,
    [Inspection Date]                    date    NULL,
    [APPLICATION CREATED DATE]           date    NULL,
    [APPLICATION REQUIREMENTS COMPLETE]  date    NULL,
    [PAYMENT DATE]                       date    NULL,
    [LICENSE TERM START DATE]            date    NULL,
    [LICENSE TERM EXPIRATION DATE]       date    NULL,
    [LICENSE APPROVED FOR ISSUANCE]      date    NULL,
    [DATE ISSUED]                        date    NULL,
    [LICENSE STATUS CHANGE DATE]         date    NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (Date_SK)
)

go



/* 
 * TABLE: Dim_Inspection 
 */

CREATE TABLE Dim_Inspection(
    Inspection_ID     int             NOT NULL,
    InspectionType    varchar(100)    NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (Inspection_ID)
)

go




/* 
 * TABLE: Dim_Location 
 */

CREATE TABLE Dim_Location(
    Location_SK       int             NOT NULL,
    Address           varchar(100)    NULL,
    City              varchar(50)     NULL,
    State             varchar(50)     NULL,
    Zip               int             NULL,
    Latitude          varchar(500)    NULL,
    Longitude         varchar(500)    NULL,
    Location          varchar(500)    NULL,
    Ward              int             NULL,
    Precinct          int             NULL,
    WardPrecinct      char(25)        NULL,
    PoliceDistrict    int             NULL,
    SSA               int             NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (Location_SK)
)

go

/* 
 * TABLE: Dim_Restaurant 
 */

CREATE TABLE Dim_Restaurant(
    Restaurant_SK     int             NOT NULL,
    RestaurantName    varchar(250)    NULL,
    AKAName           varchar(250)    NULL,
    License           int             NULL,
    FacilityType      varchar(50)     NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (Restaurant_SK)
)

go




/* 
 * TABLE: Fact_Chicago_Food_Inspection 
 */

CREATE TABLE Fact_Chicago_Food_Inspection(
    Chicago_FI_SK             int              NOT NULL,
    ViolationDescription      varchar(2000)    NULL,
    InspectionRisk            varchar(100)     NULL,
    InspectionResults         varchar(200)     NULL,
    Inspection_ID             int              NOT NULL,
    Location_SK               int              NOT NULL,
    Date_SK                   int              NOT NULL,
    Restaurant_SK             int              NOT NULL,
    Chicago_Business_ID_SK    int              NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (Chicago_FI_SK)
)

go




/* 
 * TABLE: Fact_Chicago_Food_Inspection 
 */

ALTER TABLE Fact_Chicago_Food_Inspection ADD CONSTRAINT RefDim_Inspection6 
    FOREIGN KEY (Inspection_ID)
    REFERENCES Dim_Inspection(Inspection_ID)
go

ALTER TABLE Fact_Chicago_Food_Inspection ADD CONSTRAINT RefDim_Location8 
    FOREIGN KEY (Location_SK)
    REFERENCES Dim_Location(Location_SK)
go

ALTER TABLE Fact_Chicago_Food_Inspection ADD CONSTRAINT RefDim_Date9 
    FOREIGN KEY (Date_SK)
    REFERENCES Dim_Date(Date_SK)
go

ALTER TABLE Fact_Chicago_Food_Inspection ADD CONSTRAINT RefDim_Restaurant10 
    FOREIGN KEY (Restaurant_SK)
    REFERENCES Dim_Restaurant(Restaurant_SK)
go

ALTER TABLE Fact_Chicago_Food_Inspection ADD CONSTRAINT RefDim_BusinessLicense13 
    FOREIGN KEY (Chicago_Business_ID_SK)
    REFERENCES Dim_BusinessLicense(Chicago_Business_ID_SK)
go


