SELECT
    c.nome_cancao AS cancao,
    COUNT(DISTINCT hr.id_usuario) AS reproducoes
FROM SpotifyClone.cancoes c
JOIN SpotifyClone.historico_reproducoes hr ON c.id_cancao = hr.id_cancao
GROUP BY c.nome_cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
