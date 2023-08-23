SELECT
    a.nome_artista AS artista,
    al.nome_album AS album
FROM SpotifyClone.artistas a
JOIN SpotifyClone.albuns al ON a.id_artista = al.id_artista
WHERE a.nome_artista = 'Elis Regina'
ORDER BY al.nome_album;
