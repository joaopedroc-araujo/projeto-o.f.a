SELECT
    COUNT(DISTINCT hr.id_cancao) AS musicas_no_historico
FROM SpotifyClone.usuarios u
JOIN SpotifyClone.historico_reproducoes hr ON u.id_usuario = hr.id_usuario
WHERE u.nome_usuario = 'Barbara Liskov';
