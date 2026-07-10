-- Catálogo de productos + inventario reportado por el mercaderista en cada visita
-- Ejecutar este script en el SQL Editor de Supabase (Project > SQL Editor > New query)

create table if not exists productos (
  id uuid primary key default gen_random_uuid(),
  nombre text not null,
  categoria text,
  activo boolean not null default true,
  created_at timestamptz not null default now()
);

create index if not exists productos_activo_idx on productos (activo);

alter table productos enable row level security;

create policy "productos_public_all" on productos
  for all
  using (true)
  with check (true);

create table if not exists visita_inventario (
  id uuid primary key default gen_random_uuid(),
  visita_id uuid references visitas(id) on delete cascade,
  pdv_id uuid not null references pdv(id) on delete cascade,
  producto_id uuid not null references productos(id) on delete restrict,
  fecha date not null,
  unidades_anaquel integer not null default 0,
  unidades_deposito integer not null default 0,
  created_at timestamptz not null default now()
);

create index if not exists visita_inventario_visita_id_idx on visita_inventario (visita_id);
create index if not exists visita_inventario_pdv_id_idx on visita_inventario (pdv_id);
create index if not exists visita_inventario_producto_id_idx on visita_inventario (producto_id);
create index if not exists visita_inventario_fecha_idx on visita_inventario (fecha);

alter table visita_inventario enable row level security;

create policy "visita_inventario_public_all" on visita_inventario
  for all
  using (true)
  with check (true);
