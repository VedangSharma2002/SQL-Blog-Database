-- COMP 1630 Project #2 - SELECT Queries
-- Vedang Sharma

-- Query 1: 
SELECT post.title, tag.tag_name
FROM post_tag
JOIN post ON post_tag.post_id = post.post_id
JOIN tag ON post_tag.tag_id = tag.tag_id
WHERE tag.tag_name = 'DIY';

-- Query 2: 
SELECT post.title, tag.tag_name
FROM post_tag
JOIN post ON post.post_id = post_tag.post_id
JOIN tag ON tag.tag_id = post_tag.tag_id
WHERE post.title LIKE '%Mickey Mouse Cookies%';

-- Query 3: 
SELECT post.title, COUNT(post_tag.tag_id) AS "Number Of Tags"
FROM post
LEFT JOIN post_tag ON post.post_id = post_tag.post_id
LEFT JOIN tag ON tag.tag_id = post_tag.tag_id
GROUP BY post.title
ORDER BY COUNT(post_tag.tag_id) DESC;

-- Query 4:
SELECT post.title, post_tag.tag_id
FROM post_tag
LEFT JOIN post ON post.post_id = post_tag.post_id
LEFT JOIN tag ON tag.tag_id = post_tag.tag_id
WHERE post_tag.tag_id IS NULL;

-- Query 5: 
SELECT tag.tag_name, COUNT(post_tag.post_id) AS "Number Of Posts"
FROM tag
LEFT JOIN post_tag ON post_tag.tag_id = tag.tag_id
GROUP BY tag.tag_name
ORDER BY COUNT(post_tag.post_id) DESC;

-- Query 6: 
SELECT post.post_id, post.title, person.first_name
FROM post
JOIN person ON person.person_id = post.person_id
WHERE post.post_id IN (
    SELECT post_id FROM read_post WHERE person_id IS NOT NULL
)
ORDER BY post.post_id;

-- Query 7: 
SELECT post.post_id, post.title, person.first_name
FROM post
JOIN person ON person.person_id = post.person_id
WHERE post.post_id NOT IN (
    SELECT read_post.post_id FROM read_post WHERE read_post.person_id IS NOT NULL
);

-- Query 8: 
SELECT post.post_id, post.title, person.first_name,
       post.created_date, post.last_modified_date
FROM post
LEFT JOIN person ON person.person_id = post.person_id
WHERE post.last_modified_date > post.created_date;

-- Query 9:
SELECT post.post_id, post.title, person.first_name
FROM post_photo
LEFT JOIN post ON post.post_id = post_photo.post_id
LEFT JOIN photo ON photo.photo_id = post_photo.photo_id
LEFT JOIN person ON person.person_id = post.person_id
WHERE post_photo.photo_id IS NULL;

-- Query 10: 
SELECT post.title, COUNT(post_like.post_like_id) AS "Number of Likes"
FROM post
LEFT JOIN post_like ON post.post_id = post_like.post_id
GROUP BY post.title
ORDER BY COUNT(post_like.post_like_id) DESC;

-- Query 11: (Keep your author activity query exactly as is)
SELECT person.first_name,
person.last_name,
COUNT(post_id) AS "Number Of Posts"
FROM post
LEFT JOIN person
ON person.person_id = post.person_id
GROUP BY person.first_name, last_name 
ORDER BY COUNT(post_id) DESC
LIMIT 1;

SELECT person.first_name, person.last_name, COUNT(post.post_id) AS "Number Of Posts"
FROM person 
LEFT JOIN post ON person.person_id = post.person_id  
GROUP BY person.first_name, person.last_name
ORDER BY COUNT(post.post_id) ASC
LIMIT 1;

-- Query 12:
SELECT p.post_id, p.title, author.first_name AS author,
       pc.comment, commenter.first_name AS commenter
FROM post p
JOIN person author ON author.person_id = p.person_id
JOIN post_photo pp ON pp.post_id = p.post_id
LEFT JOIN post_comment pc ON pc.post_id = p.post_id
LEFT JOIN person commenter ON commenter.person_id = pc.person_id
GROUP BY p.post_id, pc.comment, commenter.first_name
ORDER BY p.post_id;

-- Query 13: 
SELECT post.post_id, post.title,
       (SELECT COUNT(*) FROM read_post WHERE read_post.post_id = post.post_id) AS 'reads',
       (SELECT COUNT(*) FROM post_like WHERE post_like.post_id = post.post_id) AS 'likes',
       (SELECT COUNT(*) FROM post_comment WHERE post_comment.post_id = post.post_id) AS comments
FROM post
ORDER BY post.post_id;

-- Query 14: 
SELECT photo.photo_id, photo.caption, photo.file_name, 'Profile Photo' AS type
FROM photo
JOIN person ON person.profile_photo_id = photo.photo_id
UNION
SELECT photo.photo_id, photo.caption, photo.file_name, 'Post Photo' AS type
FROM photo
JOIN post_photo ON post_photo.photo_id = photo.photo_id
ORDER BY photo_id;