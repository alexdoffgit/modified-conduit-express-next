-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_favorites (
    id SERIAL PRIMARY KEY,
    article_id TEXT,
    "user_id" TEXT,
    CONSTRAINT fk_favorites_article FOREIGN KEY(article_id) REFERENCES conduit_articles(id),
    CONSTRAINT fk_favorites_user FOREIGN KEY("user_id") REFERENCES conduit_users(id)
);

-- migrate:down
DROP TABLE IF EXISTS conduit_favorites;

