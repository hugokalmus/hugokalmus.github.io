-- Run this in the Supabase SQL Editor for your project.
create table if not exists public.site_content (
  id integer primary key check (id = 1),
  content jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create table if not exists public.site_admins (
  user_id uuid primary key references auth.users(id) on delete cascade
);

alter table public.site_content enable row level security;
alter table public.site_admins enable row level security;

drop policy if exists "Anyone can read portfolio" on public.site_content;
create policy "Anyone can read portfolio"
  on public.site_content for select using (true);

drop policy if exists "Only listed owners can add portfolio content" on public.site_content;
create policy "Only listed owners can add portfolio content"
  on public.site_content for insert to authenticated
  with check (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())));

drop policy if exists "Only listed owners can edit portfolio content" on public.site_content;
create policy "Only listed owners can edit portfolio content"
  on public.site_content for update to authenticated
  using (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())))
  with check (exists (select 1 from public.site_admins a where a.user_id = (select auth.uid())));

drop policy if exists "Owners can check their own access" on public.site_admins;
create policy "Owners can check their own access"
  on public.site_admins for select to authenticated
  using (user_id = (select auth.uid()));

grant select on public.site_content to anon, authenticated;
grant insert, update on public.site_content to authenticated;
grant select on public.site_admins to authenticated;
