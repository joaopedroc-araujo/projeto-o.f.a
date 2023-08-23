SELECT
    a.nome_artista AS artista,
    al.nome_album AS album,
    COUNT(DISTINCT s.id_usuario) AS pessoas_seguidoras
FROM SpotifyClone.artistas a
JOIN SpotifyClone.albuns al ON a.id_artista = al.id_artista
LEFT JOIN SpotifyClone.seguindo s ON a.id_artista = s.id_artista
GROUP BY a.nome_artista, al.nome_album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;
