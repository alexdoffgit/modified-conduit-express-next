-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_articles (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    body TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    author_id TEXT,
    published BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_conduit_articles_conduit_users FOREIGN KEY(author_id) REFERENCES conduit_users(id)
);

-- migrate:down
DROP TABLE IF EXISTS conduit_articles;

