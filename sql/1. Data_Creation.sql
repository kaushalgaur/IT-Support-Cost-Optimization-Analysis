Create database db;
use db;

CREATE TABLE tickets (
    ticket_id VARCHAR(20) PRIMARY KEY,
    issue_category VARCHAR(50) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    resolution_time_hours DECIMAL(10,2),
    engineer_hourly_cost DECIMAL(10,2),
    engineer_hours_spent DECIMAL(10,2),
    client_type VARCHAR(20) NOT NULL,
    escalation_count INT,
    customer_satisfaction_score DECIMAL(3,2)
);

INSERT INTO tickets (
    ticket_id,
    issue_category,
    priority,
    resolution_time_hours,
    engineer_hourly_cost,
    engineer_hours_spent,
    client_type,
    escalation_count,
    customer_satisfaction_score
)
SELECT
    CONCAT('TKT', LPAD(n, 6, '0')),

    CASE MOD(n, 5)
        WHEN 0 THEN 'Network'
        WHEN 1 THEN 'Software'
        WHEN 2 THEN 'Hardware'
        WHEN 3 THEN 'Access'
        ELSE 'Security'
    END AS issue_category,

    CASE
        WHEN MOD(n, 100) < 10 THEN 'Critical'
        WHEN MOD(n, 100) < 30 THEN 'High'
        WHEN MOD(n, 100) < 65 THEN 'Medium'
        ELSE 'Low'
    END AS priority,

    /* ~10% missing resolution time */
    CASE
        WHEN MOD(n, 10) = 0 THEN NULL
        WHEN MOD(n, 100) < 10 THEN ROUND(14 + MOD(n * 7, 20) + RAND() * 4, 2)
        WHEN MOD(n, 100) < 30 THEN ROUND(7 + MOD(n * 5, 12) + RAND() * 3, 2)
        WHEN MOD(n, 100) < 65 THEN ROUND(3 + MOD(n * 3, 8) + RAND() * 2, 2)
        ELSE ROUND(0.5 + MOD(n * 2, 4) + RAND(), 2)
    END AS resolution_time_hours,

    /* ~8% missing hourly cost */
    CASE
        WHEN MOD(n, 13) = 0 THEN NULL
        WHEN MOD(n, 100) < 10 THEN 850
        WHEN MOD(n, 100) < 30 THEN 700
        WHEN MOD(n, 100) < 65 THEN 500
        ELSE 350
    END AS engineer_hourly_cost,

    /* ~10% missing engineer hours */
    CASE
        WHEN MOD(n, 11) = 0 THEN NULL
        WHEN MOD(n, 100) < 10 THEN ROUND(10 + MOD(n * 3, 12) + RAND() * 3, 2)
        WHEN MOD(n, 100) < 30 THEN ROUND(5 + MOD(n * 4, 9) + RAND() * 2, 2)
        WHEN MOD(n, 100) < 65 THEN ROUND(2 + MOD(n * 2, 6) + RAND(), 2)
        ELSE ROUND(0.5 + MOD(n, 3) + RAND(), 2)
    END AS engineer_hours_spent,

    CASE MOD(n, 3)
        WHEN 0 THEN 'Enterprise'
        WHEN 1 THEN 'Medium'
        ELSE 'Small'
    END AS client_type,

    /* ~7% missing escalation count; high/critical naturally have more */
    CASE
        WHEN MOD(n, 14) = 0 THEN NULL
        WHEN MOD(n, 100) < 10 THEN 2 + MOD(n, 3)
        WHEN MOD(n, 100) < 30 THEN 1 + MOD(n, 2)
        WHEN MOD(n, 100) < 65 THEN MOD(n, 2)
        ELSE 0
    END AS escalation_count,

    /* ~10% missing CSAT; slower / escalated tickets have lower CSAT */
    CASE
        WHEN MOD(n, 10) = 5 THEN NULL
        WHEN MOD(n, 100) < 10 THEN ROUND(1.8 + RAND() * 1.0, 2)
        WHEN MOD(n, 100) < 30 THEN ROUND(2.6 + RAND() * 1.0, 2)
        WHEN MOD(n, 100) < 65 THEN ROUND(3.5 + RAND() * 0.8, 2)
        ELSE ROUND(4.2 + RAND() * 0.8, 2)
    END AS customer_satisfaction_score

FROM (
    SELECT
        ones.n
        + tens.n * 10
        + hundreds.n * 100
        + thousands.n * 1000
        + ten_thousands.n * 10000
        + 1 AS n
    FROM
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) ones
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) tens
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) hundreds
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) thousands
    CROSS JOIN
        (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9) ten_thousands
) AS numbers
WHERE n <= 50000;
