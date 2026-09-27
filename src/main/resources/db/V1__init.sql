REATE TABLE usuarios (
 id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 email VARCHAR(255) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 rol VARCHAR(20) NOT NULL,
 nombre VARCHAR(120) NOT NULL,
 activo BOOLEAN NOT NULL DEFAULT TRUE,
 CONSTRAINT chk_usuarios_rol
 CHECK (rol IN ('CLIENTE', 'TECNICO', 'ADMINISTRADOR'))
);
CREATE TABLE clientes (
                          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          usuario_id BIGINT NOT NULL UNIQUE REFERENCES usuarios(id),
                          telefono VARCHAR(40),
                          direccion VARCHAR(255)
);
CREATE TABLE tecnicos (
                          id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          usuario_id BIGINT NOT NULL UNIQUE REFERENCES usuarios(id),
                          especialidad VARCHAR(120)
);