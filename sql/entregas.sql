-- Tabla de entregas comprometidas (OC emitida -> fecha de entrega acordada con el PDV)
-- Ejecutar este script en el SQL Editor de Supabase (Project > SQL Editor > New query)

create table if not exists entregas (
  id uuid primary key default gen_random_uuid(),
  visita_id uuid references visitas(id) on delete set null,
  pdv_id uuid not null references pdv(id) on delete cascade,
  fecha_entrega date not null,
  confirmada boolean not null default false,
  observaciones text,
  foto text,
  orden integer,
  created_at timestamptz not null default now()
);

create index if not exists entregas_fecha_entrega_idx on entregas (fecha_entrega);
create index if not exists entregas_pdv_id_idx on entregas (pdv_id);
create index if not exists entregas_confirmada_idx on entregas (confirmada);

alter table entregas enable row level security;

-- Mismo patrón de acceso público (anon key) que el resto de las tablas del proyecto.
create policy "entregas_public_all" on entregas
  for all
  using (true)
  with check (true);
