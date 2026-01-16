-- Qual a quantidade de universidades por país?
SELECT `Country`, Count(`Country`) FROM `2025_Overall_Rank` GROUP BY `Country` ORDER BY COUNT(`Country`);

-- Quantos % cada setor compõe em comparação com o total?
SELECT Sector, COUNT(`Sector`), COUNT(`Sector`) * 100.0 / SUM((COUNT(`Sector`))) OVER () AS Percentage FROM `2025_Overall_Rank` GROUP BY `Sector` ORDER BY COUNT(`Sector`);

-- Qual foi a instituição brasileira melhor colocada no ranking?
SELECT tabela_original.* FROM `2025_Overall_Rank` tabela_original
    JOIN(
        SELECT `Global_Rank`, `Country`, MIN(`Global_Rank`) as MinValue FROM `2025_Overall_Rank` WHERE `Country` = 'BRA' GROUP BY `Global_Rank`
    ) tabela_temp 
    ON tabela_original.Global_Rank = tabela_temp.MinValue
    ORDER BY tabela_original.`Global_Rank` 
    ASC LIMIT 1 ;

-- E a pior?
SELECT tabela_original.* FROM `2025_Overall_Rank` tabela_original
    JOIN(
        SELECT `Global_Rank`, `Country`, MIN(`Global_Rank`) as MinValue FROM `2025_Overall_Rank` WHERE `Country` = 'BRA' GROUP BY `Global_Rank`
    ) tabela_temp 
    ON tabela_original.Global_Rank = tabela_temp.MinValue
    ORDER BY tabela_original.`Global_Rank` 
    DESC LIMIT 1 ;       