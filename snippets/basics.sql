-- Basics / Básicos (PostgreSQL)
-- Adjust table/column names to your schema
-- Ajusta nomes de tabelas/colunas ao teu schema

-- Select with filter / Seleção com filtro
SELECT id, email, created_at
FROM users
WHERE active = true
ORDER BY created_at DESC
LIMIT 50;

-- Upsert / Inserir ou atualizar
INSERT INTO users (email, name)
VALUES ('ada@example.com', 'Ada')
ON CONFLICT (email) DO UPDATE
SET name = EXCLUDED.name,
    updated_at = now();

-- Soft delete / Soft delete
UPDATE users
SET deleted_at = now()
WHERE id = $1 AND deleted_at IS NULL;

-- Pagination (keyset) / Paginação (keyset)
SELECT id, created_at
FROM events
WHERE (created_at, id) < ($1, $2)
ORDER BY created_at DESC, id DESC
LIMIT 20;
