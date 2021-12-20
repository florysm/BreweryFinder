/*** TEST DATA SUITE
DUMMY USERS AND ASSOCIATED REVIEWS
ADD AS NEEDED :) ***/

USE final_capstone
GO

/* USERS */
INSERT INTO users (username, password_hash, salt, user_role, email_address, is_active) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user', 'user@user.com', '1'),
('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin', 'admin@admin.com', '1'),
('adminAndy','PqCqDR9hGtyQBE5kOcO/AA8qZzQ=', '6hTnajV+L5E=','admin', 'admin1@findbeer.com', '1'),
('MonsterMod','iXZ3QpaUCYaCiU/YmHsewlR2JwY=', '+HDyFWS6Bc4=','admin', 'admin2@findbeer.com', '1'),
('chugking04','5OiyYZ8Pd7jucT+4Bir7wuL1STI=', 'QS9xBrAPTqg=','user', 'jimmy@eatworld.com', '1'),
('goodBoi42','CcoQMdfvuLhjv1/WfRsIAdUZs4s=', 'uMzIL2Dgjs4=','user', 'notadog@petsmart.com', '1'),
('hangoverHarry','cinOhXK1NiuLvW6A4IP7RrjxrMU=', 'TRwIcEG8IC0=','user', 'hydrater@gmail.com', '1'),
('jeagerbro10','4sLnEobykg475xm9TOSe3jVbmYQ=', 'hWnvMwSTh7Y=','user', 'jeagerbro10@yahoo.com', '1'),
('DancingGnome','w4PqQRpL3DbrKVvpMGVPoxZHqT8=', 'HuOzUHZiCBw=','brewer', 'gnome@dance.com', '1'),
('PghBrewer','0vPUv7evyqYQh9DFZp/MoX3a0W4=', 'ft27/nyY3Wc=','brewer', 'steelerfan@412brew.com', '1')


/* REVIEWS */
INSERT INTO beer_reviews (subject,description,rating,beer_id,user_id) VALUES ('Gulpin Good!','It was just alright. I drank it so fast, I dont remember.',2.0,1,5),
('Lager? I barely know her!', 'Me and the boys went dahn to the brewry and had a great time! Pretty good!', 4.5,1,8),
('What day is it?','Not sure how the beer was, but I sure feel it today. My head is killing me, I need a glass of water.', 4,90,7),
('Not a review from a dog','Woof woof bark! I dont drink because Im (not) a dog! Had a really really fun time! Yay!', 5,6,6),
('Test Review', 'I am just a user leaving a test review. It was good for a test. Thanks.', 3.3,1,1),
('Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',1.1,10,1),
('FALSE ADVERTISING!!!!!!!!111', 'no flying gnome nowhere what the hell kinda place is this I wanna get spirited away to the fantasy land! also my dog left a review on here somewhere please delete it',0,138,6),
('Great Flavor!','Tasted just as good on the way up as it did going down!', 4.5,5,5),
('Wishful thinking','I wish there were 8 days in a week. Unfortunately, I overindulged on this delicious beverage and fell behind at work. Now Im on the outs with my boss and I might lose my job. Great beer though.',5,74,7),
('BRO this is good stuff','You know Sasquatch means Wild Man of the Woods? This dank drank made ME feel like a WILD MAN WHOOOOA YEAHHHH',5,73,8),
('GOOD BEAR','Good beer.',3.9,161,6),
('Great dark beer','The flavour was good, very malty, and certainly European. Solid 4.0 rating -AdminAndy',4,2,3),
('adfad2343134','/asdf=bavfdsa',4.5,35,6),
('please help','anybody got any ideas on how to get my dog to stop leaving reviews on this website thanks?',5,1,5),
('LIFE CHANGING.','This beer was so good, it inspired me to start brewing myself and now I dont even care if I lose my job from being hungover every day!', 5,54,7),
('Great beer in moderation','Moderation pun, because Im a mod. Get it? Anyway, the reviews on here are getting pretty out of hand. We need some help here on the admin team if anybody is interested.',5,60,4)

select * from users
select * from beer_reviews