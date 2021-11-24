


CREATE TABLE [dbo].[Status](
ID int IDENTITY(1,1) PRIMARY KEY,
Satus varchar(100)
);

ALTER TABLE [dbo].[Status]
ADD UserStatus varchar(100);

INSERT INTO [dbo].[Status] (UserStatus) VALUES('Active');
INSERT INTO [dbo].[Status] (UserStatus) VALUES ('InActive');
INSERT INTO [dbo].[Status] (UserStatus) VALUES ('Deleted');

 SELECT * FROM [dbo].[Status];


 ALTER TABLE [dbo].[User]
 ADD StatusId int FOREIGN KEY REFERENCES [dbo].[Status](ID);

 
SELECT U.FirstName,U.LastName, U.StatusId,S.UserStatus
        FROM [dbo].[User] U 
         JOIN [dbo].[Status] S
          ON U.StatusId = S.ID;


ALTER  PROCEDURE [dbo].[GetAllStatus]  
        AS
        BEGIN
            SET NOCOUNT ON;
             SELECT ID, UserStatus as Text FROM [dbo].[Status] WHERE ID<>3;
        END
GO

USE SampleProject 
GO  
EXEC GetAllStatus

USE [SampleProject]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[SP_GetAllUsers]
            @Id bigint,
			@Status bigint,
			@Role bigint
			
        AS
		IF (@Id = 0 AND @Status <> 0)
        BEGIN
            SET NOCOUNT ON;
             SELECT U.UserId,U.FirstName,U.LastName,U.Email as UserName, U.PhoneNumber, S.UserStatus as Status ,R.RoleName as Role,U.Password, U.DateOfBirth as DOB FROM [dbo].[User] U 
			 JOIN [dbo].[Status] S ON U.StatusId = S.ID JOIN [dbo].[Roles] R ON U.RoleId = R.ID WHERE U.StatusId <> 3 AND U.StatusId = @Status;
        END
		ELSE IF (@Id = 0 AND @Role <> 0)
		BEGIN 
			SET NOCOUNT ON;
             SELECT U.UserId,U.FirstName,U.LastName,U.Email as UserName, U.PhoneNumber, S.UserStatus as Status ,R.RoleName as Role,U.Password , U.DateOfBirth as DOB FROM [dbo].[User] U 
			 JOIN [dbo].[Status] S ON U.StatusId = S.ID JOIN [dbo].[Roles] R ON U.RoleId = R.ID WHERE U.StatusId <> 3 AND U.RoleId = @Role;
		END
		ELSE IF ( @Id = 0 AND @Status =0 AND @Role=0)
		BEGIN
		SET NOCOUNT ON;
             SELECT U.UserId,U.FirstName,U.LastName,U.Email as UserName, U.PhoneNumber, S.UserStatus as Status ,R.RoleName as Role, U.Password , U.DateOfBirth as DOB FROM [dbo].[User] U 
			 JOIN [dbo].[Status] S ON U.StatusId = S.ID JOIN [dbo].[Roles] R ON U.RoleId = R.ID WHERE U.StatusId <> 3;
        END
		
		ELSE
		BEGIN
            SET NOCOUNT ON;
            SELECT U.UserId,U.FirstName,U.LastName,U.Email as UserName, U.PhoneNumber, S.UserStatus as Status,R.RoleName as Role,U.Password , U.DateOfBirth as DOB FROM [dbo].[User] U 
			 JOIN [dbo].[Status] S ON U.StatusId = S.ID JOIN [dbo].[Roles] R ON U.RoleId = R.ID WHERE U.UserId = @Id AND U.StatusId <>3;
        END
GO

SELECT * FROM [dbo].[User];
SELECT * FROM [dbo].[AspNetUsers]
Alter Table [dbo].[User] ALTER Column DateOfBirth DateTime NOT NULL


USE SampleProject 
GO  
EXEC SP_GetAllUsers @Id = 0, @Status = 0, @Role=0

CREATE TABLE [dbo].[Roles](
ID int IDENTITY(101,1) PRIMARY KEY,
RoleName varchar(255)
);

INSERT INTO [dbo].[Roles] (RoleName)
VALUES ('Admin');
INSERT INTO [dbo].[Roles] (RoleName)
VALUES ('Staff');
INSERT INTO [dbo].[Roles] (RoleName)
VALUES ('User');

SELECT * FROM [dbo].[Roles];
SELECT * FROM [dbo].AspNetUsers




ALTER TABLE [dbo].[User] ADD RoleId int FOREIGN KEY REFERENCES [dbo].[Roles](ID) ;

INSERT INTO [dbo].[User] (FirstName,LastName,Email,PhoneNumber,StatusId,RoleId,DateOfBirth) VALUES ('selvi','raja','selvi@gmail.com','9876543210',1,101,1996-05-18)
UPDATE [dbo].[User]
SET DateOfBirth = 1996-05-18
WHERE UserId = 20047


USE [SampleProject]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER  PROCEDURE [dbo].[GetRoles]
        AS
        BEGIN
            SET NOCOUNT ON;
           SELECT ID, RoleName as Text FROM [dbo].[Roles]
        END
GO
USE SampleProject 
GO  
EXEC GetRoles


CREATE TABLE [dbo].[NLog] (
   [ID] [int] IDENTITY(1,1)  Not NULL,
   [MachineName] [nvarchar](200) NULL,
   [Logged] [datetime] NULL,
   [Level] [varchar](5)  NULL,
   [Message] [nvarchar](max)  NULL,
   [Logger] [nvarchar](300) NULL,
   [Properties] [nvarchar](max) NULL,
   [Callsite] [nvarchar](300) NULL,
   [Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED ([ID] ASC) 
   WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];
 DROP TABLE [dbo].[NLog]
GO
 
ALTER PROCEDURE [dbo].[NLog_AddEntry_p] 
  @machineName nvarchar(200),
  @logged datetime,
  @level varchar(5),
  @message nvarchar(max),
  @logger nvarchar(300),
  @properties nvarchar(max),
  @callsite nvarchar(300),
  @exception nvarchar(max)

AS
	BEGIN
  INSERT INTO [dbo].[NLog] (
    [MachineName],
    [Logged],
    [Level],
    [Message],
    [Logger],
    [Properties],
    [Callsite],
    [Exception]
  ) VALUES (
    @machineName,
    @logged,
    @level,
    @message,
    @logger,
    @properties,
    @callsite,
    @exception
  );
END

SELECT * FROM [dbo].[User]

ALTER TABLE [dbo].[User] ADD Password varchar

INSERT INTO [dbo].[NLog] (
    [MachineName],
    [Level],
    [Message],
    [Logger],
    [Properties],
    [Callsite],
    [Exception]
  ) VALUES ('ssss','ffff','vvvv','jjj','kkk','jjjjj','kkkk')