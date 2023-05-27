-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_tags(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

-- migrate:down
DROP TABLE IF EXISTS conduit_tags;

