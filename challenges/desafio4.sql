SELECT
    u.nome_usuario AS pessoa_usuaria,
    CASE
        WHEN MAX(hr.data_hora) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM SpotifyClone.usuarios u
LEFT JOIN SpotifyClone.historico_reproducoes hr ON u.id_usuario = hr.id_usuario
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;
