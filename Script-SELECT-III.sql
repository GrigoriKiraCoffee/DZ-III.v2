SELECT genre_id, COUNT(*) FROM GenreAndExecutor
GROUP BY genre_id 
ORDER BY COUNT(*) DESC;

SELECT COUNT(track_id) FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE year_of_issue_album BETWEEN 2019 AND 2020;

SELECT album_name, duration FROM Track t
JOIN Album a ON t.album_id = a.album_id
WHERE duration >= (SELECT AVG(duration) FROM Track);

SELECT name FROM Executor e
JOIN ExecutorAndAlbum y ON e.executor_id = y.executor_id
JOIN Album a ON y.album_id = a.album_id
WHERE NOT a.year_of_issue_album = 2020
GROUP BY e.name;

SELECT album_name, AVG(duration) FROM Track t
JOIN Album a ON t.album_id = a.album_id
GROUP BY album_name;

SELECT compilation_name FROM Compilation c
JOIN TrackAndCompilation x ON c.compilation_id = x.compilation_id
JOIN Track t ON x.track_id = t.track_id
JOIN Album a ON t.album_id = a.album_id
JOIN ExecutorAndAlbum y ON a.album_id = y.album_id
JOIN Executor e ON y.executor_id = e.executor_id
WHERE e.name LIKE '%My Morning Jacket%'
ORDER BY c.compilation_name;

SELECT album_name FROM Album a
JOIN ExecutorAndAlbum y ON a.album_id = y.album_id
JOIN Executor e ON y.executor_id = e.executor_id
JOIN GenreAndExecutor z ON e.executor_id = z.executor_id
JOIN Genre g ON z.genre_id = g.genre_id 
GROUP BY album_name
HAVING COUNT(DISTINCT genre_name) > 1
ORDER BY album_name;

SELECT track_name FROM Track t 
LEFT JOIN TrackAndCompilation x ON t.track_id = x.track_id
LEFT JOIN Compilation c ON x.compilation_id = c.compilation_id
WHERE x.track_id IS NULL;

SELECT name, duration FROM Executor e
JOIN ExecutorAndAlbum y ON e.executor_id = y.executor_id
JOIN Album a ON y.album_id = a.album_id
JOIN Track t ON a.album_id = t.album_id
GROUP BY e.name, t.duration 
HAVING t.duration = (SELECT MIN(duration) FROM Track)
ORDER BY e.name;

SELECT DISTINCT album_name FROM Album a
RIGHT JOIN Track t ON a.album_id = t.album_id
WHERE t.album_id IN (SELECT album_id FROM Track
	GROUP BY album_id
	HAVING COUNT(track_id) = (SELECT COUNT(track_id) FROM Track
		GROUP BY album_id
		ORDER BY COUNT LIMIT 1)
)
ORDER BY a.album_name;






