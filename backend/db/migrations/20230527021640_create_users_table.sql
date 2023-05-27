-- migrate:up
CREATE TABLE IF NOT EXISTS conduit_users (
    id TEXT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    bio TEXT,
    "image" TEXT,
    password_hash TEXT NOT NULL
);

-- migrate:down
DROP TABLE IF EXISTS conduit_users;