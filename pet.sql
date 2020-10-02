CREATE DATABASE [pet]
GO

USE [pet]
GO

CREATE TABLE [Coat_Type]
(
	[coat_type_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[coat_type_name] nvarchar(10) NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Coat_Type] ([coat_type_id], [coat_type_name])
	VALUES ('74483BCD-0F2E-43CF-B8F5-4081D4B75651', 'feathers')
GO

INSERT INTO [dbo].[Coat_Type] ([coat_type_id], [coat_type_name])
	VALUES ('05CB768F-0FF5-455C-9DFC-35FB86591305', 'fur')
GO

INSERT INTO [dbo].[Coat_Type] ([coat_type_id], [coat_type_name])
	VALUES ('722F8591-7F6F-4745-BAE8-3862EE7D4D21', 'scales')
GO

CREATE TABLE [dbo].[Pet_Type](
	[pet_type_id] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[pet_type_name] [nvarchar](30) NOT NULL,
	[lifespan] [int] NOT NULL,
	[coat_type_id] uniqueidentifier NOT NULL,
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pet_Type]
ADD CONSTRAINT FK_pettypecoattype
FOREIGN KEY (coat_type_id) REFERENCES Coat_Type(coat_type_id)
GO

INSERT INTO [dbo].[Pet_Type] ([pet_type_id] ,[pet_type_name], [lifespan], [coat_type_id])
	VALUES ('81BBCB78-6A79-4FF7-A244-5D7C6D15C315' ,'Lizard', 7, '722F8591-7F6F-4745-BAE8-3862EE7D4D21')
GO

INSERT INTO [dbo].[Pet_Type] ([pet_type_id] ,[pet_type_name], [lifespan], [coat_type_id])
	VALUES ('58457C61-C154-4EBC-BA29-66ADE6CE4D5C' ,'Bird', 12, '74483BCD-0F2E-43CF-B8F5-4081D4B75651')
GO

INSERT INTO [dbo].[Pet_Type] ([pet_type_id] ,[pet_type_name], [lifespan], [coat_type_id])
	VALUES ('F05CF755-AC61-4712-8991-0F1B633D47C8' ,'Fish', 1, '722F8591-7F6F-4745-BAE8-3862EE7D4D21')
GO

INSERT INTO [dbo].[Pet_Type] ([pet_type_id] ,[pet_type_name], [lifespan], [coat_type_id])
	VALUES ('578E9AF3-5252-4C3D-94CC-DD66769FFEE1' ,'Cat', 15, '05CB768F-0FF5-455C-9DFC-35FB86591305')
GO

INSERT INTO [dbo].[Pet_Type] ([pet_type_id] ,[pet_type_name], [lifespan], [coat_type_id])
	VALUES ('C84C5D2F-195B-4164-8C03-BDD795AAA75C' ,'Dog', 14, '05CB768F-0FF5-455C-9DFC-35FB86591305')
GO

CREATE TABLE [dbo].[Coat]
(
	[coat_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[coat_length] int NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Coat] ([coat_id] , [coat_length])
	VALUES ('16678490-CCE7-41AB-A702-11F68F083B30', 0)
GO

INSERT INTO [dbo].[Coat] ([coat_id] , [coat_length])
	VALUES ('65129F42-4497-43FC-97DE-3DBEE5EC49DC', 0)
GO

INSERT INTO [dbo].[Coat] ([coat_id] , [coat_length])
	VALUES ('A1E2D34C-01A5-4A6D-94F0-D7D5A3ED6232', 1)
GO

INSERT INTO [dbo].[Coat] ([coat_id] , [coat_length])
	VALUES ('94E8AC6F-D154-4373-935C-C92678FDF14A', 2)
GO

CREATE TABLE [dbo].[Color]
(
	[color_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[color_name] nvarchar(15) NOT NULL,

) ON [PRIMARY]
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('239E2049-E35E-400E-9D6E-B429F66FECE3', 'black')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('2DBDE3BF-6174-401E-89AA-033765ECDFE4', 'white')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('7452341D-8395-455A-B68B-9A00F34CF935', 'brown')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('A1951295-23E8-4932-B88B-92FA871D9C00', 'green')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('8004A1D8-3927-42D5-9B5F-3F572376A59E', 'yellow')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('55B585F5-572B-4993-94B0-1EB1DE7D8B0B', 'tan')
GO

INSERT INTO [dbo].[Color]([color_id], [color_name])
	VALUES('03F586C8-0B1B-42A2-949F-0B002216AFF4', 'red')
GO

CREATE TABLE [dbo].[Coat_Color]
(
	[coat_id] uniqueidentifier NOT NULL,
	[color_id] uniqueidentifier NOT NULL,
	[coat_color_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[color_priority] int NOT NULL,
)ON [PRIMARY]
GO

ALTER TABLE [dbo].[Coat_Color]
	ADD CONSTRAINT FK_Coat_Coat_Color
	FOREIGN KEY (coat_id) REFERENCES Coat(coat_id)
GO

ALTER TABLE [dbo].[Coat_Color] ADD CONSTRAINT [FK_Color_Coat_Color]
	FOREIGN KEY (color_id) REFERENCES Color(color_id)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('72647B9E-E275-461F-8175-BD90DF302F59', '16678490-CCE7-41AB-A702-11F68F083B30',
	'A1951295-23E8-4932-B88B-92FA871D9C00', 1)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('DCC8536B-CA7D-4E93-A79C-3334063E3A94', '16678490-CCE7-41AB-A702-11F68F083B30',
	'8004A1D8-3927-42D5-9B5F-3F572376A59E', 2)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('166E1E8F-3C4B-42F9-A4C6-75A6867E5E3A', '65129F42-4497-43FC-97DE-3DBEE5EC49DC',
	'7452341D-8395-455A-B68B-9A00F34CF935', 1)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('AADC22A6-C92A-4B5A-AD8A-CE5EF2E18A19', '65129F42-4497-43FC-97DE-3DBEE5EC49DC',
	'55B585F5-572B-4993-94B0-1EB1DE7D8B0B', 2)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('E440E685-0F90-4F0E-A0D8-30AC2D856593', 'A1E2D34C-01A5-4A6D-94F0-D7D5A3ED6232',
	'239E2049-E35E-400E-9D6E-B429F66FECE3', 1)
GO

INSERT INTO [dbo].[Coat_Color] ([coat_color_id], [coat_id], [color_id], [color_priority])
	VALUES ('B920B4C7-8EBE-44FF-BDD1-46872CFD2FAE', '94E8AC6F-D154-4373-935C-C92678FDF14A',
	'239E2049-E35E-400E-9D6E-B429F66FECE3', 1)
GO

CREATE TABLE [dbo].[Owner](
	[owner_id] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[owner_name] [nvarchar](30) NOT NULL,
	[owner_age] int NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Owner] ([owner_id], [owner_name], [owner_age])
	VALUES ('D9021EC7-52F2-41C9-9339-005890975B70', 'John', 25)
GO

INSERT INTO [dbo].[Owner] ([owner_id], [owner_name], [owner_age])
	VALUES ('99C5711E-C8C3-42F3-B1ED-378BB5A80339', 'Amanda', 52)
GO

INSERT INTO [dbo].[Owner] ([owner_id], [owner_name], [owner_age])
	VALUES ('9EF46335-7EC4-42E6-867F-6D6A02138600', 'Bobby', 39)
GO

INSERT INTO [dbo].[Owner] ([owner_id], [owner_name], [owner_age])
	VALUES ('5DCAFA4E-0CD4-4E4C-A29D-985A1D709F01', 'Tan', 37)
GO

CREATE TABLE [Health] 
(
	[health_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[is_sick] nvarchar(10) NOT NULL,
	[is_hungry] nvarchar(10) NOT NULL,
	[is_happy] nvarchar(10) NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Health] ([health_id] ,[is_sick], [is_hungry], [is_happy])
	VALUES ('8EB4776C-D7B8-40F3-97AA-F8B9C054EE5F', 'false', 'false', 'true')
GO

INSERT INTO [dbo].[Health] ([health_id] ,[is_sick], [is_hungry], [is_happy])
	VALUES ('9AC74394-9FC6-4688-BF70-2E95A48D776A' , 'true', 'true', 'false')
GO

INSERT INTO [dbo].[Health] ([health_id] ,[is_sick], [is_hungry], [is_happy])
	VALUES ('391D7130-D3A3-4BDF-91B4-DB0521A12EA4' , 'true', 'false', 'false')
GO

CREATE TABLE [Hunger] 
(
	[hunger_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[hunger_name] nvarchar(30) NOT NULL,
	[hunger_scale] int NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Hunger] ([hunger_id] ,[hunger_name], [hunger_scale])
	VALUES ('A3BF8C5F-94A5-4DD9-9781-3828A90B29E1' ,'Peckish', 1)
GO

INSERT INTO [dbo].[Hunger] ([hunger_id] ,[hunger_name], [hunger_scale])
	VALUES ('0F85508B-3669-4D85-8E75-950F6A2CC4DD' ,'Snackish', 2)
GO

INSERT INTO [dbo].[Hunger] ([hunger_id] ,[hunger_name], [hunger_scale])
	VALUES ('550B506B-6E6B-40A4-BA0E-08D64F062B2F' ,'Hungry', 3)
GO

INSERT INTO [dbo].[Hunger] ([hunger_id] ,[hunger_name], [hunger_scale])
	VALUES ('67DA856C-8259-486A-8751-13F65FD940F6' ,'Starving', 4)
GO

INSERT INTO [dbo].[Hunger] ([hunger_id] ,[hunger_name], [hunger_scale])
	VALUES ('D75B4C37-E223-4B96-AA4A-50037649E9BB' ,'Famished', 5)
GO

CREATE TABLE [dbo].[Pet](
	[pet_id] [uniqueidentifier] NOT NULL PRIMARY KEY,
	[pet_name] [nvarchar](30) NOT NULL,
	[pet_age] int NOT NULL,
	[pet_sex] nvarchar(10) NOT NULL,
	[pet_type_id] [uniqueidentifier] NOT NULL,
	[coat_id] [uniqueidentifier] NOT NULL,
	[owner_id] [uniqueidentifier] NOT NULL,
	[health_id] [uniqueidentifier] NOT NULL,
	[hunger_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pet]
ADD CONSTRAINT FK_petpettype
FOREIGN KEY (pet_type_id) REFERENCES Pet_Type(pet_type_id)
GO

ALTER TABLE [dbo].[Pet]
ADD CONSTRAINT FK_petcoat
FOREIGN KEY (coat_id) REFERENCES Coat(coat_id)
GO

ALTER TABLE [dbo].[Pet]
ADD CONSTRAINT FK_petowner
FOREIGN KEY (owner_id) REFERENCES [Owner](owner_id)
GO

ALTER TABLE [dbo].[Pet]
ADD CONSTRAINT FK_pethealth
FOREIGN KEY (health_id) REFERENCES Health(health_id)
GO

ALTER TABLE [dbo].[Pet]
ADD CONSTRAINT FK_pethunger
FOREIGN KEY (hunger_id) REFERENCES Hunger(hunger_id)
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES (
	'0BA79BF2-1A5E-4BD8-A35D-E21C43DB9198' 
	,'Baby'
	,8
	,'Female'
	,'C84C5D2F-195B-4164-8C03-BDD795AAA75C'
	,'A1E2D34C-01A5-4A6D-94F0-D7D5A3ED6232'
	,'D9021EC7-52F2-41C9-9339-005890975B70'
	,'8EB4776C-D7B8-40F3-97AA-F8B9C054EE5F'
	,'550B506B-6E6B-40A4-BA0E-08D64F062B2F')
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES 
	('E7154CB9-D177-4CF9-A029-7288838DB0D9' 
	,'Lucky'
	,2
	,'Male'
	,'C84C5D2F-195B-4164-8C03-BDD795AAA75C'
	,'A1E2D34C-01A5-4A6D-94F0-D7D5A3ED6232'
	,'D9021EC7-52F2-41C9-9339-005890975B70'
	,'8EB4776C-D7B8-40F3-97AA-F8B9C054EE5F'
	,'550B506B-6E6B-40A4-BA0E-08D64F062B2F')
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES 
	('B0DA1A89-32BE-49C5-A7D4-3BF45CD9A61D' 
	,'Cutie'
	,9
	,'Female'
	,'58457C61-C154-4EBC-BA29-66ADE6CE4D5C'
	,'16678490-CCE7-41AB-A702-11F68F083B30'
	,'99C5711E-C8C3-42F3-B1ED-378BB5A80339'
	,'9AC74394-9FC6-4688-BF70-2E95A48D776A'
	,'D75B4C37-E223-4B96-AA4A-50037649E9BB')
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES 
	('8AD6EF5A-A49E-469A-AC15-E8036ADA60D3' 
	,'Jelly'
	,1
	,'Female'
	,'F05CF755-AC61-4712-8991-0F1B633D47C8'
	,'65129F42-4497-43FC-97DE-3DBEE5EC49DC'
	,'9EF46335-7EC4-42E6-867F-6D6A02138600'
	,'391D7130-D3A3-4BDF-91B4-DB0521A12EA4'
	,'67DA856C-8259-486A-8751-13F65FD940F6')
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES 
	('6CE56A62-1975-4AAA-A64A-6679402D5FDA' 
	,'Peanut'
	,1
	,'Male'
	,'F05CF755-AC61-4712-8991-0F1B633D47C8'
	,'65129F42-4497-43FC-97DE-3DBEE5EC49DC'
	,'9EF46335-7EC4-42E6-867F-6D6A02138600'
	,'391D7130-D3A3-4BDF-91B4-DB0521A12EA4'
	,'67DA856C-8259-486A-8751-13F65FD940F6')
GO

INSERT INTO [dbo].[Pet]
	([pet_id] --[uniqueidentifier] NOT NULL PRIMARY KEY,
	,[pet_name] --[nvarchar](30) NOT NULL,
	,[pet_age] --int NOT NULL,
	,[pet_sex] --nvarchar(10) NOT NULL,
	,[pet_type_id] --[uniqueidentifier] NOT NULL,
	,[coat_id] --[uniqueidentifier] NOT NULL,
	,[owner_id] --[uniqueidentifier] NOT NULL,
	,[health_id] --[uniqueidentifier] NOT NULL,
	,[hunger_id] --[uniqueidentifier] NOT NULL
	)
	VALUES 
	('4BA6A57C-DA84-4060-9C13-DE9B9210A81C' 
	,'Flappy'
	,1
	,'Female'
	,'58457C61-C154-4EBC-BA29-66ADE6CE4D5C'
	,'16678490-CCE7-41AB-A702-11F68F083B30'
	,'99C5711E-C8C3-42F3-B1ED-378BB5A80339'
	,'9AC74394-9FC6-4688-BF70-2E95A48D776A'
	,'D75B4C37-E223-4B96-AA4A-50037649E9BB')
GO

CREATE TABLE [Treat] 
(
	[treat_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[treat_name] nvarchar(30) NOT NULL,
	[pet_type_id] uniqueidentifier NOT NULL,
	[hunger_id] uniqueidentifier NOT NULL,
	[treat_quantity] int NOT NULL,
	[calories] int NOT NULL,
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Treat]
ADD CONSTRAINT FK_treathunger
FOREIGN KEY (hunger_id) REFERENCES Hunger(hunger_id)
GO

ALTER TABLE [dbo].[Treat]
ADD CONSTRAINT FK_treatpettype
FOREIGN KEY (pet_type_id) REFERENCES Pet_Type(pet_type_id)
GO

INSERT INTO [dbo].[Treat] ([treat_id] ,[treat_name], [pet_type_id], [hunger_id], [treat_quantity], [calories])
	VALUES ('F192476B-364D-490E-B4AD-18D7327B242F' ,'fish flake', 'F05CF755-AC61-4712-8991-0F1B633D47C8'
	, 'D75B4C37-E223-4B96-AA4A-50037649E9BB', 3, 349)
GO

INSERT INTO [dbo].[Treat] ([treat_id] ,[treat_name], [pet_type_id], [hunger_id], [treat_quantity], [calories])
	VALUES ('30834A71-BCF9-4946-BBE3-917BF8623543' ,'cracker', '58457C61-C154-4EBC-BA29-66ADE6CE4D5C'
	, 'D75B4C37-E223-4B96-AA4A-50037649E9BB', 7, 15)
GO

INSERT INTO [dbo].[Treat] ([treat_id] ,[treat_name], [pet_type_id], [hunger_id], [treat_quantity], [calories])
	VALUES ('D9DE829F-2C65-4443-B3C3-EC909796CE89' ,'beef jerky', 'C84C5D2F-195B-4164-8C03-BDD795AAA75C'
	, 'A3BF8C5F-94A5-4DD9-9781-3828A90B29E1', 2, 157)
GO

INSERT INTO [dbo].[Treat] ([treat_id] ,[treat_name], [pet_type_id], [hunger_id], [treat_quantity], [calories])
	VALUES ('E7154CB9-D177-4CF9-A029-7288838DB0D9' ,'tuna', '578E9AF3-5252-4C3D-94CC-DD66769FFEE1'
	, '550B506B-6E6B-40A4-BA0E-08D64F062B2F', 5, 508)
GO

SELECT [pet_id]
      ,[pet_name]
      ,[dbo].[Pet].[coat_id]
      ,[health_id]
      ,[hunger_id]
	  --,[dbo].[Coat].[coat_id]
	  --,[coat_length]
	  --,[coat_primary_color]
	  --,[coat_secondary color]
  FROM [dbo].[Pet]
  LEFT JOIN [dbo].[Coat]
  ON [dbo].[Pet].[coat_id] = [dbo].[Coat].[coat_id]
GO

SELECT [pet_id]
      ,[pet_name]
      ,p.[coat_id]
      ,[health_id]
      ,[hunger_id]
	  --,c.[coat_id]
	  --,[coat_length]
	  --,[coat_primary_color]
	  --,[coat_secondary color]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Coat] c
  ON p.[coat_id] = c.[coat_id]
GO

SELECT [pet_id]
      ,[pet_name] as [Name]
      ,p.[coat_id]
      ,[health_id]
      ,[hunger_id]
	  --,c.[coat_id]
	  --,[coat_length]
	  --,[coat_primary_color]
	  --,[coat_secondary color]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Coat] c
  ON p.[coat_id] = c.[coat_id]
GO

SELECT p.[pet_id]
      ,p.[pet_name] as [Name]
      ,p.[coat_id]
      ,p.[health_id]
      ,p.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length]
	  --,c.[coat_primary_color] as [Color]
	  --,c.[coat_secondary color]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Coat] c
  ON p.[coat_id] = c.[coat_id]
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length]
	  --,c.[coat_primary_color] as [Color]
	  --,c.[coat_secondary color]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Coat] c
  ON p.[coat_id] = c.[coat_id]
GO

SELECT p.[pet_id]
      ,p.[pet_name] as [Name]
      ,p.[coat_id]
      ,p.[health_id]
      ,p.[hunger_id]
	  --,h.[hunger_id]
	  ,h.[hunger_name] as [Am I Hungry?]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Hunger] h
  ON p.[hunger_id] = h.[hunger_id]
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,h.[hunger_id]
	  ,h.[hunger_name] as [Am I Hungry?]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Hunger] h
  ON p.[hunger_id] = h.[hunger_id]
GO

SELECT p.[pet_id] as [ID]
      ,p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      ,p.[hunger_id] as [Hunger ID]
	  --,h.[hunger_id]
	  ,h.[hunger_name] as [Am I Hungry?]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Hunger] h
  ON p.[hunger_id] = h.[hunger_id]
GO

SELECT p.[pet_id]
      ,p.[pet_name]
      ,p.[coat_id]
      ,p.[health_id]
      ,p.[hunger_id]
	  --,h.[hunger_id]
	  ,h.[hunger_name]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Hunger] h
  ON p.[hunger_id] = h.[hunger_id]
GO

SELECT --g.[pig_id]
      p.[pet_name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,h.[hunger_id]
	  --,h.[hunger_status]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Hunger] h
  ON p.[hunger_id] = h.[hunger_id]
GO

SELECT p.[pet_id]
      ,p.[pet_name] as [Name]
      ,p.[coat_id]
      ,p.[health_id]
      ,p.[hunger_id]
      --,h.[health_id]
	  ,h.[is_happy]
	  ,h.[is_hungry]
	  ,h.[is_sick]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  WHERE h.[is_happy] = 'false'
  OR h.[is_hungry] = 'false'
  OR h.[is_sick] = 'false'
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
      --,h.[health_id]
	  ,h.[is_happy]
	  ,h.[is_hungry]
	  ,h.[is_sick]
  FROM [dbo].[Pet] p
  LEFT JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  WHERE 
	(
	h.[is_happy] = 'false'
	OR h.[is_hungry] = 'false'
	)
	AND h.[is_sick] = 'false'
GO

SELECT p.[pet_id]
      ,p.[pet_name]
      ,p.[coat_id]
      ,p.[health_id]
      ,p.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,c.[coat_primary_color]
	  --,c.[coat_secondary color]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
GO

SELECT p.[pet_id]
      --g.[pig_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'This piggie is bald') as [Color 1]
	  --,c.[coat_secondary color] as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'This piggie is bald') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'This piggie has only one color') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
GO

--ask about this one
SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'This piggie is bald') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'This piggie has only one color') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,CASE
		--WHEN l.[coat_length] = 0
		--THEN 100
		--WHEN l.[coat_length_name] = 'bald'
		--THEN 'double bald'
		--WHEN
		--(l.[coat_length] = 0
			--OR g.[pig_name] LIKE 'J%'
		--)
		--THEN 5
		--END
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'This piggie is bald') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'This piggie has only one color') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,CASE
		--WHEN l.[coat_length] = 0
		--THEN 100
		--END
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
	  --,h.[health_id]
	  ,h.[is_happy]
	  ,h.[is_hungry]
	  ,h.[is_sick]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
  INNER JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  WHERE
  (
	h.[is_happy] = 'true'
	OR p.[pet_name] LIKE 'J%'
  )
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'This piggie is bald') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'This piggie has only one color') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,CASE
		--WHEN l.[coat_length] = 0
		--THEN 100
		--END
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
	  --,h.[health_id]
	  ,h.[is_happy]
	  ,h.[is_hungry]
	  ,h.[is_sick]
	  --,hu.[hunger_id]
	  ,hu.[hunger_name]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
  INNER JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  INNER JOIN [dbo].[Hunger] hu
  ON hu.[hunger_id] = p.[hunger_id]
  WHERE
  (
	h.[is_happy] = 'true'
	OR p.[pet_name] LIKE 'J%'
	OR hu.[hunger_scale] LIKE '5%'
  )
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'No Hair') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'No Hair') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
	  --,h.[health_id]
	  --,h.[is_happy]
	  --,h.[is_hungry]
	  --,h.[is_sick]
	  --,hu.[hunger_id]
	  ,hu.[hunger_name] as [Is Hungry?]
	  --,t.[hunger_id]
	  --,t.[treat_id]
	  ,t.[treat_name] as [Treat]
	  ,t.[treat_quantity] as [Amount Left]
	  ,t.[calories]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
  INNER JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  INNER JOIN [dbo].[Hunger] hu
  ON hu.[hunger_id] = p.[hunger_id]
  INNER JOIN [dbo].[Treat] t
  ON t.[hunger_id] = hu.[hunger_id]
  WHERE
  (
	h.[is_happy] = 'true'
	OR p.[pet_name] LIKE 'J%'
	OR hu.[hunger_name] LIKE '5%'
  )
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,ISNULL(c.[coat_primary_color], 'No Hair') as [Color 1]
	  --,ISNULL(c.[coat_secondary color], 'No Hair') as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
	  --,h.[health_id]
	  --,h.[is_happy]
	  --,h.[is_hungry]
	  --,h.[is_sick]
	  --,hu.[hunger_id]
	  ,hu.[hunger_name] as [Is Hungry?]
	  --,t.[hunger_id]
	  --,t.[treat_id]
	  ,t.[treat_name] as [Treat]
	  ,t.[treat_quantity] as [Amount Left]
	  ,t.[calories]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
  INNER JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  INNER JOIN [dbo].[Hunger] hu
  ON hu.[hunger_id] = p.[hunger_id]
  INNER JOIN [dbo].[Treat] t
  ON t.[hunger_id] = hu.[hunger_id]
  WHERE
  (
	t.[calories] <=400
  )
GO

SELECT --g.[pig_id]
      p.[pet_name] as [Name]
      --,g.[coat_id]
      --,g.[health_id]
      --,g.[hunger_id]
	  --,c.[coat_id]
	  --,c.[coat_length_id]
	  --,c.[coat_primary_color] as [Color 1]
	  --,c.[coat_secondary color] as [Color 2]
	  --,c.[coat_style_id]
	  --,l.[coat_length_id]
	  --,l.[coat_length]
	  --,l.[coat_length_name] as [Length]
	  --,s.[coat_style_id]
	  --,s.[coat_style_name] as [Style]
	  --,h.[health_id]
	  --,h.[is_happy]
	  --,h.[is_hungry]
	  --,h.[is_sick]
	  --,hu.[hunger_id]
	  ,hu.[hunger_name] as [Is Hungry?]
	  --,t.[hunger_id]
	  --,t.[treat_id]
	  ,t.[treat_name] as [Treat]
	  ,t.[treat_quantity] as [Amount Left]
	  ,t.[calories]
  FROM [dbo].[Pet] p
  INNER JOIN [dbo].Coat c
  ON p.[coat_id] = c.[coat_id]
  INNER JOIN [dbo].[Coat_Color] l
  ON c.[coat_id] = l.[coat_id]
  INNER JOIN [dbo].[Color] s
  ON l.[color_id] = s.[color_id]
  INNER JOIN [dbo].[Health] h
  ON p.[health_id] = h.[health_id]
  INNER JOIN [dbo].[Hunger] hu
  ON hu.[hunger_id] = p.[hunger_id]
  INNER JOIN [dbo].[Treat] t
  ON t.[hunger_id] = hu.[hunger_id]
  WHERE
  (
	t.[calories] <=400
  )
GO

--what are the pet names?
SELECT --[pig_id]
      [pet_name]
      --,[coat_id]
      --,[health_id]
      --,[hunger_id]
  FROM [dbo].[Pet]
  GO

--what are the treat names?
SELECT --[treat_id]
	[treat_name]
	--,[hunger_id]
	--,[treat_quantity]
	--,[calories]
	FROM [dbo].[Treat]
	GO

--How many coat colors are there?
SELECT COUNT(cc.[coat_color_id]) as [Total Coat Colors]
	--,cc.[coat_id]
	--,cc.[color_id]
	--,cc.[color_priority]
	--,c.[color_id]
	--c.[color_name]
	--,ct.[coat_id]
	--,ct.[coat_length_id]
	--,ct.[coat_primary_color]
	--,ct.[coat_secondary color]
	--,ct.[coat_style_id]
	FROM [dbo].[Coat_Color] cc
	INNER JOIN [dbo].[Color] c
	ON cc.color_id = c.color_id
	INNER JOIN [dbo].[Coat] ct
	ON cc.coat_id = ct.coat_id
GO

--what is the first coat color on pet Jelly
SELECT --g.[pig_id]
	p.[pet_name]
	--,g.[coat_id]
	--,g.[health_id]
	--,g.[hunger_id]
	--,cc.[coat_color_id]
	--,cc.[coat_id]
	--,cc.[color_id]
	,cc.[color_priority]
	--,c.[color_id]
	,c.[color_name]
	FROM [dbo].[Pet] p
	INNER JOIN [dbo].[Coat_Color] cc
	ON p.[coat_id] = cc.[coat_id]
	INNER JOIN [dbo].[Color] c
	ON cc.[color_id] = c.[color_id]
	WHERE
	(cc.[color_priority] <= 1
	AND p.[pet_name] LIKE 'Jelly')
	GO

--what is the total quantity of all treats
SELECT --t.[treat_id]
	--,t.[hunger_id]
	--,t.[calories]
	--,t.[treat_name]
	SUM(t.[treat_quantity]) as [Total Treats]
	FROM [dbo].[Treat] t
	GO

--what is the average amount of calories in each treat?
SELECT --t.[treat_id]
	--,t.[hunger_id]
	AVG(t.[calories]) as [Average Calorie Count]
	--,t.[treat_name]
	--,t.[treat_quantity]
	FROM [dbo].[Treat] t
	GO

--Ask Will
--what is the treat that has the most calories?
SELECT --t.[treat_id]
	--,t.[hunger_id]
	--MAX(t.[calories]) as [Treat Max]
	t2.[treat_name]
	--(
		--SELECT MAX(t1.[calories])
		--FROM [dbo].[Treat] t1
	--) as [Treat Max]
	--,t.[treat_quantity]
	FROM [dbo].[Treat] t2
	GO

--Group By
--How many male and female pets are there
SELECT COUNT(p.[pet_id]) as [Number of pets]
	,p.[pet_sex]
	FROM [dbo].[Pet] p
	GROUP BY p.[pet_sex]

--What is the average age of owners
SELECT AVG(o.[owner_age]) as [Average Owner Age]
	FROM [dbo].[Owner] o

--What is the average age of owners organized by name
SELECT AVG(o.[owner_age]) as [Average Owner Age]
	,o.[owner_name]
	FROM [dbo].[Owner] o
	GROUP BY [owner_name]

CREATE INDEX [pet_id_index]
ON [Pet] (pet_id)

CREATE INDEX [pet_name_index]
ON [Pet] (pet_name)

ALTER TABLE [Pet_Type]
DROP CONSTRAINT FK_pettypecoattype

DROP TABLE [Coat_Type]
GO

ALTER TABLE [Pet_Type]
DROP COLUMN [coat_type_id]
GO

ALTER TABLE [Pet_Type]
ADD [coat_type] nvarchar(30)
GO

UPDATE [Pet_Type]
SET [coat_type]='scales'
WHERE
	(
	[pet_type_name]='Fish'
	OR [pet_type_name]='Lizard'
	)
GO

UPDATE [Pet_Type]
SET [coat_type]='feathers'
WHERE
	(
	[pet_type_name]='Bird'
	)
GO

UPDATE [Pet_Type]
SET [coat_type]='fur'
WHERE
	(
	[pet_type_name]='Cat'
	OR [pet_type_name]='Dog'
	)
GO

ALTER TABLE [Pet]
DROP CONSTRAINT [FK_pethealth]
GO

DROP TABLE [Health]
GO

CREATE TABLE [dbo].[Health]
(
	[health_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[health_name] nvarchar(30) NOT NULL,
	[health_scale] int NOT NULL,
) ON [PRIMARY]
GO

INSERT INTO [dbo].[Health] ([health_id] ,[health_name], [health_scale])
	VALUES ('097A1110-46F4-4B0D-AB95-7490F3254121' ,'Healthy', 1)
GO

INSERT INTO [dbo].[Health] ([health_id] ,[health_name], [health_scale])
	VALUES ('C1953754-BDF6-41E6-80C4-BCE845BAF1B9' ,'Sniffly', 2)
GO

INSERT INTO [dbo].[Health] ([health_id] ,[health_name], [health_scale])
	VALUES ('DC3BA050-D3B2-4E30-B41C-9487788C7498' ,'Stomach Ache', 3)
GO

INSERT INTO [dbo].[Health] ([health_id] ,[health_name], [health_scale])
	VALUES ('A4CD85CA-7D39-495A-B9B9-1448B80B1609' ,'Flu', 4)
GO

INSERT INTO [dbo].[Health] ([health_id] ,[health_name], [health_scale])
	VALUES ('9933DBA0-7393-499E-AD25-787B9D98AC6D' ,'Very Sick', 5)
GO

ALTER TABLE [Pet]
DROP COLUMN [health_id]
GO

ALTER TABLE [Pet]
ADD [health_id] uniqueidentifier
GO

ALTER TABLE [Pet]
ADD CONSTRAINT FK_pethealth
FOREIGN KEY (health_id) REFERENCES Health(health_id)
GO

UPDATE [Pet]
SET [health_id] = '097A1110-46F4-4B0D-AB95-7490F3254121'
WHERE
(
	[pet_name] = 'Cutie'
	OR [pet_name] = 'Peanut'
)
GO

UPDATE [Pet]
SET [health_id] = 'C1953754-BDF6-41E6-80C4-BCE845BAF1B9'
WHERE
(
	[pet_name] = 'Lucky'
	OR [pet_name] = 'Flappy'
)
GO

UPDATE [Pet]
SET [health_id] = 'DC3BA050-D3B2-4E30-B41C-9487788C7498'
WHERE
(
	[pet_name] = 'Baby'
)
GO

UPDATE [Pet]
SET [health_id] = 'A4CD85CA-7D39-495A-B9B9-1448B80B1609'
WHERE
(
	[pet_name] = 'Jelly'
)
GO

ALTER TABLE [Pet]
DROP CONSTRAINT FK_petcoat
GO

ALTER TABLE [Pet]
DROP COLUMN [coat_id]
GO

ALTER TABLE [Coat_Color]
DROP CONSTRAINT [FK_Coat_Coat_Color]
GO

DROP TABLE [Coat]
GO

ALTER TABLE [Coat_Color]
DROP COLUMN [coat_id]
GO

ALTER TABLE [Coat_Color]
ADD [pet_id] uniqueidentifier
GO

ALTER TABLE [Coat_Color]
ADD CONSTRAINT [FK_petcoatcolor]
FOREIGN KEY (pet_id) REFERENCES Pet(pet_id)
GO

sp_rename [Coat_Color], [Pet_Color]
GO

EXEC sp_rename 'Pet_Color.coat_color_id', 'pet_color_id'
GO

UPDATE [Pet_Color]
SET [pet_id] = '4BA6A57C-DA84-4060-9C13-DE9B9210A81C'
WHERE
(
	[pet_color_id] = 'E440E685-0F90-4F0E-A0D8-30AC2D856593'
)
GO

UPDATE [Pet_Color]
SET [pet_id] = '4BA6A57C-DA84-4060-9C13-DE9B9210A81C'
WHERE
(
	[pet_color_id] = 'DCC8536B-CA7D-4E93-A79C-3334063E3A94'
)
GO

UPDATE [Pet_Color]
SET [pet_id] = '6CE56A62-1975-4AAA-A64A-6679402D5FDA'
WHERE
(
	[pet_color_id] = 'B920B4C7-8EBE-44FF-BDD1-46872CFD2FAE'
)
GO

UPDATE [Pet_Color]
SET [pet_id] = 'E7154CB9-D177-4CF9-A029-7288838DB0D9'
WHERE
(
	[pet_color_id] = '166E1E8F-3C4B-42F9-A4C6-75A6867E5E3A'
)
GO

UPDATE [Pet_Color]
SET [pet_id] = 'B0DA1A89-32BE-49C5-A7D4-3BF45CD9A61D'
WHERE
(
	[pet_color_id] = '72647B9E-E275-461F-8175-BD90DF302F59'
)
GO

UPDATE [Pet_Color]
SET [pet_id] = 'B0DA1A89-32BE-49C5-A7D4-3BF45CD9A61D'
WHERE
(
	[pet_color_id] = 'AADC22A6-C92A-4B5A-AD8A-CE5EF2E18A19'
)
GO

INSERT INTO [dbo].[Pet_Color] ([color_id] ,[pet_color_id] ,[color_priority] ,[pet_id])
  VALUES ('2DBDE3BF-6174-401E-89AA-033765ECDFE4', '50CB53D9-6CD1-4BD1-9BB2-38D665FEFE6D', 1, '0BA79BF2-1A5E-4BD8-A35D-E21C43DB9198')
GO

INSERT INTO [dbo].[Pet_Color] ([color_id] ,[pet_color_id] ,[color_priority] ,[pet_id])
  VALUES ('2DBDE3BF-6174-401E-89AA-033765ECDFE4', '3A186DB6-3724-4F09-8B78-9164FF83F460', 1, '8AD6EF5A-A49E-469A-AC15-E8036ADA60D3')
GO

DROP INDEX [Pet].[pet_name_index]
GO

DROP INDEX [Pet].[pet_id_index]
GO

CREATE INDEX [pet_name_index] on [Pet]
(
	[pet_name] ASC
) INCLUDE (pet_id)
GO

CREATE TABLE [Medicine] 
(
	[medicine_id] uniqueidentifier NOT NULL PRIMARY KEY,
	[medicine_name] nvarchar(30) NOT NULL,
	[health_id] uniqueidentifier NOT NULL,
	[medicine_quantity] int NOT NULL,
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Medicine]
ADD CONSTRAINT FK_medicinehealth
FOREIGN KEY (health_id) REFERENCES Health(health_id)
GO
select newid()
INSERT INTO [dbo].[Medicine] ([medicine_id] ,[medicine_name], [health_id], [medicine_quantity])
	VALUES ('11A9F20F-A88A-4027-B567-69348800D9F6' ,'nose drops', 'C1953754-BDF6-41E6-80C4-BCE845BAF1B9', 3)
GO

INSERT INTO [dbo].[Medicine] ([medicine_id] ,[medicine_name], [health_id], [medicine_quantity])
	VALUES ('E25C02AE-ECA5-41C4-AF8E-6EA920550542' ,'cough drops', 'A4CD85CA-7D39-495A-B9B9-1448B80B1609', 7)
GO

INSERT INTO [dbo].[Medicine] ([medicine_id] ,[medicine_name], [health_id], [medicine_quantity])
	VALUES ('E85E22FC-2498-485F-B660-A7920525F4D6' ,'stomach soother', 'DC3BA050-D3B2-4E30-B41C-9487788C7498', 2)
GO

INSERT INTO [dbo].[Medicine] ([medicine_id] ,[medicine_name], [health_id], [medicine_quantity])
	VALUES ('B05359CE-07FE-49EC-A7C4-6CE03DC19E75' ,'emergency kit', '9933DBA0-7393-499E-AD25-787B9D98AC6D', 5)
GO

--Order the pets by age
SELECT ROW_NUMBER() OVER (ORDER BY [pet_age] ASC) as [RowNumber]
		,[pet_id]
      ,[pet_name]
      ,[pet_age]
      ,[pet_sex]
      ,[pet_type_id]
      ,[owner_id]
      ,[hunger_id]
      ,[health_id]
  FROM [pet].[dbo].[Pet]
  GO

--rank the pets and split by sex
SELECT RANK() OVER(PARTITION BY [pet_sex]
       ORDER BY [pet_age] ASC) AS [Row_Number]
		,[pet_id]
      ,[pet_name]
      ,[pet_age]
      ,[pet_sex]
      ,[pet_type_id]
      ,[owner_id]
      ,[hunger_id]
      ,[health_id]
  FROM [pet].[dbo].[Pet]
  GO

--dense rank the pets and split by sex
SELECT DENSE_RANK() OVER(PARTITION BY [pet_sex]
       ORDER BY [pet_age] ASC) AS [Row_Number]
		,[pet_id]
      ,[pet_name]
      ,[pet_age]
      ,[pet_sex]
      ,[pet_type_id]
      ,[owner_id]
      ,[hunger_id]
      ,[health_id]
  FROM [pet].[dbo].[Pet]
  GO

--what is the median pet age?
SELECT	[Row_Number] 
,[pet_age] FROM
	(SELECT Row_Number() OVER(ORDER BY [pet_age] ASC) AS [Row_Number]
		--,MAX(p1.[Row_Number])/2 as [Median_Pet]
	 --,[pet_id]
      --,[pet_name]
      ,p1.[pet_age]
      --,[pet_sex]
      --,[pet_type_id]
      --,[owner_id]
      --,[hunger_id]
      --,[health_id]
  FROM [pet].[dbo].[Pet] p1
  ) p2
  WHERE
  (
	[Row_Number] =
	(
		SELECT MAX([Row_Number])/2
		FROM (SELECT Row_Number() OVER(ORDER BY [pet_age] ASC) AS [Row_Number]
		--,MAX(p1.[Row_Number])/2 as [Median_Pet]
	 --,[pet_id]
      --,[pet_name]
      ,p1.[pet_age]
      --,[pet_sex]
      --,[pet_type_id]
      --,[owner_id]
      --,[hunger_id]
      --,[health_id]
  FROM [pet].[dbo].[Pet] p1
  ) p2
	)
  )
  GO

  --What is the highest pet age?
  SELECT MAX([pet_age]) as [MaxAge]
  FROM [dbo].[Pet]
  GO

  --What is the most popular coat color?
  SELECT c.[color_name] AS [MostPopColor]
  --p1.[color_id]
  FROM(
  SELECT [color_id]
	,Row_Number () OVER(ORDER BY COUNT(color_id) DESC) AS [RowNumber]
	FROM [Pet_Color] p
	GROUP BY [color_id]
	) p1
	INNER JOIN [Color] c
	ON c.color_id = p1.color_id
	WHERE RowNumber = 1
	GO

  --what is the least popular coat color?
  SELECT c.[color_name] AS [LeastPopColor]
  --p1.[color_id]
  FROM(
  SELECT [color_id]
	,Row_Number () OVER(ORDER BY COUNT(color_id) DESC) AS [RowNumber]
	FROM [Pet_Color] p
	GROUP BY [color_id]
	) p1
	INNER JOIN [Color] c
	ON c.color_id = p1.color_id
	WHERE RowNumber = (SELECT MAX(RowNumber)
						FROM
						(
						SELECT Row_Number () OVER(ORDER BY COUNT(color_id) DESC) AS [RowNumber]
						FROM [Pet_Color] p
						GROUP BY [color_id]
						) p2
						)
	GO

	--what is the second most popular coat color?
  SELECT c.[color_name] AS [SecondPopColor]
  --p1.[color_id]
  FROM(
  SELECT [color_id]
	,Row_Number () OVER(ORDER BY COUNT(color_id) DESC) AS [RowNumber]
	FROM [Pet_Color] p
	GROUP BY [color_id]
	) p1
	INNER JOIN [Color] c
	ON c.color_id = p1.color_id
	WHERE RowNumber = 2
	GO

  --what is the second most hungry pet?
  SELECT [pet_name]
  FROM(
  SELECT pet_name
	,[pet_id]
	,hunger_scale
	,Row_Number () OVER(ORDER BY hunger_scale DESC) AS [RowNumber]
	FROM [Pet] p
	INNER JOIN [Hunger] h
	ON h.hunger_id = p.hunger_id
	) p1
	WHERE RowNumber = 2
	GO
