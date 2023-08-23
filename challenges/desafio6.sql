SELECT
    ROUND(MIN(p.preco), 2) AS faturamento_minimo,
    ROUND(MAX(p.preco), 2) AS faturamento_maximo,
    ROUND(AVG(p.preco), 2) AS faturamento_medio,
    ROUND(SUM(p.preco), 2) AS faturamento_total
FROM SpotifyClone.usuarios u
JOIN SpotifyClone.planos p ON u.id_plano = p.id_plano;
