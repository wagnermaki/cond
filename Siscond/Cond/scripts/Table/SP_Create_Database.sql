-- Code to Sql Server Create DATABASE
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'Condomino')
	BEGIN
		SELECT 'Database Name already Exists' AS Message
	END
ELSE
	BEGIN
		CREATE DATABASE [Condomino]
		SELECT 'New Database is Created'
	END
	
CREATE USER [bck_request] FOR LOGIN [DESKTOP-4F5NR30\Emerson Maki];
GO	