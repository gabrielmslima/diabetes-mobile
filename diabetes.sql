CREATE DATABASE IF NOT EXISTS diabetes;
USE diabetes;

CREATE TABLE controle_dt (
  ID_DT int(3) NOT NULL AUTO_INCREMENT,
  GLICOSE float DEFAULT NULL,
  GORD_FIG float NOT NULL,
  CPA float NOT NULL,
  RED_PESO float NOT NULL,
  paciente_ID_PC varchar(45) NOT NULL,
  Date datetime DEFAULT NOW(),
  PRIMARY KEY (ID_DT)
);

INSERT INTO controle_dt (ID_DT, GLICOSE, GORD_FIG, CPA, RED_PESO, paciente_ID_PC, Date) VALUES
(1, 213, 0, 0, 0, '1', '2023-09-13'),
(2, 200, 0, 0, 0, '1', '2023-10-11'),
(3, 190, 0, 0, 0, '1', '2023-09-19'),
(4, 120, 0, 0, 0, '3', '2023-10-28'),
(5, 340, 0, 0, 0, '3', '2023-12-13'),
(6, 101, 0, 0, 0, '2', '2023-04-30'),
(7, 340, 0, 0, 0, '2', '2023-02-20'),
(8, 120, 0, 0, 0, '2', '2023-03-10');
(8, 90, 0, 0, 0, '4', '2023-03-10');

CREATE TABLE paciente (
  ID_PC int(11) NOT NULL AUTO_INCREMENT,
  NOME_PC varchar(50) NOT NULL,
  IDADE int(3) NOT NULL,
  PESO float NOT NULL,
  ALTURA float NOT NULL,
  SEXO varchar(10) NOT NULL,
  NATF int(4) NOT NULL,
  controle_dt_ID_DT int(3) NOT NULL,
  PRIMARY KEY (ID_PC),
  KEY fk_paciente_controle_dt_idx (controle_dt_ID_DT),
  CONSTRAINT fk_paciente_controle_dt FOREIGN KEY (controle_dt_ID_DT) REFERENCES controle_dt (ID_DT) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO paciente (ID_PC, NOME_PC, IDADE, PESO, ALTURA, SEXO, NATF, controle_dt_ID_DT) VALUES
(1, 'Matheus Bispo', 20, 80.6, 1.72, 'Masculino', 0, 2),
(2, 'Gabriel Nunes', 17, 60.0, 1.75, 'Macho', 1, 3),
(3, 'Victor Hugo', 18, 120.0, 1.80, 'Meio Gay', 2, 4),
(4, 'Leandro marinho', 22, 60.0, 1.75, 'Muito Gay', 3, 1);

CREATE TABLE medicamento (
  ID_MED int(3) NOT NULL AUTO_INCREMENT,
  medicamento varchar(45) NOT NULL,
  dose_med float NOT NULL,
  paciente_ID_PC int(11) NOT NULL,
  PRIMARY KEY (ID_MED),
  KEY fk_medicamento_paciente1_idx (paciente_ID_PC),
  CONSTRAINT fk_medicamento_paciente1 FOREIGN KEY (paciente_ID_PC) REFERENCES paciente (ID_PC) ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO medicamento (ID_MED, medicamento, dose_med, paciente_ID_PC) VALUES
(1, 'Ivermectina', 135, 1),
(2, 'Solumox', 102, 1),
(7, 'Losartana Potassica', 50, 1),
(8, 'Enalapril', 5, 1),
(9, 'Losartana Potassica', 50, 2),
(10, 'Atenolol', 25, 2),
(11, 'Valsartana', 160, 2);

ALTER TABLE controle_dt MODIFY ID_DT int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE medicamento MODIFY ID_MED int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
ALTER TABLE paciente MODIFY ID_PC int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

COMMIT;