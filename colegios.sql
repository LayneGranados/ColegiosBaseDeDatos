SET FOREIGN_KEY_CHECKS=0;



DROP TABLE IF EXISTS acudiente CASCADE
;
DROP TABLE IF EXISTS anio CASCADE
;
DROP TABLE IF EXISTS area_conocimiento CASCADE
;
DROP TABLE IF EXISTS asignatura CASCADE
;
DROP TABLE IF EXISTS asignatura_curso CASCADE
;
DROP TABLE IF EXISTS asignatura_curso_profesor CASCADE
;
DROP TABLE IF EXISTS boletin CASCADE
;
DROP TABLE IF EXISTS calificacion CASCADE
;
DROP TABLE IF EXISTS capacidad_excepcional CASCADE
;
DROP TABLE IF EXISTS caracter CASCADE
;
DROP TABLE IF EXISTS caracteristica_boletin CASCADE
;
DROP TABLE IF EXISTS colegio CASCADE
;
DROP TABLE IF EXISTS condicion_anio_anterior CASCADE
;
DROP TABLE IF EXISTS curso CASCADE
;
DROP TABLE IF EXISTS departamento CASCADE
;
DROP TABLE IF EXISTS detalle_calificacion CASCADE
;
DROP TABLE IF EXISTS detalle_logros CASCADE
;
DROP TABLE IF EXISTS directivo CASCADE
;
DROP TABLE IF EXISTS email_persona CASCADE
;
DROP TABLE IF EXISTS especialidad CASCADE
;
DROP TABLE IF EXISTS estudiante CASCADE
;
DROP TABLE IF EXISTS estudiante_acudiente CASCADE
;
DROP TABLE IF EXISTS fuentes_recursos CASCADE
;
DROP TABLE IF EXISTS grado CASCADE
;
DROP TABLE IF EXISTS institucion_familiar CASCADE
;
DROP TABLE IF EXISTS jornada CASCADE
;
DROP TABLE IF EXISTS logro_clasificacion CASCADE
;
DROP TABLE IF EXISTS logros CASCADE
;
DROP TABLE IF EXISTS matricula CASCADE
;
DROP TABLE IF EXISTS metodologia CASCADE
;
DROP TABLE IF EXISTS municipio CASCADE
;
DROP TABLE IF EXISTS periodo CASCADE
;
DROP TABLE IF EXISTS persona CASCADE
;
DROP TABLE IF EXISTS poblacion_victima CASCADE
;
DROP TABLE IF EXISTS profesor CASCADE
;
DROP TABLE IF EXISTS sede CASCADE
;
DROP TABLE IF EXISTS sit_acad_anio_ant CASCADE
;
DROP TABLE IF EXISTS telefono_persona CASCADE
;
DROP TABLE IF EXISTS tipo_directivo CASCADE
;
DROP TABLE IF EXISTS tipo_discapacidad CASCADE
;
DROP TABLE IF EXISTS tipo_documento CASCADE
;
DROP TABLE IF EXISTS tipo_jornada CASCADE
;
DROP TABLE IF EXISTS tipo_logro CASCADE
;
DROP TABLE IF EXISTS tipo_parentesco CASCADE
;
DROP TABLE IF EXISTS titular_curso CASCADE
;
DROP TABLE IF EXISTS usuario CASCADE
;
DROP TABLE IF EXISTS usuario_colegio CASCADE
;

CREATE TABLE acudiente
(
	acudiente_id INTEGER NOT NULL AUTO_INCREMENT,
	persona_id INTEGER NOT NULL,
	tipo_parentesco_id INTEGER NOT NULL,
	PRIMARY KEY (acudiente_id),
	UNIQUE UQ_acudiente_acudiente_id(acudiente_id),
	KEY (persona_id),
	KEY (tipo_parentesco_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE anio
(
	anio_id INTEGER NOT NULL AUTO_INCREMENT,
	anio INTEGER NOT NULL,
	sede_id INTEGER NOT NULL,
	descripcion TEXT,
	PRIMARY KEY (anio_id),
	KEY (sede_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE area_conocimiento
(
	area_id INTEGER NOT NULL AUTO_INCREMENT,
	ano DOUBLE,
	nombre VARCHAR(50),
	PRIMARY KEY (area_id),
	UNIQUE UQ_area_conocimiento_area_id(area_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE asignatura
(
	asignatura_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	area_id INTEGER,
	PRIMARY KEY (asignatura_id),
	UNIQUE UQ_asignatura_asignatura_id(asignatura_id),
	KEY (area_id),
	KEY (area_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE asignatura_curso
(
	asignatura_curso_id INTEGER NOT NULL AUTO_INCREMENT,
	asignatura_id INTEGER NOT NULL,
	curso_id INTEGER NOT NULL,
	cantidad_horas INTEGER,
	PRIMARY KEY (asignatura_curso_id),
	KEY (asignatura_id),
	KEY (curso_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE asignatura_curso_profesor
(
	asignatura_curso_profesor_id INTEGER NOT NULL AUTO_INCREMENT,
	asignatura_curso_id INTEGER NOT NULL,
	profesor_id INTEGER NOT NULL,
	fecha_inicio DATETIME NOT NULL,
	fecha_fin BIGINT,
	PRIMARY KEY (asignatura_curso_profesor_id),
	UNIQUE UQ_asignatura_curso_profesor_asignatura_curso_profesor_id(asignatura_curso_profesor_id),
	KEY (asignatura_curso_id),
	KEY (profesor_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE boletin
(
	boletin_id INTEGER NOT NULL AUTO_INCREMENT,
	matricula_id INTEGER NOT NULL,
	periodo_id INTEGER NOT NULL,
	observaciones TEXT,
	PRIMARY KEY (boletin_id),
	KEY (matricula_id),
	KEY (periodo_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE calificacion
(
	calificacion_id INTEGER NOT NULL AUTO_INCREMENT,
	asignatura_curso_id INTEGER NOT NULL,
	boletin_id INTEGER NOT NULL,
	observaciones TEXT,
	PRIMARY KEY (calificacion_id),
	KEY (asignatura_curso_id),
	KEY (boletin_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE capacidad_excepcional
(
	capacidad_excepcional_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (capacidad_excepcional_id),
	UNIQUE UQ_capacidad_excepcional_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE caracter
(
	caracter_id INTEGER NOT NULL AUTO_INCREMENT,
	codigo VARCHAR(3) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (caracter_id),
	UNIQUE UQ_caracter_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE caracteristica_boletin
(
	caracteristica_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	calculo VARCHAR(50) NOT NULL,
	tipo_valor VARCHAR(50) NOT NULL,
	PRIMARY KEY (caracteristica_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE colegio
(
	colegio_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo_dane VARCHAR(50) NOT NULL,
	PRIMARY KEY (colegio_id),
	UNIQUE UQ_colegio_codigo_dane(codigo_dane),
	UNIQUE UQ_colegio_colegio_id(colegio_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE condicion_anio_anterior
(
	condicion_anio_anterior_id INTEGER NOT NULL AUTO_INCREMENT,
	nombere VARCHAR(50) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (condicion_anio_anterior_id),
	UNIQUE UQ_condicion_anio_anterior_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE curso
(
	curso_id INTEGER NOT NULL AUTO_INCREMENT,
	grado_id INTEGER NOT NULL,
	nombre VARCHAR(10) NOT NULL,
	caracter_id INTEGER,
	especialidad_id INTEGER,
	metodologia_id INTEGER,
	PRIMARY KEY (curso_id),
	KEY (caracter_id),
	KEY (grado_id),
	KEY (especialidad_id),
	KEY (metodologia_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE departamento
(
	departamento_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo VARCHAR(10) NOT NULL,
	PRIMARY KEY (departamento_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE detalle_calificacion
(
	detalle_calificacion_id INTEGER NOT NULL AUTO_INCREMENT,
	calificacion_id INTEGER,
	caracteristica_id INTEGER NOT NULL,
	valor_caracteristica VARCHAR(50) NOT NULL,
	PRIMARY KEY (detalle_calificacion_id),
	KEY (calificacion_id),
	KEY (caracteristica_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE detalle_logros
(
	detalle_logro_id INTEGER NOT NULL AUTO_INCREMENT,
	logro_id INTEGER NOT NULL,
	logro_clasificacion_id INTEGER NOT NULL,
	calificacion_id INTEGER NOT NULL,
	PRIMARY KEY (detalle_logro_id),
	UNIQUE UQ_detalle_logros_detalle_logro_id(detalle_logro_id),
	KEY (calificacion_id),
	KEY (logro_clasificacion_id),
	KEY (logro_id),
	KEY (calificacion_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE directivo
(
	directivo_id INTEGER NOT NULL AUTO_INCREMENT,
	persona_id INTEGER NOT NULL,
	tipo_directivo_id INTEGER NOT NULL,
	jornada_id INTEGER NOT NULL,
	PRIMARY KEY (directivo_id),
	KEY (jornada_id),
	KEY (persona_id),
	KEY (tipo_directivo_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE email_persona
(
	telefono_persona_id INTEGER NOT NULL AUTO_INCREMENT,
	persona_id INTEGER NOT NULL,
	telefono VARCHAR(50),
	PRIMARY KEY (telefono_persona_id),
	UNIQUE UQ_email_persona_telefono_persona_id(telefono_persona_id),
	KEY (persona_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE especialidad
(
	especialidad_id INTEGER NOT NULL AUTO_INCREMENT,
	codigo VARCHAR(3) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (especialidad_id),
	UNIQUE UQ_especialidad_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE estudiante
(
	estudiante_id INTEGER NOT NULL AUTO_INCREMENT,
	codigo VARCHAR(50),
	persona_id INTEGER NOT NULL,
	PRIMARY KEY (estudiante_id),
	UNIQUE UQ_estudiante_estudiante_id(estudiante_id),
	UNIQUE UQ_estudiante_persona_id(persona_id),
	KEY (persona_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE estudiante_acudiente
(
	estudiante_acudiente_id INTEGER NOT NULL AUTO_INCREMENT,
	estudiante_ud INTEGER NOT NULL,
	acudiente_id INTEGER NOT NULL,
	PRIMARY KEY (estudiante_acudiente_id),
	UNIQUE UQ_estudiante_acudiente_estudiante_acudiente_id(estudiante_acudiente_id),
	UNIQUE UQ_estudiante_acudiente(estudiante_ud, acudiente_id),
	KEY (acudiente_id),
	KEY (estudiante_ud)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE fuentes_recursos
(
	fuentes_recursos_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (fuentes_recursos_id),
	UNIQUE UQ_fuentes_recursos_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE grado
(
	grado_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(25),
	jornada_id INTEGER,
	codigo VARCHAR(2),
	PRIMARY KEY (grado_id),
	UNIQUE UQ_grado_grado_id(grado_id),
	KEY (jornada_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE institucion_familiar
(
	institucion_familiar_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (institucion_familiar_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE jornada
(
	jornada_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	anio_id INTEGER NOT NULL,
	tipo_jornada_id INTEGER NOT NULL,
	PRIMARY KEY (jornada_id),
	UNIQUE UQ_jornada_jornada_id(jornada_id),
	KEY (tipo_jornada_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE logro_clasificacion
(
	logro_clasificacion_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (logro_clasificacion_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE logros
(
	logro_id INTEGER NOT NULL AUTO_INCREMENT,
	asignatura_id INTEGER NOT NULL,
	nombre TEXT NOT NULL,
	tipo_logro_id INTEGER,
	PRIMARY KEY (logro_id),
	UNIQUE UQ_logros_logro_id(logro_id),
	KEY (asignatura_id),
	KEY (tipo_logro_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE matricula
(
	matricula_id INTEGER NOT NULL AUTO_INCREMENT,
	numero_matricula VARCHAR(50),
	estudiante_id INTEGER NOT NULL,
	curso_id INTEGER NOT NULL,
	promovido BOOL,
	pob_vict_conf BOOL NOT NULL,
	poblacion_victima_id INTEGER,
	municipio_expulsor INTEGER,
	proviene_sector_privado BOOL NOT NULL,
	proviene_otro_municipio BOOL NOT NULL,
	tipo_discapacidad_id INTEGER,
	capacidad_excepcional_id INTEGER,
	institucion_familiar_id INTEGER,
	subsidiado BOOL NOT NULL,
	repitente BOOL NOT NULL,
	nuevo BOOL NOT NULL,
	cabeza_familia BOOL NOT NULL,
	ben_mad_flia BOOL NOT NULL,
	ben_vet_flia BOOL NOT NULL,
	ben_her_nac BOOL NOT NULL,
	caracter_id INTEGER,
	especialidad_id INTEGER NOT NULL,
	metodologia_id INTEGER,
	sit_acad_anio_ant_id INTEGER,
	fuentes_recursos_id INTEGER,
	zona_alumno ENUM('U','R') NOT NULL,
	condicion_anio_anterior_id INTEGER,
	fecha_matricula DATETIME NOT NULL,
	codigo VARCHAR(20) NOT NULL,
	PRIMARY KEY (matricula_id),
	UNIQUE UQ_matricula_matricula_id(matricula_id),
	KEY (condicion_anio_anterior_id),
	KEY (especialidad_id),
	KEY (fuentes_recursos_id),
	KEY (curso_id),
	KEY (estudiante_id),
	KEY (metodologia_id),
	KEY (municipio_expulsor),
	KEY (poblacion_victima_id),
	KEY (sit_acad_anio_ant_id),
	KEY (tipo_discapacidad_id),
	KEY (caracter_id),
	KEY (capacidad_excepcional_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE metodologia
(
	metodologia_id INTEGER NOT NULL AUTO_INCREMENT,
	codigo VARCHAR(2) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (metodologia_id),
	UNIQUE UQ_metodologia_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE municipio
(
	municipio_id INTEGER NOT NULL AUTO_INCREMENT,
	codigo_dane VARCHAR(10) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	departamento_id INTEGER NOT NULL,
	PRIMARY KEY (municipio_id),
	UNIQUE UQ_municipio_municipio_id(municipio_id),
	KEY (departamento_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE periodo
(
	periodo_id INTEGER NOT NULL AUTO_INCREMENT,
	jornada_id INTEGER NOT NULL,
	fecha_inicio DATETIME NOT NULL,
	fecha_fin DATETIME,
	comentario TEXT,
	PRIMARY KEY (periodo_id),
	KEY (jornada_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE persona
(
	persona_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	tipo_documento_id INTEGER NOT NULL,
	documento VARCHAR(50) NOT NULL,
	PRIMARY KEY (persona_id),
	UNIQUE UQ_persona_persona_id(persona_id),
	UNIQUE UQ_persona_tipo_documento_documento(tipo_documento_id, documento),
	KEY (tipo_documento_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE poblacion_victima
(
	poblacio_victima_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(100) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (poblacio_victima_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE profesor
(
	profesor_id INTEGER NOT NULL AUTO_INCREMENT,
	persona_id INTEGER NOT NULL,
	PRIMARY KEY (profesor_id),
	UNIQUE UQ_profesor_persona_id(persona_id),
	UNIQUE UQ_profesor_profesor_id(profesor_id),
	KEY (persona_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE sede
(
	sede_id INTEGER NOT NULL AUTO_INCREMENT,
	colegio_id INTEGER,
	municipio_id INTEGER NOT NULL,
	antiguo_codigo_dane VARCHAR(50) NOT NULL,
	consecutivo INTEGER NOT NULL,
	PRIMARY KEY (sede_id),
	UNIQUE UQ_Sede_antiguo_codigo_dane(antiguo_codigo_dane),
	UNIQUE UQ_Sede_sede_id(sede_id),
	KEY (colegio_id),
	KEY (municipio_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE sit_acad_anio_ant
(
	sit_acad_anio_ant_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	codigo VARCHAR(3),
	PRIMARY KEY (sit_acad_anio_ant_id),
	UNIQUE UQ_sit_acad_anio_ant_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE telefono_persona
(
	telefono_persona_id INTEGER NOT NULL AUTO_INCREMENT,
	persona_id INTEGER NOT NULL,
	telefono VARCHAR(50) NOT NULL,
	PRIMARY KEY (telefono_persona_id),
	UNIQUE UQ_telefono_persona_telefono_persona_id(telefono_persona_id),
	KEY (persona_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_directivo
(
	tipo_directivo_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (tipo_directivo_id),
	UNIQUE UQ_tipo_directivo_tipo_directivo_id(tipo_directivo_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_discapacidad
(
	tipo_discapacidad_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	codigo VARCHAR(3),
	PRIMARY KEY (tipo_discapacidad_id),
	UNIQUE UQ_tipo_discapacidad_codigo(codigo)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_documento
(
	tipo_documento_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (tipo_documento_id),
	UNIQUE UQ_tipo_documento_tipo_documento_id(tipo_documento_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_jornada
(
	tipo_jornada_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre BIGINT NOT NULL,
	PRIMARY KEY (tipo_jornada_id),
	UNIQUE UQ_tipo_jornada_tipo_jornada_id(tipo_jornada_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_logro
(
	tipo_logo_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	PRIMARY KEY (tipo_logo_id),
	UNIQUE UQ_tipo_logro_tipo_logo_id(tipo_logo_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE tipo_parentesco
(
	tipo_parentesco_id INTEGER NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
	PRIMARY KEY (tipo_parentesco_id),
	UNIQUE UQ_tipo_parentesco_tipo_parentesco_id(tipo_parentesco_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE titular_curso
(
	titular_curso_id INTEGER NOT NULL AUTO_INCREMENT,
	curso_id INTEGER NOT NULL,
	profesor_id INTEGER NOT NULL,
	fecha_inicio DATETIME NOT NULL,
	fecha_fin DATETIME,
	PRIMARY KEY (titular_curso_id),
	UNIQUE UQ_titular_curso_titular_curso_id(titular_curso_id),
	KEY (curso_id),
	KEY (profesor_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE usuario
(
	usuario_id INTEGER NOT NULL AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(100) NOT NULL,
	email VARCHAR(200) NOT NULL,
	PRIMARY KEY (usuario_id),
	UNIQUE UQ_usuario_email(email),
	UNIQUE UQ_usuario_username(username),
	UNIQUE UQ_usuario_usuario_id(usuario_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;


CREATE TABLE usuario_colegio
(
	usuario_colegio_id INTEGER NOT NULL AUTO_INCREMENT,
	usuario_id INTEGER NOT NULL,
	colegio_id INTEGER NOT NULL,
	PRIMARY KEY (usuario_colegio_id),
	UNIQUE UQ_usuario_id_colegio_id(usuario_id, colegio_id),
	KEY (colegio_id),
	KEY (usuario_id)

) COLLATE utf8_general_ci ENGINE=InnoDB
;



SET FOREIGN_KEY_CHECKS=1;


ALTER TABLE acudiente ADD CONSTRAINT FK_acudiente_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE acudiente ADD CONSTRAINT FK_acudiente_tipo_parentesco 
	FOREIGN KEY (tipo_parentesco_id) REFERENCES tipo_parentesco (tipo_parentesco_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE anio ADD CONSTRAINT FK_sede_id 
	FOREIGN KEY (sede_id) REFERENCES sede (sede_id)
;

ALTER TABLE asignatura ADD CONSTRAINT FK_asignatura_area_conocimiento 
	FOREIGN KEY (area_id) REFERENCES area_conocimiento (area_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE asignatura_curso ADD CONSTRAINT FK_asignatura_curso_asignatura 
	FOREIGN KEY (asignatura_id) REFERENCES asignatura (asignatura_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE asignatura_curso_profesor ADD CONSTRAINT FK_asignatura_curso_profesor_asignatura_curso 
	FOREIGN KEY (asignatura_curso_id) REFERENCES asignatura_curso (asignatura_curso_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE asignatura_curso_profesor ADD CONSTRAINT FK_asignatura_curso_profesor_profesor 
	FOREIGN KEY (profesor_id) REFERENCES profesor (profesor_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE boletin ADD CONSTRAINT FK_boletin_matricula 
	FOREIGN KEY (matricula_id) REFERENCES matricula (matricula_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE boletin ADD CONSTRAINT FK_boletin_periodo 
	FOREIGN KEY (periodo_id) REFERENCES periodo (periodo_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE calificacion ADD CONSTRAINT FK_calificacion_asignatura_curso 
	FOREIGN KEY (asignatura_curso_id) REFERENCES asignatura_curso (asignatura_curso_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE calificacion ADD CONSTRAINT FK_calificacion_boletin 
	FOREIGN KEY (boletin_id) REFERENCES boletin (boletin_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE curso ADD CONSTRAINT FK_caracter_id 
	FOREIGN KEY (caracter_id) REFERENCES caracter (caracter_id)
;

ALTER TABLE curso ADD CONSTRAINT FK_curso_grado 
	FOREIGN KEY (grado_id) REFERENCES grado (grado_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE curso ADD CONSTRAINT FK_especialidad_id 
	FOREIGN KEY (especialidad_id) REFERENCES especialidad (especialidad_id)
;

ALTER TABLE curso ADD CONSTRAINT FK_metodologia_id 
	FOREIGN KEY (metodologia_id) REFERENCES metodologia (metodologia_id)
;

ALTER TABLE detalle_calificacion ADD CONSTRAINT FK_detalle_calificacion_calificacion 
	FOREIGN KEY (calificacion_id) REFERENCES calificacion (calificacion_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE detalle_calificacion ADD CONSTRAINT FK_detalle_calificacion_caracteristica_boletin 
	FOREIGN KEY (caracteristica_id) REFERENCES caracteristica_boletin (caracteristica_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE detalle_logros ADD CONSTRAINT FK_detalle_logros_calificacion 
	FOREIGN KEY (calificacion_id) REFERENCES calificacion (calificacion_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE detalle_logros ADD CONSTRAINT FK_detalle_logros_logro_clasificacion 
	FOREIGN KEY (logro_clasificacion_id) REFERENCES logro_clasificacion (logro_clasificacion_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE detalle_logros ADD CONSTRAINT FK_logros_obtenidos_logros 
	FOREIGN KEY (logro_id) REFERENCES logros (logro_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE directivo ADD CONSTRAINT FK_Directivo_jornada 
	FOREIGN KEY (jornada_id) REFERENCES jornada (jornada_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE directivo ADD CONSTRAINT FK_Directivo_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE directivo ADD CONSTRAINT FK_Directivo_tipo_directivo 
	FOREIGN KEY (tipo_directivo_id) REFERENCES tipo_directivo (tipo_directivo_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE email_persona ADD CONSTRAINT FK_email_persona_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE estudiante ADD CONSTRAINT FK_estudiante_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE NO ACTION ON UPDATE RESTRICT
;

ALTER TABLE estudiante_acudiente ADD CONSTRAINT FK_estudiante_acudiente_acudiente 
	FOREIGN KEY (acudiente_id) REFERENCES acudiente (acudiente_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE estudiante_acudiente ADD CONSTRAINT FK_estudiante_acudiente_estudiante 
	FOREIGN KEY (estudiante_ud) REFERENCES estudiante (estudiante_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE grado ADD CONSTRAINT FK_grado_jornada 
	FOREIGN KEY (jornada_id) REFERENCES jornada (jornada_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE jornada ADD CONSTRAINT FK_jornada_tipo_jornada 
	FOREIGN KEY (tipo_jornada_id) REFERENCES tipo_jornada (tipo_jornada_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE logros ADD CONSTRAINT FK_logros_asignatura 
	FOREIGN KEY (asignatura_id) REFERENCES asignatura (asignatura_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE logros ADD CONSTRAINT FK_logros_tipo_logro 
	FOREIGN KEY (tipo_logro_id) REFERENCES tipo_logro (tipo_logo_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE matricula ADD CONSTRAINT FK_matricula_estudiante 
	FOREIGN KEY (estudiante_id) REFERENCES estudiante (estudiante_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE municipio ADD CONSTRAINT FK_departamento_id 
	FOREIGN KEY (departamento_id) REFERENCES departamento (departamento_id)
;

ALTER TABLE periodo ADD CONSTRAINT FK_periodo_jornada 
	FOREIGN KEY (jornada_id) REFERENCES jornada (jornada_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE persona ADD CONSTRAINT FK_persona_tipo_documento 
	FOREIGN KEY (tipo_documento_id) REFERENCES tipo_documento (tipo_documento_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE profesor ADD CONSTRAINT FK_profesor_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE sede ADD CONSTRAINT FK_colegio 
	FOREIGN KEY (colegio_id) REFERENCES colegio (colegio_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE sede ADD CONSTRAINT FK_Sede_municipio 
	FOREIGN KEY (municipio_id) REFERENCES municipio (municipio_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE telefono_persona ADD CONSTRAINT FK_telefono_persona_persona 
	FOREIGN KEY (persona_id) REFERENCES persona (persona_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE titular_curso ADD CONSTRAINT FK_titular_curso_profesor 
	FOREIGN KEY (profesor_id) REFERENCES profesor (profesor_id)
	ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE usuario_colegio ADD CONSTRAINT FK_colegio_id 
	FOREIGN KEY (colegio_id) REFERENCES colegio (colegio_id)
;

ALTER TABLE usuario_colegio ADD CONSTRAINT FK_usuario_id 
	FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id)
;
