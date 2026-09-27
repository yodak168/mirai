-- ご意見番（フィードバック）テーブル
create table public.feedback (
  id uuid primary key default gen_random_uuid(),
  name text,
  message text not null,
  created_at timestamptz not null default now()
);

-- Row Level Security を有効化
alter table public.feedback enable row level security;

-- 誰でも投稿できるようにする（匿名フォームからのINSERTを許可）
create policy "Anyone can submit feedback"
  on public.feedback
  for insert
  to anon
  with check (true);

-- ページ下部の一覧表示のため、誰でも読み取れるようにする
create policy "Anyone can read feedback"
  on public.feedback
  for select
  to anon
  using (true);
