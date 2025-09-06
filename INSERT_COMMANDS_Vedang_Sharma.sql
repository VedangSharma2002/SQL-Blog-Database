INSERT INTO Photo(
file_name, created_date, caption)
VALUES
('barbara_profile.jpg', NOW(), 'barbara\'s profile'),
('img_9203710.jpg', NOW(), 'James\'s Profile'),
('dcim_38118385.jpg', NOW(), 'Mary'),
('knitting.jpg', NOW(), 'Knitted Touques'),
('img_28391910488.jpg', NOW(), 'Richard'),
('img_21838392835.jpg', NOW(), 'Mickey Mouse Cookies'),
('img_38201884043.jpg', NOW(), 'So Cute!'),
('img_28320384855.jpg', NOW(), 'Smiling Already'),
('Rainbow.jpg', NOW(), 'Rainbow Quilty'),
('Stereo1.jpg', NOW(), 'Front Panel'),
('Stereo2.jpg', NOW(), 'Bass Speakers Installed'),
('new_shed.jpg', NOW(), 'Shed inside empty'),
('Rose.jpg', NOW(), 'Rose'),
('Putter.jpg', NOW(), 'Putter'),
('nine-iron.jpg', NOW(), '9 Iron'),
('Driver.jpg', NOW(), 'Driver');

INSERT INTO Person(
first_name, last_name, email, password_hash, profile_photo_id)
VALUES
('Barbara', 'Hodge', 'b.hodge@company.com', '$2a$12$t8RXltW1.6h/N/AN2cfb6OJRokyD93mVfV.DU/OiOQmKtta52vq8O', 1),
('James', 'Buckles', 'j.buckles@company.com', '$2a$12$z2kxr0YG0Rl4kyPHv392VOygP.3B4R9QRWzfVykxJ4uQHBQBko78S', 2),
('Natalie', 'Wilhite', 'bestest.forever@example.com', '$2a$12$u6UeDFpFgnBlcg2rLJN6a.v95JU.MPCm/1RAWO1e5bV7QwbVvKB6i', NULL),
('Mary', 'Barnett', 'lifeisahighway@example.com', '$2a$12$x.vc6It47K4ZktZLonV1iewq5qvXf6/ZLM0RJJVH/Jviy862XB/3W', 3),
('Richard', 'Tipton', 'tippertapper266602@gmail.com', '$2a$12$WLec1vMhA2UsRvsXozlU.uSGmlEqFpwzuqE8zVOPKtWR0BkZc4FAy', 5);

INSERT INTO post(
title, description, created_date, last_modified_date, person_id)
VALUES
('Mickey Mouse Cookies', 'I found this great recipe for sugar cookies and a new Mickey Mouse cookie butter.', '2019-04-14', '2019-04-15', 1),
('Touques for infants', 'I\'m knitting touques for our grandchild that should be born soon!', '2019-02-15', '2019-02-16', 3),
('Our newest family member!', 'Congratulations to our daughter on their new bundle of joy! Theresa May- Born March 3. 2019.', '2019-03-04', '2019-03-04', 3),
('Rainbow Quilt', 'Beautiful new rainbow quilt for our newest granddaughter', '2019-03-29', '2019-04-01 ', 3),
('New Car Stereo and Speakers', 'Best Bass Ever! You can hear me from 5 blocks away!', '2019-05-09', '2019-05-09', 2),
('Garden Shed', 'New garden shed has room for the lawn mowers and all our garden tools.', '2019-05-22', '2019-05-22', 2),
('Great way to hang pictures', 'It\'s simple and cost effective!', '2019-04-27', '2019-04-27', 4),
('Beautiful color, beautiful smell', 'Found a great place to buy the best roses!', '2019-04-14', '2019-04-16', 4),
('Set of golf clubs for sale', 'A friend of mine is selling his set of clubs before he moves to Sasketchewan', '2019-05-12', '2019-05-15', 2),
('Change your own oil, save hundreds!', 'Mechanics are too expensive, and it\'s not that hard to do it yourself.', '2019-02-22', '2019-02-22', 2),
('Awesome Floor Mats', 'Keep your car clean with this awesome car mats!', '2019-03-03', '2019-03-03', 2);

INSERT INTO post_photo(
photo_id, post_id)
VALUES
(6, 1),
(4, 2),
(8, 3),
(7, 3),
(9, 4),
(11, 5),
(10, 5),
(12, 6),
(NULL, 7),
(13, 8),
(14, 9),
(16, 9),
(15, 9),
(NULL, 10),
(NULL, 11); 

INSERT INTO tag(tag_name)
VALUES
('baking'),
('cooking'),
('crafts'),
('DIY'),
('cars'),
('home repair'),
('sports'),
('music'),
('shopping');

INSERT INTO post_tag(
post_id, tag_id)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(2, 4),
(3, 4),
(3, NULL),
(4, 3),
(4, 4),
(5, 5),
(5, 4),
(6, 4),
(6, 6),
(7, 6),
(8, NULL),
(9, 7),
(10, 5),
(10, 4),
(11, 5);

INSERT INTO post_like(
post_id, person_id)
VALUES
(1, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 4),
(3, 5),
(5, 5),
(9, 5);

INSERT INTO read_post(
post_id, person_id, created_date)
VALUES
(1, 4, NOW()),
(1, 3, NOW()),
(2, 4, NOW()),
(3, 1, NOW()),
(3, 2, NOW()),
(3, 4, NOW()),
(3, 5, NOW()),
(4, 1, NOW()),
(5, 5, NOW()),
(6, 1, NOW()),
(6, 5, NOW()),
(7, 1, NOW()),
(8, NULL, NOW()),
(9, 5, NOW()),
(10, 5, NOW()),
(11, 1, NOW()); 

INSERT INTO post_comment(
post_id, person_id, comment, created_date)
VALUES
(1, 3, 'I\'m going to try those myself! - Natalie', NOW()),
(2, 4, NULL, NULL),
(3, 1, 'Congratulations! - Barbara', NOW()),
(3, 2, 'How does it feel to be a grandma?', NOW()),
(3, 4, NULL, NULL),
(3, 5, NULL, NULL),
(4, 1, 'Can you make me one next? - Barbara', NOW()),
(5, 5, NULL, NULL),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, 5, 'I need a good set of club; I\'ll take them! - Richard', NOW()),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL);

INSERT INTO post_comment (
post_id, person_id, comment, created_date) 
VALUES
(1, 3, 'I''m going to try those myself!', NOW()), 
(3, 1, 'Congratulations!', NOW()),               
(3, 2, 'How does it feel to be a grandma?', NOW()), 
(4, 1, 'Can you make me one next?', NOW()),      
(6, 1, 'What colour are you going to paint your shed?', NOW()), 
(9, 5, 'I need a good set of clubs; I''ll take them!', NOW()); 

 















