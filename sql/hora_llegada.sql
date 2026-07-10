-- Hora de llegada del mercaderista al punto de venta (formato "HH:MM")
-- Ejecutar en el SQL Editor de Supabase (Project > SQL Editor > New query)

alter table visitas add column if not exists hora_llegada text;
