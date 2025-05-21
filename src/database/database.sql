-- Tabela de Cozinheiras
CREATE TABLE public.cozinheira_tb (
	id_usuario INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	CONSTRAINT cozinheira_tb_pk PRIMARY KEY (id_usuario),
	CONSTRAINT cozinheira_tb_email_unique UNIQUE (email)
);

-- Tabela de Pratos
CREATE TABLE public.prato_tb (
	id_prato INT NOT NULL,
	dia DATE NOT NULL,
	turno VARCHAR(50) NOT NULL,
	principal VARCHAR(255) NOT NULL,
	sobremesa VARCHAR(255) NOT NULL,
	bebida VARCHAR(255) NOT NULL,
	id_usuario INT NOT NULL,
	CONSTRAINT prato_tb_pk PRIMARY KEY (id_prato),
	CONSTRAINT prato_tb_usuario_fk FOREIGN KEY (id_usuario) REFERENCES cozinheira_tb(id_usuario)
		-- Se quiser garantir que um usuário só possa cadastrar um prato por dia e turno:
	-- ,CONSTRAINT prato_unico_dia_turno UNIQUE (id_usuario, dia, turno)
);

-- Tabela de Votação
CREATE TABLE public.votacao_tb (
	id_voto INT NOT NULL,
	id_prato INT NOT NULL,
	voto BOOLEAN NOT NULL,
	data_voto DATE NOT NULL,
	ip_usuario INET NOT NULL,
	CONSTRAINT votacao_tb_pk PRIMARY KEY (id_voto),
	CONSTRAINT votacao_tb_prato_fk FOREIGN KEY (id_prato) REFERENCES prato_tb(id_prato),
	-- Um IP só pode votar uma vez por prato:
	CONSTRAINT votacao_tb_unico_ip_prato UNIQUE (ip_usuario, id_prato)
);
