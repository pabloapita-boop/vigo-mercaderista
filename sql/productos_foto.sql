-- Agrega foto de referencia opcional a cada producto del catálogo
-- Ejecutar en el SQL Editor de Supabase (Project > SQL Editor > New query)

alter table productos add column if not exists foto text;
