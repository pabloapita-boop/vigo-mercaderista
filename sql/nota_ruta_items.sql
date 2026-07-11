-- Instrucción/función planificada por parada (ej. "Acomodar y sacar pedido")
-- Ejecutar en el SQL Editor de Supabase (Project > SQL Editor > New query)

alter table ruta_items add column if not exists nota text;
