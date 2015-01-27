create database mysurvey;
--DROP database mysurvey;

CREATE TABLE TB_ENTREVISTADO (
  idTB_ENTREVISTADO INTEGER NOT NULL identity(1,1),
  NOME VARCHAR(45) NULL,
  EMAIL VARCHAR(45) NULL,
  SOBRENOME VARCHAR(45) NULL,
  PRIMARY KEY(idTB_ENTREVISTADO)
);

CREATE TABLE TB_ITENS_DA_QUESTAO (
  idTB_ITENS_DA_QUESTAO INTEGER NOT NULL identity(1,1) ,
  ItemA VARCHAR(max) NOT NULL,
  ItemB VARCHAR(max) NOT NULL,
  ItemC VARCHAR(max) NULL,
  ItemD VARCHAR(max) NULL,
  ItemE VARCHAR(max) NULL,
  PRIMARY KEY(idTB_ITENS_DA_QUESTAO)
);

CREATE TABLE TB_RESPONSAVEL (
  id_Responsavel INTEGER NOT NULL identity(1,1),
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  PRIMARY KEY(id_Responsavel)
);

CREATE TABLE TB_SURVEY (
  id_Survey INTEGER NOT NULL,
  TB_RESPONSAVEL_id_Responsavel INTEGER NOT NULL identity(1,1),
  Titulo VARCHAR(45) NOT NULL,
  Subtitulo VARCHAR(45) NOT NULL,
  Data_Criacao DATETIME NOT NULL,
  Data_fim DATETIME NULL,
  flag_ativo BIT NOT NULL,
  PRIMARY KEY(id_Survey),
  CONSTRAINT TB_SURVEY_FKIndex1
		FOREIGN KEY (TB_RESPONSAVEL_id_Responsavel) 
		REFERENCES  TB_RESPONSAVEL (id_Responsavel)
	);
GO 
CREATE INDEX TB_SURVEY_FKIndex1 ON TB_RESPONSAVEL (id_Responsavel);

CREATE TABLE TB_QUESTAO (
  id_Questao INTEGER NOT NULL identity(1,1),
  TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO INTEGER  NULL,
  TB_SURVEY_id_Survey INTEGER NOT NULL,
  Tipo VARCHAR(10) NOT NULL,
  CONSTRAINT cons_quest CHECK  (Tipo IN ('Objetiva','Subjetiva')),
  Pergunta VARCHAR(max) NOT NULL,
  Img VARBINARY(MAX) NULL,
  Randomica BIT NULL DEFAULT 'TRUE',
  Obrigatoria BIT NULL DEFAULT 'TRUE',
  Codigo BIT NOT NULL,
  Linguagem VARCHAR(10),
  CONSTRAINT cons_quest_ling CHECK  (Linguagem IN ('C#','PHP', 'JAVA','')),
  PRIMARY KEY(id_Questao),
	CONSTRAINT TB_QUESTAO_FKIndex1
		FOREIGN KEY (TB_SURVEY_id_Survey) 
		REFERENCES  TB_SURVEY (id_Survey),
	CONSTRAINT TB_QUESTAO_FKIndex2
		FOREIGN KEY (TB_ITENS_DA_QUESTAO_idTB_ITENS_DA_QUESTAO) 
		REFERENCES  TB_ITENS_DA_QUESTAO (idTB_ITENS_DA_QUESTAO)
	);
GO 
CREATE INDEX TB_QUESTAO_FKIndex1 ON TB_SURVEY (id_Survey);
CREATE INDEX TB_QUESTAO_FKIndex2 ON TB_ITENS_DA_QUESTAO (idTB_ITENS_DA_QUESTAO);
GO


CREATE TABLE TB_RESPOSTA (
  id_Resposta INTEGER NOT NULL identity(1,1),
  TB_ENTREVISTADO_idTB_ENTREVISTADO INTEGER  NOT NULL,
  TB_QUESTAO_id_Questao INTEGER NOT NULL,
  Resposta VARCHAR(max) NULL,
  Item VARCHAR(max) NULL,
  PRIMARY KEY(id_Resposta),
  	CONSTRAINT TB_RESPOSTA_FKIndex1
		FOREIGN KEY (TB_QUESTAO_id_Questao) 
		REFERENCES  TB_QUESTAO (id_Questao),
	CONSTRAINT TB_RESPOSTA_FKIndex2
		FOREIGN KEY (TB_ENTREVISTADO_idTB_ENTREVISTADO) 
		REFERENCES  TB_ENTREVISTADO (idTB_ENTREVISTADO)
	);
GO 
CREATE INDEX TB_RESPOSTA_FKIndex1 ON TB_QUESTAO (id_Questao);
CREATE INDEX TB_RESPOSTA_FKIndex2 ON TB_ENTREVISTADO (idTB_ENTREVISTADO);
GO





