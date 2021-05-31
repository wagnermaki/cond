/* DROP TABLE*/
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'tb_status')
	BEGIN
		PRINT 'Dropping old version of tb_status'
		DROP TABLE tb_status
	END
GO

/*CREATE TABLE*/
-----------------------------------------------------------------------------
-- OBJECT    : tb_status
-- OBJECTIVE : CREATE TABLE tb_status
-----------------------------------------------------------------------------
-- SYSTEM 	 : webCondominio
-- GROUP	 : webCondominio
-- ACESS	 : bck_request
-----------------------------------------------------------------------------
-- AUTHOR 	 : 
-- DATE		 : Sunday, May 30, 2021 18:00:00 PM
 -----------------------------------------------------------------------------
SET ANSI_NULLS ON
SET ANSI_WARNINGS ON
SET QUOTED_IDENTIFIER ON
GO

PRINT 'Creating tb_status'
GO

CREATE TABLE tb_status
(
	id_Status			INTEGER IDENTITY(1,1),
	ds_Status			NVARCHAR(20) NOT NULL,
	sg_Status			CHAR(1) NOT NULL,
	id_Usu_Criacao		CHAR(3) NOT NULL,
	dt_Usu_Criacao		DATETIME NOT NULL,
	id_Usu_Atualizacao	CHAR(3) NULL,
	dt_Usu_Atualizacao	DATETIME NULL
)
GO

GRANT SELECT ON tb_status TO bck_request
GO

PRINT 'Finished creation of tb_status'
GO

PRINT 'Creating Pk_tb_status and Uk_tb_status'
GO

ALTER TABLE tb_status 
	ADD CONSTRAINT Pk_tb_status PRIMARY KEY (id_status)
GO

-- ---------------------------------------------------------------------
-- OBJECT    : tb_tipo_pessoa
-- OBJECTIVE : CREATE TABLE tb_tipo_pessoa
-- ---------------------------------------------------------------------
-- SYSTEM    : webCondominio.net
-- GROUP     : webCondominio.net
-- ACESS	 : bck_request
-- ---------------------------------------------------------------------
-- AUTHOR 	 : ERWIN SCRIPT GENERATOR
-- DATE		 : Sunday, May 30, 2021 18:00:00 PM
-- ---------------------------------------------------------------------
SET ANSI_NULLS ON
SET ANSI_WARNINGS ON
SET QUOTED_IDENTIFIER ON
GO

PRINT 'Creating tb_tipo_pessoa'
GO

CREATE TABLE tb_tipo_pessoa
(
	id_Tipo_Pessoa  INTEGER IDENTITY(1,1) NOT NULL,
	DS_Tipo_Pessoa  NVARCHAR(50),
	sg_Tipo_Pessoa  CHAR(1),
	ie_Status		CHAR(1) NOT NULL,
	id_Usu_Cadastro CHAR(3) NOT NULL,
	dt_Usu_Cadastro SMALLDATETIME NOT NULL,
	id_Usu_Atualiza INTEGER NULL,
	dt_Usu_Atualiza SMALLDATETIME NULL
)
GO

GRANT SELECT ON tb_tipo_pessoa To bck_request
GO
PRINT 'Finished creation of tb_tipo_pessoa'
GO

ALTER TABLE tb_tipo_pessoa
	ADD CONSTRAINT Pk_tb_tipo_pessoa PRIMARY KEY CLUSTERED (id_Tipo_Pessoa)
GO

/*CREATE Fks*/
PRINT 'Creating Fk of tb_tipo_pessoa'
GO
ALTER TABLE tb_tipo_pessoa
	ADD CONSTRAINT Fk_tb_status_tb_tipo_pessoa_id_status FOREIGN KEY (id_Status)
		REFERENCES tb_status (id_Status)
		NOT FOR REPLICATION	
GO
