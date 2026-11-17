
CREATE DATABASE IF NOT EXISTS CyberFab;

USE CyberFab;

CREATE TABLE Operadores (
    id_operador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    funcao VARCHAR(50),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Cargas (
    id_carga INT PRIMARY KEY AUTO_INCREMENT,
    codigo_etiqueta VARCHAR(50) UNIQUE NOT NULL,
    descricao VARCHAR(150),
    peso DECIMAL(8,2),
    status_atual VARCHAR(30) DEFAULT 'Aguardando',
    prioridade VARCHAR(20) DEFAULT 'Normal',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Movimentacoes (
    id_movimentacao INT PRIMARY KEY AUTO_INCREMENT,
    id_operador INT,
    id_carga INT,
    origem VARCHAR(50) NOT NULL,
    destino VARCHAR(50) NOT NULL,
    status_movimentacao VARCHAR(30) DEFAULT 'Pendente',
    data_hora_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_hora_fim DATETIME,
    observacoes VARCHAR(200),

    FOREIGN KEY (id_operador)
    REFERENCES Operadores(id_operador),
    FOREIGN KEY (id_carga)
    REFERENCES Cargas(id_carga)
);

CREATE TABLE Informacoes_Tecnicas (
    id_informacao INT PRIMARY KEY AUTO_INCREMENT,
    modelo_empilhadeira VARCHAR(100),
    id_arduino VARCHAR(50),
    id_bluetooth VARCHAR(50),
    motores VARCHAR(100),
    servo_motor VARCHAR(100),
    ponte_h VARCHAR(50),
    tensao_operacao VARCHAR(30),
    microcontrolador VARCHAR(100),
    descricao_tecnica VARCHAR(255)
);

CREATE TABLE Componentes_Kit (
    id_componente INT PRIMARY KEY AUTO_INCREMENT,
    nome_componente VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    unidade VARCHAR(20),
    especificacao VARCHAR(150),
    categoria VARCHAR(50),
    incluido_no_kit BOOLEAN DEFAULT TRUE
);

CREATE TABLE Funcionamento (
    id_funcionamento INT PRIMARY KEY AUTO_INCREMENT,
    id_operador INT,
    data_hora_ligamento DATETIME NOT NULL,
    data_hora_desligamento DATETIME,
    status_funcionamento VARCHAR(30) DEFAULT 'Ligada',
    observacoes VARCHAR(200),

    FOREIGN KEY (id_operador)
    REFERENCES Operadores(id_operador)
);

CREATE TABLE Leituras_Ambientais (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    modelo_sensor VARCHAR(30),
    temperatura DECIMAL(5,2),
    umidade DECIMAL(5,2),
    unidade_temperatura VARCHAR(10) DEFAULT 'Celsius',
    unidade_umidade VARCHAR(10) DEFAULT '%',
    data_hora_leitura DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Operadores
(nome, matricula, telefone, email, funcao)
VALUES
('Karol', '123456', NULL, NULL, 'Operadora');

INSERT INTO Cargas
(codigo_etiqueta, descricao, peso, status_atual, prioridade)
VALUES
('0024', 'Empilhadeira', 2.50, 'Aguardando', 'Normal');

INSERT INTO Movimentacoes
(id_operador, id_carga, origem, destino,
 status_movimentacao, data_hora_inicio)
VALUES
(1, 1, '90', '500', 'Concluida', '2026-10-26 21:00:00');

INSERT INTO Informacoes_Tecnicas
(modelo_empilhadeira,id_arduino,id_bluetooth,motores,servo_motor,ponte_h,tensao_operacao,microcontrolador,descricao_tecnica)
VALUES
('Empilhadeira STEAM EP-3','Arduino Nano V3','HC-05/HC-06','2 motores DC 6V com caixa de reducao','MG90D - 360 graus','L298N - 6 a 24V','6V nos motores','ATmega328P compativel com Nano V3','Empilhadeira robotica com controle Bluetooth');

INSERT INTO Componentes_Kit
(nome_componente, quantidade, unidade, especificacao, categoria)
VALUES
('Chassi acrilico EP-3', 1, 'unidade', 'Base de 4mm e demais pecas de 3mm', 'Estrutura'),
('Arduino Nano V3', 1, 'unidade', 'Placa microcontroladora', 'Eletronica'),
('Servo motor MG90D', 1, 'unidade', 'Rotacao de 360 graus', 'Eletronica'),
('Motor DC', 2, 'unidades', '6V com caixa de reducao e rodas', 'Mecanica'),
('Ponte H L298N', 1, 'unidade', 'Controlador de motores de 6 a 24V', 'Eletronica'),
('Modulo Bluetooth', 1, 'unidade', 'HC-05 ou HC-06', 'Comunicacao'),
('Mini chave switch', 1, 'unidade', 'Chave liga e desliga', 'Eletrica'),
('Jumper M/F', 20, 'unidades', 'Fios condutores macho/femea', 'Conexao'),
('Jumper M/M', 5, 'unidades', 'Fios condutores macho/macho', 'Conexao'),
('Fio AWG 28', 1, 'metro', 'Vermelho, preto e amarelo', 'Eletrica'),
('Suporte de pilhas', 1, 'unidade', 'Para 4 pilhas AA ou baterias 14500', 'Alimentacao'),
('Abracadeiras plasticas', 3, 'unidades', '15 cm', 'Fixacao'),
('Varetas plasticas', 2, 'unidades', 'Brancas ou transparentes', 'Estrutura'),
('LEDs brancos', 2, 'unidades', '5mm - 2V e 20mA', 'Eletronica'),
('Resistores', 3, 'unidades', '220R, 470R e 1K Ohms - 1/4W', 'Eletronica'),
('Buzzer ativo', 1, 'unidade', '5V', 'Eletronica'),
('Rodizio roda boba', 1, 'unidade', '25mm', 'Mecanica'),
('Parafusos', 8, 'unidades', '2 autoatarraxantes, 2 M2,5x12mm e 4 M2,5x16mm', 'Fixacao'),
('Pilhas alcalinas AA', 3, 'unidades', 'Pilhas alcalinas', 'Alimentacao'),
('Bateria recarregavel 14500', 1, 'unidade', '3,7V', 'Alimentacao'),
('DHT11', 1, 'unidade', 'Sensor adicional de temperatura e umidade', 'Sensor adicional');

INSERT INTO Funcionamento
(id_operador, data_hora_ligamento, status_funcionamento)
VALUES
(1, CURRENT_TIMESTAMP, 'Ligada');

INSERT INTO Leituras_Ambientais
(modelo_sensor, temperatura, umidade)
VALUES
('DHT11', 25.50, 60.00);

SELECT * FROM Operadores;
SELECT * FROM Cargas;
SELECT * FROM Movimentacoes;
SELECT * FROM Informacoes_Tecnicas;
SELECT * FROM Componentes_Kit;
SELECT * FROM Funcionamento;
SELECT * FROM Leituras_Ambientais;

SELECT
    id_funcionamento,
    data_hora_ligamento,
    data_hora_desligamento,
    status_funcionamento,
    TIMESTAMPDIFF(
        SECOND,
        data_hora_ligamento,
        COALESCE(data_hora_desligamento, CURRENT_TIMESTAMP)
    ) AS tempo_segundos,
    SEC_TO_TIME(
        TIMESTAMPDIFF(
            SECOND,
            data_hora_ligamento,
            COALESCE(data_hora_desligamento, CURRENT_TIMESTAMP)
        )
    ) AS tempo_total
FROM Funcionamento;

SELECT
    id_leitura,
    modelo_sensor,
    temperatura,
    umidade,
    data_hora_leitura
FROM Leituras_Ambientais
ORDER BY data_hora_leitura DESC;

SELECT
    MAX(temperatura) AS temperatura_maxima,
    MIN(temperatura) AS temperatura_minima,
    AVG(temperatura) AS temperatura_media
FROM Leituras_Ambientais;

SELECT
    AVG(umidade) AS umidade_media,
    MAX(umidade) AS umidade_maxima,
    MIN(umidade) AS umidade_minima
FROM Leituras_Ambientais;

SELECT
    categoria,
    nome_componente,
    quantidade,
    unidade,
    especificacao
FROM Componentes_Kit
ORDER BY categoria;
