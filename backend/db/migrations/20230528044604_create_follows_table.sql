-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_follows (
    id SERIAL PRIMARY KEY,
    followed_id TEXT,
    follower_id TEXT,
    CONSTRAINT fk_follows_followed FOREIGN KEY(followed_id) REFERENCES conduit_users(id),
    CONSTRAINT fk_follows_follower FOREIGN KEY(follower_id) REFERENCES conduit_users(id)
);

-- migrate:down
DROP TABLE IF EXISTS conduit_follows;

