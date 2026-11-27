CREATE TABLE artist (
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE genre (
    id   BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    CONSTRAINT genre_name_unique UNIQUE (name)
);

CREATE TABLE album (
    id           BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    release_year INT,
    cover_key    VARCHAR(500),
    artist_id    BIGINT NOT NULL REFERENCES artist(id)
);

CREATE TABLE track (
    id               BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title            VARCHAR(255) NOT NULL,
    duration_seconds INT,
    audio_key        VARCHAR(500) NOT NULL,
    source           VARCHAR(50)  NOT NULL,
    external_id      VARCHAR(100) NOT NULL,
    album_id         BIGINT REFERENCES album(id),
    CONSTRAINT track_source_unique UNIQUE (source, external_id)
);

CREATE TABLE track_artist (
    track_id  BIGINT NOT NULL REFERENCES track(id)  ON DELETE CASCADE,
    artist_id BIGINT NOT NULL REFERENCES artist(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, artist_id)
);

CREATE TABLE track_genre (
    track_id BIGINT NOT NULL REFERENCES track(id) ON DELETE CASCADE,
    genre_id BIGINT NOT NULL REFERENCES genre(id) ON DELETE CASCADE,
    PRIMARY KEY (track_id, genre_id)
);