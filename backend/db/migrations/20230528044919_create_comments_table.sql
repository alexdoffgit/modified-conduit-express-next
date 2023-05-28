-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_comments (
    id TEXT PRIMARY KEY,
    article_id TEXT,
    author_id TEXT,
    body TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    CONSTRAINT fk_comments_articles FOREIGN KEY(article_id) REFERENCES conduit_articles(id),
    CONSTRAINT fk_comments_author FOREIGN KEY(author_id) REFERENCES conduit_users(id)
);

-- migrate:down
DROP TABLE IF EXISTS conduit_comments;
