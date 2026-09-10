-- Maintenance / Manutenção

-- Table bloat hint / Indício de bloat
SELECT relname, n_live_tup, n_dead_tup,
       ROUND(100.0 * n_dead_tup / NULLIF(n_live_tup + n_dead_tup, 0), 2) AS dead_pct
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC
LIMIT 20;

-- Analyze after bulk load / Analyze após carga em massa
ANALYZE users;

-- Vacuum (non-blocking when possible) / Vacuum
VACUUM (VERBOSE, ANALYZE) users;
