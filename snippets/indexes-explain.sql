-- Indexes & EXPLAIN / Índices e EXPLAIN

-- Create index / Criar índice
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_users_email
  ON users (email);

-- Partial index / Índice parcial
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_users_active_email
  ON users (email)
  WHERE deleted_at IS NULL;

-- Explain analyze / Explicar e analisar
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM orders WHERE user_id = 42;

-- List unused indexes (heuristic) / Listar índices pouco usados (heurística)
SELECT schemaname, relname AS table_name, indexrelname AS index_name, idx_scan
FROM pg_stat_user_indexes
WHERE idx_scan = 0
ORDER BY pg_relation_size(indexrelid) DESC;
