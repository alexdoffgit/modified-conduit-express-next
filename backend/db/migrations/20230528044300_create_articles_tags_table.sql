-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_articles_tags (
    id SERIAL PRIMARY KEY,
    article_id TEXT,
    tag_id INT,
    constraint fk_articles_tags_article FOREIGN KEY(article_id) REFERENCES conduit_articles(id),
    constraint fk_articles_tags_tags FOREIGN KEY(tag_id) REFERENCES conduit_tags(id)
);

-- migrate:down
DROP TABLE IF EXISTS conduit_articles_tags;

