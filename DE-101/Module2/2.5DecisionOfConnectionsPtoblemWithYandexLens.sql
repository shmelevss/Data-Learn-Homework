SELECT * FROM pg_stat_activity;

SELECT count(*) FROM pg_stat_activity;

show max_connections;

SELECT *
FROM pg_stat_activity
WHERE datname = 'postgres'
AND pid <> pg_backend_pid()
AND state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')

--код ниже надо запускать из самой БД(supabase)
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'postgres'
AND pid <> pg_backend_pid()
AND state in ('idle', 'idle in transaction', 'idle in transaction (aborted)', 'disabled')