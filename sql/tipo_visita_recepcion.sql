-- Permite el nuevo tipo de visita "recepcion_mercadeo" (Recepción + Mercadeo)
-- Ejecutar en el SQL Editor de Supabase (Project > SQL Editor > New query)

alter table visitas drop constraint if exists visitas_tipo_visita_check;
alter table visitas add constraint visitas_tipo_visita_check
  check (tipo_visita in ('mercadeo', 'mercadeo_pedido', 'recepcion_mercadeo'));
