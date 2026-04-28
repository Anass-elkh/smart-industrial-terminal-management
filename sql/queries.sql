-- ============================================================
-- SYSTÈME INTELLIGENT DE GESTION DES TERMINAUX INDUSTRIELS
-- Département Cutting - Lear Corporation
-- Scripts et Requêtes SQL d'Exploitation & Reporting
-- ============================================================

-- 1. Calcul du stock net disponible par référence de terminal
SELECT 
    t.Reference_Terminal,
    t.Designation,
    t.Section_Cable,
    t.Seuil_Securite,
    SUM(m.Quantite_Entree) - SUM(m.Quantite_Sortie) AS Stock_Disponible,
    CASE 
        WHEN (SUM(m.Quantite_Entree) - SUM(m.Quantite_Sortie)) <= t.Seuil_Securite THEN 'ALERTE_REAPPRO'
        WHEN (SUM(m.Quantite_Entree) - SUM(m.Quantite_Sortie)) <= (t.Seuil_Securite * 1.25) THEN 'ATTENTION_KANBAN'
        ELSE 'OPTIMAL'
    END AS Statut_Kanban
FROM tbl_Terminaux t
LEFT JOIN tbl_Mouvements_Stock m ON t.ID_Terminal = m.ID_Terminal
GROUP BY t.Reference_Terminal, t.Designation, t.Section_Cable, t.Seuil_Securite;

-- 2. Suivi des commandes en attente de réception (Waiting Reception)
SELECT 
    wr.ID_Reception,
    wr.Num_Bon_Livraison,
    t.Reference_Terminal,
    wr.Quantite_Attendue,
    wr.Date_Arrivee,
    DATEDIFF('d', wr.Date_Arrivee, NOW()) AS Jours_En_Attente,
    wr.Statut_Controle
FROM tbl_Waiting_Reception wr
INNER JOIN tbl_Terminaux t ON wr.ID_Terminal = t.ID_Terminal
WHERE wr.Statut_Reception = 'EN_ATTENTE'
ORDER BY wr.Date_Arrivee ASC;

-- 3. Taux d'occupation et localisation spatiale des racks de stockage
SELECT 
    r.Code_Allee,
    r.Code_Rack,
    r.Niveau,
    r.Position,
    t.Reference_Terminal,
    e.Quantite_Bobines,
    e.Date_Dernier_Mouvement
FROM tbl_Emplacements_Rack r
LEFT JOIN tbl_Stock_Emplacement e ON r.ID_Emplacement = e.ID_Emplacement
LEFT JOIN tbl_Terminaux t ON e.ID_Terminal = t.ID_Terminal
ORDER BY r.Code_Allee, r.Code_Rack, r.Niveau, r.Position;

-- 4. Traçabilité des mouvements d'entrées/sorties par opérateur et poste
SELECT 
    m.ID_Mouvement,
    m.Date_Heure_Scan,
    t.Reference_Terminal,
    m.Type_Mouvement, -- Entrée / Sortie / Transfert
    m.Quantite,
    m.Code_Operateur,
    m.Ligne_Coupe_Destinataire
FROM tbl_Mouvements_Stock m
INNER JOIN tbl_Terminaux t ON m.ID_Terminal = t.ID_Terminal
WHERE m.Date_Heure_Scan >= DATEADD('d', -7, NOW())
ORDER BY m.Date_Heure_Scan DESC;
