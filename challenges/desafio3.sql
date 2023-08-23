SELECT
    u.nome_usuario AS pessoa_usuaria,
    COUNT(DISTINCT hr.id_cancao) AS musicas_ouvidas,
    ROUND(SUM(c.duracao_segundos / 60), 2) AS total_minutos
FROM SpotifyClone.usuarios u
JOIN SpotifyClone.historico_reproducoes hr ON u.id_usuario = hr.id_usuario
JOIN SpotifyClone.cancoes c ON hr.id_cancao = c.id_cancao
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;
