CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Executor (
	executor_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(40) NOT NULL,
	year_of_issue_album INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	duration INTEGER NOT NULL,
	album_id INTEGER REFERENCES Album(album_id),
	track_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Compilation (
	compilation_id SERIAL PRIMARY KEY,
	compilation_name VARCHAR(40) NOT NULL,
	year_of_issue_compilation INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreAndExecutor (
	genre_id INTEGER REFERENCES Genre(genre_id),
	executor_id INTEGER REFERENCES Executor(executor_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, executor_id)
);

CREATE TABLE IF NOT EXISTS ExecutorAndAlbum (
	executor_id INTEGER REFERENCES Executor(executor_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT sk PRIMARY KEY (executor_id, album_id)
);

CREATE TABLE IF NOT EXISTS TrackAndCompilation (
	track_id INTEGER REFERENCES Track(track_id),
	compilation_id INTEGER REFERENCES Compilation(compilation_id),
	CONSTRAINT ok PRIMARY KEY (track_id, compilation_id)
);


