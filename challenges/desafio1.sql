DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(255) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (nome_plano, preco)
VALUES
  ('Plano Gratuito', 0.00),
  ('Plano Universitário', 5.99),
  ('Plano Pessoal', 6.99),
  ('Plano Familiar', 7.99);

CREATE TABLE SpotifyClone.artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(255) NOT NULL
);

CREATE TABLE SpotifyClone.usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(255) NOT NULL,
    id_plano INT,
    FOREIGN KEY (id_plano) REFERENCES SpotifyClone.planos(id_plano)
);


  INSERT INTO SpotifyClone.artistas (nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');


INSERT INTO SpotifyClone.usuarios (nome_usuario, id_plano)
VALUES
  ('Barbara Liskov', 1),
  ('Robert Cecil Martin', 1),
  ('Ada Lovelace', 4),
  ('Martin Fowler', 4),
  ('Sandi Metz', 4),
  ('Paulo Freire', 2),
  ('Bell Hooks', 2),
  ('Christopher Alexander', 3),
  ('Judith Butler', 3),
  ('Jorge Amado', 3);

CREATE TABLE SpotifyClone.albuns (
    id_album INT AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(255) NOT NULL,
    id_artista INT,
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas(id_artista)
);

INSERT INTO SpotifyClone.albuns (nome_album, id_artista)
VALUES
  ('Renaissance', 1),
  ('Jazz', 2),
  ('Hot Space', 2),
  ('Falso Brilhante', 3),
  ('Vento de Maio', 3),
  ('QVVJFA?', 4),
  ('Somewhere Far Beyond', 5),
  ('I Put A Spell On You', 6);

CREATE TABLE SpotifyClone.cancoes (
    id_cancao INT AUTO_INCREMENT PRIMARY KEY,
    nome_cancao VARCHAR(255) NOT NULL,
    id_album INT,
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.albuns(id_album)
);

INSERT INTO SpotifyClone.cancoes (nome_cancao, id_album)
VALUES
  ('Break my soul', 1),
  ('Virgos Groove', 1),
  ('Alien Superstar', 1),
  ('Dont stop me now', 2),
  ('Under Pressure', 3),
  ('Como nossos pais', 4),
  ('O medo de amar é o medo de ser livre', 5),
  ('Samba em Paris', 6),
  ('The Bards Song', 7),
  ('Feeling Good', 8);

CREATE TABLE SpotifyClone.historico_reproducoes (
    id_usuario INT,
    id_cancao INT,
    data_hora DATETIME,
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
    FOREIGN KEY (id_cancao) REFERENCES SpotifyClone.cancoes(id_cancao),
    CONSTRAINT unique_usuario_cancao UNIQUE (id_usuario, id_cancao)
);

INSERT INTO SpotifyClone.historico_reproducoes (id_usuario, id_cancao, data_hora)
VALUES
 	('1', '8', '2022-02-28 10:45:55'),
	('1', '2', '2020-05-02 05:30:35'),
	('1', '10', '2020-03-06 11:22:33'),
	('2', '10', '2022-08-05 08:05:17'),
	('2', '7', '2020-01-02 07:40:33'),
	('3', '10', '2020-11-13 16:55:13'),
	('3', '2', '2020-12-05 18:38:30'),
	('4', '8', '2021-08-15 17:10:10'),
	('5', '8', '2022-01-09 01:44:33'),
	('5', '5', '2020-08-06 15:23:43'),
	('6', '7', '2017-01-24 00:31:17'),
	('6', '1', '2017-10-12 12:35:20'),
	('7', '4', '2011-12-15 22:30:49'),
	('8', '4', '2012-03-17 14:56:41'),
	('9', '9', '2022-02-24 21:14:22'),
	('10', '3', '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.seguindo (
    id_usuario INT,
    id_artista INT,
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas(id_artista),
    CONSTRAINT unique_usuario_artista UNIQUE (id_usuario, id_artista)
);


INSERT INTO SpotifyClone.seguindo (id_usuario, id_artista)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10,2);
