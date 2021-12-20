/*** DATABASE BUILDER : RUN AFTER MERGE
EXECUTE [ testData.sql ] FOR TEST DUMMY USERS + REVIEWS ***/

USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
	email_address varchar (50) NOT NULL,
	is_active bit NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
)

--populate default data

GO

USE [final_capstone]
GO
/****** Object:  Table [dbo].[breweries]    Script Date: 12/10/2021 9:21:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[breweries](
	[brewery_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[street_address] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[zip_code] [nvarchar](12) NOT NULL,
	[phone_number] [nvarchar](15) NULL,
	[website_url] [nvarchar](max) NULL,
	[social_url] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[is_pet_friendly] [bit] NULL,
	[logo_url] [nvarchar](max) NULL,
	[taproom_picture] [nvarchar](max) NULL,
	[is_active] [bit] NOT NULL,
 CONSTRAINT [PK_breweries] PRIMARY KEY CLUSTERED 
(
	[brewery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[breweries] ON 
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (1, N'Hitchhiker Brewing Co.', N'1500 S Canal Street', N'Pittsburgh', N'15215', N'412-343-1950', N'https://hitchhiker.beer/', N'https://www.instagram.com/hitchhikerbrewing/?hl=en', N'DEVOTED TO REFINING TIME-HONORED STYLES AND DISCOVERING NEW ONES. WE ARE FOCUSED ON THE EVOLUTION OF OUR CRAFT, EXPLORING THE UNKNOWN, AND THE EXCITEMENT OF INTRODUCING PEOPLE TO OUR BEER.', 0, N'https://untappd.akamaized.net/site/beer_logos_hd/beer-1005611_34804_hd.jpeg', N'https://s3-media0.fl.yelpcdn.com/bphoto/Ohl6U93A_qS_A3O5xTkywA/o.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (2, N'Strange Roots Experimental Ales', N'501 E Ohio Street', N'Pittsburgh', N'15209', N'915-209-5105', N'http://www.strangerootsbeer.com/', N'https://www.instagram.com/strangerootsbeer/?hl=en', N'Strange Roots exists at the intersection of farmhouse brewing tradition and creative, locally-driven experimentation. We’re passionate about celebrating our environment through the use of local ingredients, varying fermentation methods and micro flora, and strive to create unique artisan ales inspired by our surroundings here in the foothills of the Allegheny Mountains.', 1, N'https://www.sheltonbrothers.com/wp-content/uploads/2018/07/Screen-Shot-2018-07-23-at-10.47.04-AM.png', N'http://www.strangerootsbeer.com/wp-content/uploads/2018/04/heros-taproom-1024x550.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (3, N'Cinderlands Foederhouse', N'3705 Butler Street', N'Pittsburgh', N'15201', N'412-251-0656', N'https://www.cinderlands.com/locations/cinderlands-foederhouse', N'https://www.instagram.com/cinderlandsbeer/?hl=en', N'We specialize in both mixed fermentation, farmhouse style beer and chef-driven dishes. We round out our draft list with a thoughtful selection of house staples, new lagers, ales and more from our sister location, Cinderlands Warehouse. To compliment our draft list and support our community, we feature a Pennsylvania-focused lineup of wine and craft cocktails hand selected to bring you the best that our city and state have to offer.', NULL, N'https://images.squarespace-cdn.com/content/v1/59c57822f09ca4eb6e34496e/1512577216417-4Z79U1OZP6W9FNG8HV18/cinderlands.fulllockup.horizontal-white.png?format=1500w', N'https://images.squarespace-cdn.com/content/v1/59c57822f09ca4eb6e34496e/1550693735025-GOHY6DF95P4TAX0EJ7PD/CL-Front-Bar-IMG_4825.jpg?format=1500w', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (4, N'Eleventh Hour Brewing Co.', N'3711 Charlotte St', N'Pittsburgh', N'15201', N'412-676-8034', N'https://www.11thhourbrews.com/', N'https://www.instagram.com/eleventhhourbrewing/?hl=en', N'Nestled in the heart of historic Lower Lawrenceville our taproom is the perfect location for craft beer lovers and newbies alike. Our little neighborhood borders Bloomfield and The Infamous Strip District
', 1, N'https://images.squarespace-cdn.com/content/v1/581b7f8f5016e11e7853bdb8/5e9a5a2b-65b3-46de-92b5-8f347ec29c88/EH-Logo_Wordmark-Horizontal_Black_RGB.png?format=1500w', N'https://images.squarespace-cdn.com/content/v1/581b7f8f5016e11e7853bdb8/1621882414394-09CSLC50LHDWXFGVDMK0/DSC_0748.jpg?format=1500w', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (5, N'Penn Brewery', N'800 Vinial St', N'Pittsburgh', N'15212', N'412-237-9400', N'https://www.pennbrew.com/
', N'https://www.instagram.com/pennbrewery/?hl=en', N'Penn Brewery began brewing craft beer back in 1986, making us one of the earliest pioneers in the American craft movement. We started out brewing classic lagers and German beer styles, adhering to the strict quality standards of the 16th-century Bavarian Reinheitsgebot purity laws.', 1, N'https://static.wixstatic.com/media/edf429_97d6d10964ac44e4aef843e64c16d38c~mv2_d_1794_1620_s_2.png/v1/crop/x_9,y_0,w_1776,h_1620/fill/w_303,h_270,al_c,q_85,usm_0.66_1.00_0.01/edf429_97d6d10964ac44e4aef843e64c16d38c~mv2_d_1794_1620_s_2.webp', N'https://www.macikwoodworking.com/content/uploads/2017/08/3028_grey-pillars.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (6, N'Grist House Craft Brewery', N'10 E Sherman St', N'Pittsburgh', N'15209', N'412-447-1442', N'https://gristhouse.com/', N'https://www.instagram.com/gristhouse/?hl=en', N'Grist House Craft Brewery is located in the heart of Millvale, PA just minutes north of downtown Pittsburgh. Family owned and operated, we strive to produce high quality beer that is delicious and easy drinking.', 1, N'https://lh3.googleusercontent.com/lEUdGz5uaaEO5HH96OS9Ht78Q1_8fzQg-Vg7Up6JvzP4W5wz6hsGtAdTUxGvBu8mcyOn_yeJxqB90YBqubsmA0mnfjqNThI=s150', N'http://www.nextpittsburgh.com/wp-content/uploads/2017/10/Grist-House.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (7, N'Allegheny City Brewing', N'507 Foreland St', N'Pittsburgh', N'15212', N'412-904-3732', N'https://www.alleghenycitybrewing.com/', N'https://www.instagram.com/alleghenycitybrewing/?hl=en', N'Allegheny City Brewing is an award-winning neighborhood brewery located in the Deutschtown neighborhood of Pittsburgh. ', 1, N'https://static.wixstatic.com/media/732d47_ee077b5c752540918f1ff73cb4232fd1~mv2.jpg/v1/fill/w_363,h_149,al_c,q_80,usm_0.66_1.00_0.01/732d47_ee077b5c752540918f1ff73cb4232fd1~mv2.webp', N'https://s3-media0.fl.yelpcdn.com/bphoto/aVcuqWj4q8qD6I8kOA2uFQ/348s.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (9, N'Roundabout Brewery', N'4901 Butler St', N'Pittsburgh', N'15201', N'412-621-0540', N'https://roundaboutbeer.com/', N'https://www.instagram.com/roundaboutbrew/?hl=en', N'Small tasting room located in Pittsburgh neighborhood of Lawrenceville. Currently selling 4pk cans to go only', NULL, N'https://roundaboutbeer.com/wp-content/uploads/2013/04/cropped-cropped-Roundabout-Brewery-the-one2.jpg', N'https://s3-media0.fl.yelpcdn.com/bphoto/g_kSPa5DeIijYHYKDs6bYA/o.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (10, N'412 Brewery', N'847 Western Ave', N'Pittsburgh', N'15233', N'412-498-3836', N'http://www.412brews.com/home.html', N'https://www.instagram.com/412brewery/?hl=en', N'We are a growing Burgh brewery located in McKees Rocks with a newly-opened taproom in the North Side. 412 Brewery handcrafts micro-brews formulated for the best taste, smoothness, and quality. Only the finest ingredients are used in our process of creating the perfect Pittsburgh brew.
', 1, N'https://scontent-iad3-1.xx.fbcdn.net/v/t1.6435-9/162051057_4168561493189210_8402020136563816890_n.png?_nc_cat=104&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=EFB9jfoPy5QAX9Ztel_&_nc_ht=scontent-iad3-1.xx&oh=897cf889d865201736806931c03cfaf8&oe=61D15F26', N'https://s3-media0.fl.yelpcdn.com/bphoto/OIsMBKU5VuFE-k8ZiXmY-A/o.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (11, N'Trace Brewing', N'4312 Main St', N'Pittsburgh', N'15224', N'412-904-3555', N'https://www.tracebloomfield.com/', N'https://www.instagram.com/tracebrewing/?hl=en', N'Located in Bloomfield. Walk-ups welcome (first come, first served). Join us here in the taproom. Our outdoor beer garden is dog-friendly and open weather permitting. BYOF is cool.', 1, N'https://images.squarespace-cdn.com/content/v1/5c6ad9dde666694eb6ec5c69/1598982388974-H615XYMJABAXEUIQND9R/Trace%2BLogo%2B2-10-20.jpeg?format=1500w', N'https://images.squarespace-cdn.com/content/v1/5c6ad9dde666694eb6ec5c69/1629313349963-KS36M1NO27TTLUT5QUMC/24.jpg?format=750w', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (12, N'Southern Tier Brewery Pittsburgh', N'316 N Shore Dr', N'Pittsburgh', N'15212', N'412-301-2337', N'https://taprooms.stbcbeer.com/southern-tier-brewery-pittsburgh-0c78961b7fd2', N'https://www.instagram.com/stbcbeer_pgh/?hl=en', N'Pittsburgh is the home of the first satellite brewpub from Southern Tier Brewing Co., which was founded in Lakewood, NY less than 3 hours north of PGH in 2002. We’re known for brewing world-class hoppy ales and decadent dessert beers alike, but what many folks know us for is the experience they have when visiting our brewery. At STBC PGH, you can expect the full Southern Tier Experience.', 1, N'https://scontent-iad3-1.xx.fbcdn.net/v/t1.6435-9/34258677_1296379990494441_61329259653758976_n.png?_nc_cat=108&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=J6BdWLmnhXAAX-jtNKA&_nc_ht=scontent-iad3-1.xx&oh=50b6beb1c228f29a50633efc02a517e1&oe=61CEFC4A
', N'https://s3-media0.fl.yelpcdn.com/bphoto/PlzstuwHsTrVebiW8d2pkw/o.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (13, N'Spring Hill Brewing', N'1958 Varley St', N'Pittsburgh', N'15212', NULL, N'https://www.springhillbrewing.com/', N'https://www.instagram.com/springhillbrewing/?hl=en', N'Spring Hill Brewing is a farmhouse nano-brewery located in the north side of Pittsburgh.', 1, N'https://scontent-iad3-1.xx.fbcdn.net/v/t1.6435-9/198408295_175110687956324_1863887365365529951_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=lNB33rfC9KMAX81smVw&_nc_ht=scontent-iad3-1.xx&oh=ac3abea1b683ce30d686de4940446930&oe=61CFB29F', N'https://s3-media0.fl.yelpcdn.com/bphoto/vP5iGSR-_MKcIbbOkwdFBg/o.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (14, N'Two Frays Brewery', N'5113 Penn Ave', N'Pittsburgh', N'15224', N'724-902-3085', N'https://www.twofraysbrewery.com/', N'https://www.instagram.com/twofraysbrewery/?hl=en', N'At Two Frays Brewery, we offer some of the best beer Pittsburgh, PA loves. It is freshly-brewed in a small batch system. We’ll also have some delicious snacks on our menu to go with your drinks. ', 1, N'https://le-cdn.hibuwebsites.com/f2f9599796fb435882bdef53fe1dc25a/dms3rep/multi/opt/Asset+11+%281%29-156w.png', N'https://cdn.stayhappening.com/events6/banners/9b98a48c418affe3564e221a10f4cbfc6053754667000ba7a60c26a743769220-rimg-w521-h395-gmir.jpg?v=1628538544', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (15, N'Hop Farm Brewing Company', N'5601 Butler St', N'Pittsburgh', N'15201', N'412-408-3248', N'https://www.hopfarmbrewingco.com/', N'https://www.instagram.com/hopfarmbrewing/?hl=en', N'Hop Farm Brewing company is an independently partner owned brewery in the Lawrenceville neighborhood of Pittsburgh Pennsylvania. Our focus is on sustainability and local sourcing while producing hoppy ales, farmhouse ales, sour ales and various other interesting brews. We take local ingredients seriously, you’ll find them in our Beer, and the delicious Food.', 0, N'https://www.hopfarmbrewingco.com/wp-content/uploads/2021/06/Hop_Farm_Logo_Final-1.png', N'https://753547.smushcdn.com/1534094/wp-content/uploads/sites/7/2019/05/PittsburghCityBrewTours0046-1-1024x625.jpg?lossy=1&strip=1&webp=1', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (16, N'Dancing Gnome Brewery', N'1025 Main St', N'Pittsburgh', N'15215', N'412-408-2083', N'https://dancinggnomebeer.com/', N'https://www.instagram.com/dancinggnome/?hl=en', N'Dancing Gnome opened in 2016 to foster the growth of our energetic community in Pittsburgh, PA by focusing on hop-forward styles and helping to carve out a new definition of ‘American Ale’. ', 0, N'https://craftpeak-cooler-images.imgix.net/dancing-gnome-brewery/Logo-Full-Frame-01_2x.png?auto=compress%2Cformat&ixlib=php-1.2.1', N'https://margittai.com/wp-content/uploads/2018/07/PMA-4.jpg', 1)
GO
INSERT [dbo].[breweries] ([brewery_id], [name], [street_address], [city], [zip_code], [phone_number], [website_url], [social_url], [description], [is_pet_friendly], [logo_url], [taproom_picture], [is_active]) VALUES (17, N'BrewDog Pittsburgh Outpost', N'6144 Centre Ave', N'Pittsburgh', N'15206', N'412-643-4471', N'https://www.brewdog.com/usa/bars/usa/Pittsburgh', N'https://www.instagram.com/brewdogpitt/?hl=en', N'BrewDog is a multinational brewery and pub chain based in Ellon, Scotland. Pittsburgh Outpost is located in East Liberty.', 1, N'https://pbs.twimg.com/profile_images/1169362819395047425/tj3AJfin_400x400.jpg', N'https://brewdog.mtchost.com/public/files/BLOG%20PHOTOS/Pitt_2.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[breweries] OFF
GO
ALTER TABLE [dbo].[breweries] ADD  CONSTRAINT [DF_breweries_is_active]  DEFAULT ((1)) FOR [is_active]
GO
USE [final_capstone]
GO
/****** Object:  Table [dbo].[brewers]    Script Date: 12/7/2021 4:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brewers](
	[brewery_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_brewers] PRIMARY KEY CLUSTERED 
(
	[brewery_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[brewers]  WITH CHECK ADD  CONSTRAINT [FK_brewers_breweries] FOREIGN KEY([brewery_id])
REFERENCES [dbo].[breweries] ([brewery_id])
GO
ALTER TABLE [dbo].[brewers] CHECK CONSTRAINT [FK_brewers_breweries]
GO
ALTER TABLE [dbo].[brewers]  WITH CHECK ADD  CONSTRAINT [FK_brewers_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[brewers] CHECK CONSTRAINT [FK_brewers_users]
GO

INSERT INTO brewers (brewery_id, user_id) VALUES (10, 10);
INSERT INTO brewers (brewery_id, user_id) VALUES (16, 9);

/****** Object:  Table [dbo].[beers]    Script Date: 12/8/2021 10:05:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[beers](
	[beer_id] [int] IDENTITY(1,1) NOT NULL,
	[brewery_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[abv] [decimal](5, 2) NOT NULL,
	[ibu] [int] NULL,
	[style] [nvarchar](50) NOT NULL,
	[description] [nvarchar](1000) NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_beers] PRIMARY KEY CLUSTERED 
(
	[beer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[beers] ON 
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (1, 5, N'Penn Pilsner', CAST(5.00 AS Decimal(5, 2)), 30, N'Vienna Lager', N'Our flagship beer. Amber-colored with a malty nose and a touch of Noble hops, Penn Pilsner has caramel and toffee notes as well as toasted, nutty hints.  Penn Pilsner is a very well-rounded, balanced, and flavorful lager beer.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (2, 5, N'Penn Dark', CAST(5.00 AS Decimal(5, 2)), 25, N'European-Style Dark', N'A European-style Dark / Münchener Dunkel. Deep reddish-mahogany in color with sweet caramel malt, nutty and toffee notes, and roasted hints. Penn Dark has a moderate hopping rate and a crisp, clean lager beer finish. A surprisingly smooth dark beer.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (3, 5, N'Penn Gold', CAST(5.00 AS Decimal(5, 2)), 20, N'Munchener Helles', N'Our Munich Helles. Malty, bready, and sweet flavors come together with just enough hops to round out this beer. Pale golden in color, this lager is delicate and delicious. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (4, 5, N'Penn Weizen', CAST(5.25 AS Decimal(5, 2)), 16, N'Bavarian-Style Wheat Beer', N'Bavarian-style wheat beer. A very refreshing and effervescent unfiltered ale with pronounced notes of banana and clove. Weizen is lightly hopped, and has abundant carbonation and a pleasant citric tartness. Especially nice during the hot days of summer.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (5, 5, N'Penn Kaiser Pils', CAST(4.50 AS Decimal(5, 2)), 45, N'Northern German Pils', N'NU A Northern German Pils. A clean, crisp, light-bodied lager featuring a very healthy dose of Noble hops. Kaiser Pils uses pale two-row barley malt as a backbone and has a fine level of carbonation that produces a lovely white foam head.LL', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (6, 5, N'Penn IPA', CAST(7.00 AS Decimal(5, 2)), 70, N'American IPA', N'Our hopped-up American IPA. A very robust, amber-colored, hoppy beer made with a blend of nine different American hops. Bright citrus notes, layers of spicy and earthy tones, and a great fruit character make this a world class American IPA. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (7, 5, N'Refreshin'' Session IPA', CAST(5.10 AS Decimal(5, 2)), 50, N'Session IPA', N'American hops lend a citrus aroma and a piney resinous flavor and gentle bitterness to this Session IPA. They''re backed up by a blend of different malts that add a slight sweet caramel and cracker flavor to balance out the hop forwardness. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (9, 6, N'Berry Berry Shaman', CAST(5.00 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'This delectable and refreshing lemonade-inspired sour ale tastes like the sun feels on a beautiful day. Brewed with strawberry, raspberry, blueberry, lemon, and berry tea from Allegheny Coffee and Tea Exchange.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (10, 6, N'Camp Slap Red', CAST(6.40 AS Decimal(5, 2)), NULL, N'Red IPA', N'A highly hopped American red IPA, with rich amber color and grapefruit notes in the aroma. A complex yet easy-drinking beer that will get you hooked.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (11, 6, N'Clean Line', CAST(7.30 AS Decimal(5, 2)), NULL, N'West Coast IPA', N'With big aroma and inviting bitterness, this West Coast IPA may rock the boat. Brewed with Ekuanot, Mosaic, and Simcoe, Canoe Rocker boasts delightful notes of tropical fruit and citrus.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (12, 6, N'Cosmic Gateway', CAST(5.90 AS Decimal(5, 2)), NULL, N'Trappist Single', N'Our twisted version of a Belgian Trappist Single. Brewed with Belgian pilsen malt, wheat, and wildflower honey from Bedillion Farms, and hopped with New Zealand Motueka. The Motueka hops add a complementary zesty flavor to the fruity and slightly phenolic yeast flavors of this light and drinkable Belgian ale.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (13, 6, N'Funky Street', CAST(6.50 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'This fruited sour is a bit different from the normal Grist House sours. We start with a dark malt base with a blend of crystal and roasted malts to create an amber color to lay a foundation of caramel and light chocolate flavors. We kettle sour overnight and then ferment the wort with a belgian saison yeast strain to add some fruity ester complexity. The beer is then conditioned on a moderate amount of raspberry, tart cherry, and cranberry that complements the malt and yeast character. The result is a unique blend of flavors reminiscent of dark fruit dipped in a caramel fondue pot that will take you on a ride down funky street!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (14, 6, N'Galactic Ghost', CAST(5.70 AS Decimal(5, 2)), NULL, N'NE IPA', N'The immense juicy citrus flavor of three powerhouse hops (Amarillo, Simcoe Cryo, and Ekuanot Cryo hops) is masterfully balanced with an elegant bitterness and luscious, silky texture.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (15, 6, N'Hazedelic Juice Grenade', CAST(6.40 AS Decimal(5, 2)), NULL, N'NE IPA', N'This super hazy New England Style IPA explodes in your mouth with creamy notes of orange and mango. It finishes with a smooth and inviting bitterness that makes you ready to pull the pin on your next pint! ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (16, 6, N'Morning Feels', CAST(6.50 AS Decimal(5, 2)), NULL, N'Coffee & Tea Ale', N'A beer you can get cozy with. This light and delightful beer features raw wheat, vanilla, milk sugar, light roast coffee from Allegheny Coffee and Tea Exchange, and an effervescent tea from Gryphon''s Tea! [ALLERGEN WARNING: CONTAINS TREE NUTS & Lactose] ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (18, 6, N'Outrun Nobility', CAST(5.00 AS Decimal(5, 2)), NULL, N'Keller Pils', N'This Keller Pils deserves a crown. Brewed with the Noble hops German Tettnang and Czech Saaz, this unfiltered pilsner is straw-colored and crisp, with subtle hop flavor adding royal complexity.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (19, 6, N'Seltzer Drip', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Seltzer', N'A little sweet, a little tart, perfect for a hot summer day. Our Hard Seltzer with Mango + Passion Fruit.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (20, 6, N'Southern Shaman', CAST(5.00 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'The newest in our Shaman Series of lemonade inspired sours, Southern Shaman blends sweet and tangy tangerine with soft and inviting peach. Add a little lemon juice and Herbal Berry Tea from Allegheny Coffee and Tea Exchange, and you have one delicious beer. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (21, 6, N'Tentacle Horizon', CAST(7.10 AS Decimal(5, 2)), NULL, N'NE IPA', N'Brewed with Cryo Mosaic and NZ Rakau hops, this IPA delights with tropical notes of mango and wildflowers. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (23, 6, N'Twlight Hour', CAST(5.20 AS Decimal(5, 2)), NULL, N'Czech Amber Lager', N'A sessionable lager full of flavor that is ideal for the winter months. This 14° Czech Amber lager was brewed with Bohemian pilsner and a variety of Crystal, Munich, and Vienna malts that lend flavors of caramel, biscuits, and honey. Hopped with CZ Saaz for balance and slight spice flavors and fermented cold with Czech Pilsen yeast then naturally carbonated for a clean, smooth drinking experience.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (25, 6, N'Udderly Baked', CAST(7.10 AS Decimal(5, 2)), NULL, N'Dessert Stout', N'Inspired by Turner''s Limited Edition Brownie Batter, this 7% Dessert Stout will knock your sock off! Brewed with the same mixture Turner''s uses, this creamy stout is packed with flavor. Full-bodied and lightly sweet, this beer is perfect for colder nights.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (27, 6, N'Velvet Vortex', CAST(7.00 AS Decimal(5, 2)), NULL, N'Dessert Sour', N' Dessert in a cup, this complex, full-bodied sour opens with intense aromas of jam and cupcakes. Deep, layered flavor conjures memories of strawberry cheesecake with graham cracker crust. The tart and savory finish leaves you longing for the next sip of this deviously delicious concoction. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (28, 7, N'Clowns of the Mountains', CAST(5.00 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'Fruited sour with sweet cherry and blueberry.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (29, 7, N'Foresight Dunkel', CAST(5.10 AS Decimal(5, 2)), NULL, N'German Dark Lager', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (30, 7, N'Winter Solstice', CAST(6.40 AS Decimal(5, 2)), NULL, N'Dark Ale', N'Cascadian Dark Ale with spruce tips. A collaboration with Fermata Brewing.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (31, 7, N'Vincovats', CAST(8.00 AS Decimal(5, 2)), NULL, N'Winter Warmer', N'Winter Warmer with cinnamon, nutmeg, orange, and brown sugar.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (32, 7, N'Oceanic', CAST(6.50 AS Decimal(5, 2)), NULL, N'IPA', N'IPA with Galaxy, Citra, and Motueka hops', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (33, 7, N'Deutschtown Brown', CAST(5.50 AS Decimal(5, 2)), NULL, N'Brown Ale', N'A brown ale perfect for fall!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (35, 7, N'SMaSH Ginger', CAST(5.50 AS Decimal(5, 2)), NULL, N'IPA', N'Single Malt and Single Hop IPA with Cascade hops and eleven pounds of fresh grated ginger. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (37, 7, N'Think Fall', CAST(5.90 AS Decimal(5, 2)), NULL, N'Amber Ale', N'An Amber Ale with apple and cinnamon black tea.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (38, 7, N'Ol'' One Flip', CAST(4.90 AS Decimal(5, 2)), NULL, N'Cream Ale', N'A crisp and flavorful Cream Ale.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (39, 7, N'Beer Named Woo', CAST(6.50 AS Decimal(5, 2)), NULL, N'IPA', N'WOOOOOOOOOO!!!!!! Brewed with Mosaic and Vic Secret hops. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (40, 7, N'Fighting Elleck', CAST(8.20 AS Decimal(5, 2)), NULL, N'Hard Cider', N'A guest tap from Arsenal Cider.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (41, 9, N'Pale 13', CAST(6.30 AS Decimal(5, 2)), NULL, N'American IPA', N'An IPA with Centennial hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (42, 9, N'Trompe le Monde', CAST(8.80 AS Decimal(5, 2)), NULL, N'Belgian Ale', N'A Belgian golden strong ale.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (43, 9, N'Jolly Roggen', CAST(5.20 AS Decimal(5, 2)), NULL, N'Roggenbier', N'Rye beer fermented with hefeweizen yeast. Notes of spiced pear from the yeast. Dry finish.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (44, 9, N'Suttons Bay IPA', CAST(6.30 AS Decimal(5, 2)), NULL, N'American IPA', N'Featuring Cascade and Michigan Chinook. Notes of fresh pine sap, cut grass, and tropical fruit. We''re calling it a West Michigan Coast IPA, plenty of haze (as of right now) with the firm bitterness of a "west coast" IPA. 5 haze packets, Hart.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (45, 9, N'Barrel Aged Cherry Stout', CAST(7.00 AS Decimal(5, 2)), NULL, N'Stout', N'A delicious Barrel Aged Cherry Stout!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (46, 10, N'Pretty Panda', CAST(4.90 AS Decimal(5, 2)), NULL, N'Session IPA', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (47, 10, N'Lil Razcal', CAST(6.00 AS Decimal(5, 2)), NULL, N'Raspberry Sour', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (48, 10, N'Chanel West Coast', CAST(7.60 AS Decimal(5, 2)), NULL, N'West Coast IPA', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (49, 10, N'Island Escapism', CAST(5.30 AS Decimal(5, 2)), NULL, N'Gose Style Margarita Sour ', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (50, 10, N'Crispy & the Bandit', CAST(5.60 AS Decimal(5, 2)), NULL, N'Smoked Lager', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (51, 10, N'El Chupanibre', CAST(12.10 AS Decimal(5, 2)), NULL, N'Mexican Stout', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (52, 11, N'Kellerbier', CAST(5.20 AS Decimal(5, 2)), NULL, N'Pale Lager', N'Unfiltered German pale lager brewed with Spalter Select and Tettnanger hops. Clean and crisp with floral and citrus notes.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (53, 11, N'Prism & Progress', CAST(7.70 AS Decimal(5, 2)), NULL, N'IPA', N'IPA with Citra and Motueka. Notes of melon, lychee, and lime.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (54, 11, N'They''re Coming To Get You, Rhubarbara', CAST(5.00 AS Decimal(5, 2)), NULL, N'Fruited Gose', N'Gose re-fermented with Rhubarb, Cherry, and Apricot. Dedicated to the great George Romero.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (55, 11, N'Physical Media', CAST(7.70 AS Decimal(5, 2)), NULL, N'IPA', N'Citra IPA. Notes of stone fruit and berry medley. You wouldn''t download an IPA, would you?', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (56, 11, N'Moving Castle III', CAST(7.00 AS Decimal(5, 2)), NULL, N'IPA', N'IPA with Talus and Topaz hops. Notes of tropical fruit and citrus pith. Moving Castle is a constantly evolving series of experimental beers. Just as quickly as it appeared, the castle disappeared in the distance.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (59, 11, N'Six Hammer Pants', CAST(7.50 AS Decimal(5, 2)), NULL, N'IPA', N'IPA with Mosaic, Southern Passion, Azzacca and Amarillo hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (60, 11, N'Thanks, Yinz', CAST(7.00 AS Decimal(5, 2)), NULL, N'IPA', N'IPA with Citra, Simcoe, Mosaic,and Nelson Sauvin hops. (Dedicated to the great beer community in Pittsburgh. We couldn''t do it without you. Thanks, Yinz.)
', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (61, 11, N'Foeder Festbier', CAST(4.10 AS Decimal(5, 2)), NULL, N'Foeder Lager', N'We aged a portion of our Festbier in an oak foeder for two months. Caramel oak notes blend with vienna and munich malts. Classic German style meets American oak.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (62, 11, N'Sacred Objects', CAST(10.00 AS Decimal(5, 2)), NULL, N'Imperial Stout', N'Brewed with a blend of dark malts and a generous amount of oats on a base of Maris Otter barley, this imperial stout is full-bodied and has notes of dark chocolate, burnt caramel, dark red fruit leather and roasted coffee.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (63, 12, N'PGH Concord Grape Gose', CAST(5.00 AS Decimal(5, 2)), 20, N'Sour-Fruited Gose', N'Lightly soured Gose made with concord grape concentrate and a tart finish.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (64, 12, N'PGH Brew''d Easy A', CAST(4.80 AS Decimal(5, 2)), 20, N'Amber Lager', N'Amber Ale', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (65, 12, N'PGH Brew''d Brown Betty', CAST(6.00 AS Decimal(5, 2)), 30, N'American Brown Ale', N'Brown ale brewed with Cinnamon and fresh Cider from Soergel Orchards.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (66, 12, N'PGH Brew''d StrawBarb Jam', CAST(5.00 AS Decimal(5, 2)), NULL, N'Sour', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (67, 12, N'2XMAS', CAST(8.00 AS Decimal(5, 2)), 40, N'Winter Warmer', N'Swedish flags are a fairly common sight in our part of the country. Holiday parties often have warm concoctions of spices and booze at the ready to knock the ice off of toes while raising spirits. We were inspired by a “Glögg” party, deciding on the spot to brew a beer that pays tribute to this Nordic tradition. 2XMAS ale combines traditional brewing ingredients with figs, orange peels, cardamom, cinnamon, clove and ginger root. It’s a holiday addition to the 2X line and another reason to toast to the season, but unlike Glögg, we recommend serving this one chilled.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (68, 12, N'Frosted Sugar Cookie', CAST(8.60 AS Decimal(5, 2)), 10, N'American Strong Ale', N'You won’t believe it’s beer and not a tin full of iced confections. Our Frosted Sugar Cookie Ale is full of soft and airy vanilla and cake notes, iced to perfection.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (69, 12, N'Blueberry Whirl', CAST(6.50 AS Decimal(5, 2)), 15, N'Milkshake IPA', N'Barley, oats, and milk sugar boil and twirl together with fruity, tropical hops only to mingle and cool with - of course - more hops. The mixture is then conditioned and finished with blueberry and vanilla. Enjoy a bursting aroma, a creamy mouthfeel and rich notes of citrus and blueberry.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (70, 12, N'Pumpking', CAST(8.60 AS Decimal(5, 2)), 33, N'Pumpkin/Yam Beer', N'Pumpkin puree and pie spices, malty, bready; cinnamon dominates with nutmeg and vanilla in the background.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (71, 12, N'Warlock', CAST(8.60 AS Decimal(5, 2)), 44, N'Pumpkin/Yam Beer', N'The unbeatable Pumking recipe was adapted for the stout beer style in 2011. Dark and mysterious, reignite your senses with Warlock''s huge roasted malt character, moderate carbonation and a spiced pumpkin aroma.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (72, 12, N'Old Man Winter Ale', CAST(7.50 AS Decimal(5, 2)), 57, N'Winter Ale', N'Malty; well balanced winter ale with earthy hop notes, and fruity esters from our house ale/British heritage strain yeast are evident.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (73, 12, N'Sapsquatch', CAST(13.70 AS Decimal(5, 2)), 70, N'American Barleywine', N'A barleywine style ale brewed with local maple syrup and 1/3 aged on bourbon barrels, 1/3 on maple bourbon barrels, and 1/3 on charred oak staves.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (74, 12, N'8 Days a Week', CAST(4.80 AS Decimal(5, 2)), 15, N'Blonde Ale', N'With fruity notes, low bitterness and a clean finish, this refreshing beer is hard to put down. Take it with you on your infinite adventures. No matter the journey, this is an ale you can enjoy 8 Days a Week.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (75, 12, N'Lake Shore Fog', CAST(6.50 AS Decimal(5, 2)), 20, N'New England/Hazy IPA', N'Hazy, juicy, and florally aromatic with absurd amounts of fruity and resinous hops back by slight malty sweetness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (76, 12, N'2XIPA', CAST(8.20 AS Decimal(5, 2)), 80, N'Imperial/Double IPA', N'A massive dry hop brings a feverishly hoppy and well-balanced Double IPA. An enormous haul of hops deliver notes of grapefruit, lemon and doughy sweetness, for an ale that demands reverence.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (77, 12, N'IPA', CAST(7.00 AS Decimal(5, 2)), 60, N'American IPA', N'Our IPA is timeless - brewed for those who give a damn about a well-crafted beer. As one of our original beers, its quality and consistency helped grow the popularity of IPAs from the ground up. The citrus and pine hop profile balanced by a subtle caramel sweetness are standard for a classic American IPA.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (79, 12, N'Nu Haze', CAST(6.00 AS Decimal(5, 2)), 19, N'New England/Hazy IPA', N'The most crushable Hazy IPA in the game. Made with a special no boil take on the brewing process where fruit forward Idaho 7 and Mosaic hops spend all of their time creating a pillowy soft, juicy experience and no time at all generating bitterness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (80, 12, N'Phin & Matt''s Extraordinary Ale', CAST(5.70 AS Decimal(5, 2)), 40, N'American Pale Ale', N'To label a beer as extraordinary is to have complete trust in its ingredients. Crystal filtered artesian water, whole hops, and the choicest malted barley create this American-style pale ale. The character of American pale ales varies from region to region and is dependent upon the ingredients used. In Phin
& Matt’s, one can expect harmony between malt and hops without dominating tastes of sweet
or bitter.
', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (81, 12, N'Nitro Creme Brulee', CAST(10.00 AS Decimal(5, 2)), 50, N'Imperial/Double Milk Stout', N'Southern Tier’s Blackwater Series unleashes its popular flavor Crème Brûlée in NITRO. With notes of vanilla and caramel, this stout is sweet, creamy and uncannily true to the namesake dessert.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (82, 12, N'Hi-Current Black Cherry Lemon', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Seltzer', N'Black Cherry Lemon Hard Seltzer with natural flavors
100 calories, less than 1g carbs and sugar.
', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (83, 12, N'Hi-Current Strawberry Pineapple', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Seltzer', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (84, 12, N'Hi-Current Watermelon Lime', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Seltzer', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (85, 12, N'Bold Rock Watermelon', CAST(4.70 AS Decimal(5, 2)), NULL, N'Hard Cider', N'Bold Rock Watermelon Cider blends the iconic summer refreshment of watermelon with deliciously crisp Blue Ridge apple juice. The taste profile is perfect for warm weather enjoyment and allows the best of watermelon and apples to shine through.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (86, 12, N'Bold Rock Tea', CAST(5.00 AS Decimal(5, 2)), NULL, N'Malt Beer', N'There’s nothing better than a crisp, delicious beverage with a kick. Bold Rock Hard Tea Original is crafted from real tea with a twist of lemon and naturally sweetened finish. Every sip has a perfect tea flavor that’s not too syrupy or heavy so you can enjoy cool, great tasting refreshment.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (87, 12, N'Bold Rock Half & Half Tea', CAST(5.00 AS Decimal(5, 2)), NULL, N'Malt Beer', N'Sweet tea and lemonade, a timeless combination of refreshment. Bold Rock Half & Half Hard Tea is crafted with naturally sweetened tea and tangy lemonade for a perfect blend of two tasty Southern staples.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (88, 12, N'Bold Rock Lemonade', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Cider', N'Down home and delicious, Bold Rock Hard Lemonade delivers the refreshment you deserve paired with the kick you''ve earned. Crafted from real lemon and naturally sweetened to perfectly balance a tart and invigorating lemonade taste. So when life demands a lift, grab a Bold Rock Hard Lemonade.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (89, 12, N'Brotherly Love', CAST(6.00 AS Decimal(5, 2)), 35, N'New England/Hazy IPA', N'Brewed by Victory Brewing Company. Through this Hazy IPA, packed with a tropical medley of hop notes, we are cultivating a universal sense of human kindness that inspires courage and ignites positive change within our communities. With a smooth body, always craving one more sip is inevitable.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (90, 12, N'Golden Monkey', CAST(9.50 AS Decimal(5, 2)), 25, N'Belgian Tripel', N'Brewed by Victory Brewing Company. Nose is loaded with Belgian yeast character of banana and clove with an equally fruity body balanced with a light, earthy hop character. Savor notes of orange and spice followed by a dry finish.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (91, 12, N'Sour Monkey', CAST(9.50 AS Decimal(5, 2)), 10, N'Sour', N'Brewed by Victory Brewing Company. Fruity notes from imported Belgian yeast swirl through a precise souring. Pucker up to a bite of citrus laden tang ending with a delectable experience.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (92, 12, N'Resin', CAST(9.10 AS Decimal(5, 2)), 103, N'Imperial/Double IPA', N'Brewed by Sixpoint Brewery. "Resin" is named after the sticky ooze that secretes from the lupulin glands of the hop cone. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (93, 12, N'Anti-Resin', CAST(9.10 AS Decimal(5, 2)), NULL, N'Imperial/Double Hazy IPA', N'Brewed by Sixpoint Brewery. Dive deep into the hop cone… but leave the bitterness behind.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (94, 12, N'Bengali IPA', CAST(6.60 AS Decimal(5, 2)), 66, N'American IPA', N'Brewed by Sixpoint Brewery. This is the new version of Bengali (originally named Bengali Tiger).', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (95, 13, N'Hilltop Drone', CAST(4.50 AS Decimal(5, 2)), NULL, N'Hone & Oats Gose', N'Pilsner and oat malts, spring hill honey, sea salt.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (96, 13, N'Mild Evening', CAST(4.00 AS Decimal(5, 2)), NULL, N'Scottish Shilling Ale', N'Pale and mild malts with English hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (97, 13, N'Fall Dusk', CAST(5.50 AS Decimal(5, 2)), NULL, N'Seasonal Brown Ale', N'Vienna malts, brown and chocolate malts.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (98, 13, N'Limited Hangout', CAST(4.20 AS Decimal(5, 2)), NULL, N'Session IPA', N'Pale malts & huell melon hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (99, 13, N'Feathertop', CAST(5.00 AS Decimal(5, 2)), NULL, N'Kellerbier', N'Pilsner & extra pale malts with Saaz & Cascade hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (100, 13, N'Humble Country Oaf', CAST(5.00 AS Decimal(5, 2)), NULL, N'Smoked Sour Stout', N'Cherrywood smoked malt, high roasted wheat with Juneberries', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (101, 14, N'Bessor Faily', CAST(5.50 AS Decimal(5, 2)), 50, N'West Coast Pale Ale', N'A classic West Coast Pale Ale brewed with Cascade and Centennial hops. Grapefruit and Pine aromas and flavors abound, and are balanced out by a mildly sweet malty finish. What does "Besor Faily" mean? Check out the Star Soap mural the next time you''re hanging on our patio and you may just find out.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (102, 14, N'Buddy Sauce', CAST(5.80 AS Decimal(5, 2)), 32, N'Maple Brown Ale', N'Conditioned on PA-Harvested maple syrup from Paul Family Farms, Buddy Sauce is a smooth maple-y, nutty brown ale perfect for the holiday seasons. An elf''s fourth food group never tasted so good.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (103, 14, N'Cherry Picked', CAST(4.90 AS Decimal(5, 2)), NULL, N'Cherry Sour Ale', N'Kettle soured with only the finest lactobacillus blend and conditioned on piles of sweet cherry puree, our cherry sour is refreshing, complex, and special.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (104, 14, N'Hazzy Star', CAST(7.10 AS Decimal(5, 2)), 28, N'New England/Hazy IPA', N'Our juiciest, haziest NEIPA yet. Think orange juice -- but it is delicious beer. Brewed with Galaxy, El Dorado, and Mosaic hops. Lots of them.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (105, 14, N'Hyphenated', CAST(8.10 AS Decimal(5, 2)), 66, N'Belgian-American Double IPA', N'The best of both styles of IPA. Spicy and bitter. Thick and refreshing. Smooth and boozy. Brewed with Crystal, El Dorado, and Loral Hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (106, 14, N'It''s Always Sunny With a Beer', CAST(4.60 AS Decimal(5, 2)), NULL, N'Session IPA', N'Full-flavored and hop-forward like any 7% beer but punching in at a mere 4.6% ABV, we are very proud of our sessionable all-day drinkin'' IPA.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (107, 14, N'Jen''s Porter', CAST(5.50 AS Decimal(5, 2)), 32, N'Porter', N'Brewed for Jen, who has asked that it (or a version of it) be available all year long. And talking to our neighbors this is a really good plan -- so many of you have asked for a dark beer to be more available. You can thank her when you see her.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (108, 14, N'Magnificent Beast', CAST(5.40 AS Decimal(5, 2)), 25, N'Black Lager', N'Named for our brewer CJ''s black lab/pit bull mix, Benny, who is affectionately known as a Magnificent Beast. This Schwarzbier features flavor notes of rich chestnut and mildly bitter chocolate before ending with a dry, crispy lager finish. This is a roasty, dark beast that you''ll want to cuddle up with all Fall long.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (109, 14, N'Rednarok', CAST(6.80 AS Decimal(5, 2)), 27, N'Hazy Red IPA', N'A hazy red IPA? Yep. Like nothing you''ve had before! A malty, amber base combined with the hazy-influence of wheat malt, oats, and HOPS. A customer favorite. Brewed with Amarillo, Cascade, and Citra hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (111, 14, N'Together Better', CAST(4.60 AS Decimal(5, 2)), 25, N'Kolsch', N'We brewed this because love Kölsch! And we believe that this beer can be enjoyed by everyone. The hope is that this smooth and flavorful "yellow beer" will bring new happy faces to the brewery. Smile - it''s beer!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (112, 14, N'Turkey''s Revenge', CAST(5.30 AS Decimal(5, 2)), 6, N'Sour Gose', N'Our first collaboration beer! Proudly made with Necromancer Brewing and brewed with Steel City Salt, this Cranberry & Raspberry Gose is a balanced sweet and sour and salty addition to your holiday meals.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (113, 14, N'VEX', CAST(5.50 AS Decimal(5, 2)), 32, N'Hefeweizen Wheat Ale', N'Bananas. Clove. Wheat. Yeast. Just a well-made Hefe that hits the spot when you need it.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (114, 15, N'Gomango', CAST(6.20 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'Delicious Mango flavors with a slightly tart finish. Sure to be a summer favorite… GO-MANGO!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (115, 15, N'May Queen', CAST(4.80 AS Decimal(5, 2)), NULL, N'Farmhouse Ale', N'Brewed with Local Honey and herbal tea. Aromatics of light honeysuckle. Collaboration with North Country Brewing Co.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (116, 15, N'Cafe Rico', CAST(8.70 AS Decimal(5, 2)), NULL, N'Oat Latte Stout', N'Brewed with KLVN Highline blend Coffee, Saigon cinnamon, Madagascar vanilla bean, and orange peel. Collaboration with B52 Cafe.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (117, 15, N'Flamingo Cloud', CAST(7.60 AS Decimal(5, 2)), NULL, N'New England IPA', N'Big tropical flavors with added hibiscus for a luxurious pink hue.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (118, 15, N'Margotberry', CAST(7.00 AS Decimal(5, 2)), NULL, N'Fruited Berliner-Weisse', N'We add 270lbs of Raspberries to a delicious sour… A tart-summer treat!', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (119, 15, N'Neon Turtles', CAST(7.60 AS Decimal(5, 2)), NULL, N'New England IPA', N'Citra and Azacca hops create strong aromatics of Tropical fruit, ripe mango and mixed citrus… Slightly drier than “King Lumi”.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (120, 15, N'Berry Bush Wheat', CAST(5.00 AS Decimal(5, 2)), NULL, N'Wheat Beer', N'Fruited with Açaí and blackberries make this beer light and fruity.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (121, 15, N'King Lumi', CAST(6.00 AS Decimal(5, 2)), NULL, N'New England IPA', N'Mosaic and Strata hops form a smooth/tropical mouthfeel along with hints of mango and ripe pineapple. Slightly more dank than “Neon Turtles” “Everything the light touches is Lumi’s…”.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (122, 15, N'Pub Games', CAST(4.00 AS Decimal(5, 2)), NULL, N'English-style Mild Ale', N'Bready toasted malt base with hints of cocoa and sweet caramel. Light to medium mouthfeel.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (123, 15, N'Goat Face Killa', CAST(7.00 AS Decimal(5, 2)), NULL, N'Maibock', N'A strong malty German-style lager beer traditionally associated with the month of May. Crisp bittering maintains drinkability despite increased malt character.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (124, 15, N'Pittsburgh Pale Ale', CAST(5.50 AS Decimal(5, 2)), NULL, N'American Pale Ale', N'This Hoppy pale ale is loaded with Mosaic & El Dorado hops providing notes of citrus, honeydew, and mixed berries.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (125, 15, N'Field Ration', CAST(5.20 AS Decimal(5, 2)), NULL, N'Belgian-style Farmhouse Ale', N'The Combination of Belgian and French Farmhouse yeast provides complex flavors of honeysuckle, stone fruit, hints of lemon… Finishes dry and delicate.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (126, 16, N'Lustra', CAST(5.80 AS Decimal(5, 2)), 45, N'Pale Ale', N'An ode to the unity of malted barley, hops, yeast, water, and the brewer who prudently blends them. Intense tropical and citrus fruit aromas and a clean fruity bitterness work in harmony with the lightly toasted wheat bread flavors derived from the malt.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (127, 16, N'Wishbone', CAST(5.00 AS Decimal(5, 2)), NULL, N'Pale Ale', N'Originally brewed with Tiny Moving Parts for their latest album Swell, Wishbone is an absolute crusher at 5.0% with heavy citrus notes and slight floral tone to round things out. Extremely soft with a silky body means supremely high drinkability.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (128, 16, N'Prologue', CAST(5.20 AS Decimal(5, 2)), NULL, N'West Coast Pale Ale', N'A classic American Pale Ale with Centennial, Columbus, Simcoe, and Amarillo.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (129, 16, N'Radiant Void', CAST(6.20 AS Decimal(5, 2)), NULL, N'Rye IPA', N'IPA hopped with Idaho 7, Simcoe, Citra, Motueka, Amarillo.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (131, 16, N'Yam Jam', CAST(6.80 AS Decimal(5, 2)), NULL, N'IPA', N'Yam Jam is the Anniversary variant of our single-hopped series of IPAs know as the Jam series . After joking about it for far too long, we roasted 100lbs of fresh Yams and tossed them into the mash for an extra balanced meal of a beer. Hopped aggressively with Vic Secret, Galaxy, Mosaic, and Citra hops, Yam Jam showcases the best of our six hop variants blended to best express the balance and complexity of the series as a whole. We hope you enjoy this lusciously hyper-hopped IPA.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (133, 16, N'Exquisite Beast', CAST(8.50 AS Decimal(5, 2)), NULL, N'Double IPA', N'Brewed with english malt and generously hopped with Denali, Mosaic, and Amarillo hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (134, 16, N'Spirograph', CAST(8.00 AS Decimal(5, 2)), NULL, N'West Coast Double IPA', N'Delightfully bitter and radiating with notes of fresh pine, grapefruit pith, and summer yard work.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (135, 16, N'Pilsner', CAST(5.00 AS Decimal(5, 2)), NULL, N'Pilsner', N'We selected the finest German ingredients that we were able to source to brew this 5% German style lager that''s insanely crisp with a sweet crackery malt character and a pleasant, satisfying noble hop floral and spice presence to bring it all home.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (136, 16, N'Altbier', CAST(4.80 AS Decimal(5, 2)), NULL, N'Altbier', N'A super flavorful, drinkable, dark session ale rich with malt but crisp and balanced.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (137, 16, N'Elk Artist', CAST(4.50 AS Decimal(5, 2)), NULL, N'American Bitter', N'This is an all day, all season slammer of a balanced low abv beer thats super clean and thoughtfully hopped with centennial.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (138, 16, N'Mudpuppy', CAST(5.40 AS Decimal(5, 2)), NULL, N'Roggenbier', N'Similar to a Hefeweizen, Roggenbier''s replace the high percentage of wheat for a high percentage of rye. We utilized three different types of rye in this German Style ale, resulting in layers of malt character in addition to the yeast driven flavors. You can expect sweet caramel, pumpernickel, banana nut, and chai tea.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (139, 16, N'Shifting Clocks', CAST(4.20 AS Decimal(5, 2)), NULL, N'Farmhouse Ale', N'Brewed with a heavy dose of spelt and wheat and hopped exclusively and generously with New Zealand Motueka hops. An incredibly refreshing beer, certainly reminiscent of warm summer days.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (140, 16, N'Caligo', CAST(7.50 AS Decimal(5, 2)), NULL, N'Oatmeal Stout', N'Our satin black offering is enriched with oats, giving a smooth, silky finish as the roasted notes of coffee and dark chocolate wane on your palate. Bright hints of berry, citrus, and pine, accompany this erudite substance to unify the cerebral experience.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (141, 17, N'Headless Honcho', CAST(8.50 AS Decimal(5, 2)), NULL, N'American Stout', N'Creamy chocolate stout with vanilla and cinnamon.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (142, 17, N'Cosmic Crush - Raspberry', CAST(5.80 AS Decimal(5, 2)), 10, N'Fruited Sour', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (143, 17, N'Ginger All the Way', CAST(6.00 AS Decimal(5, 2)), NULL, N'Farmhouse Ale', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (144, 17, N'Hazy Jane', CAST(7.20 AS Decimal(5, 2)), NULL, N'New England/Hazy IPA', N'EMBRACE THE OPAQUE. The lower strength version of Hazy Jane which is now called Hazy O-G. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (145, 17, N'Punk IPA', CAST(5.20 AS Decimal(5, 2)), NULL, N'American IPA', N'Our scene-stealing flagship is an India Pale Ale that has become a byword for craft beer rebellion; synonymous with the insurgency against mass-produced, lowest common denominator beer. Punk IPA charges the barricades to fly its colours from the ramparts – full-on, full-flavour; at full-throttle. Layered with new world hops to create an explosion of tropical fruit and an all-out riot of grapefruit, pineapple and lychee before a spiky bitter finish, this is transatlantic fusion running at the fences of lost empires. Nothing will ever be the same again.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (146, 2, N'The Plague 2021', CAST(9.00 AS Decimal(5, 2)), NULL, N'Barrel Aged Sour Stout', N'Brewed with Raspberries, Blueberries, & Blackberries using a Solera method.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (147, 2, N'Sunshine Express', CAST(4.90 AS Decimal(5, 2)), NULL, N'Unfiltered Wheat Ale', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (149, 2, N'The Plague 2019', CAST(9.00 AS Decimal(5, 2)), NULL, N'Barrel Aged Sour Stout', N'Brewed with Raspberries, Blueberries, & Blackberries using a Solera method.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (150, 2, N'Tartburst', CAST(6.80 AS Decimal(5, 2)), NULL, N'Sour Ale', N'A sour ale conditioned on mangoes and blueberries.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (151, 2, N'Ruptured Mercury', CAST(10.10 AS Decimal(5, 2)), NULL, N'Imperial Stout', N'Conditioned on cocoa nibs, toffee, and coffee aged in Bourbon barrels.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (152, 2, N'Mimosa Seltzer', CAST(5.00 AS Decimal(5, 2)), NULL, N'Hard Seltzer', N'House hard seltzer mixed with orange juice.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (153, 2, N'Vivid Monarch', CAST(5.70 AS Decimal(5, 2)), NULL, N'IPA', N'Dry-hopped with Citra, Idaho 7, and Comet hops. ', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (155, 2, N'The Mark', CAST(6.50 AS Decimal(5, 2)), NULL, N'Sour Ale', N'A blend of 2019 and 2020 barrel aged sour ales conditioned on red raspberries and bing cherries.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (156, 3, N'Lil Cinder', CAST(4.20 AS Decimal(5, 2)), NULL, N'Lager', N'Light lager brewed with corn and American six-row.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (157, 3, N'Tracks Again', CAST(5.20 AS Decimal(5, 2)), NULL, N'Unfiltered Pilsner', N'Our house unfiltered pilsner brewed with Pilsner malt and noble hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (158, 3, N'Squish', CAST(5.50 AS Decimal(5, 2)), NULL, N'Hazy Pale Ale', N'Our house pale ale brewed with Citra, Simcoe, Amarillo and Crystal.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (160, 3, N'Trouble No More', CAST(6.50 AS Decimal(5, 2)), NULL, N'Hazy IPA', N'Hazy IPA brewed with Strata and Mosaic hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (161, 3, N'She''s a Beaut', CAST(6.40 AS Decimal(5, 2)), NULL, N'Hazy IPA', N'Hazy holiday IPA brewed with Colorado spruce tips, sweet orange peel, and Citra, Chinook, and Centennial hops.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (162, 3, N'UHD Dewdrop', CAST(8.40 AS Decimal(5, 2)), NULL, N'Hazy Double IPA', N'Ultra Hop Definition hazy double IPA brewed with three forms of Citra hops (T90, Cryo, Incognito).', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (163, 3, N'Blazing Crude', CAST(8.00 AS Decimal(5, 2)), NULL, N'Double Milk Stout', N'Double milk stout brewed with tangerine purée and conditioned on sweet orange peel and Intelligentsia Kenya Thiriku coffee.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (164, 3, N'Brick Top', CAST(10.00 AS Decimal(5, 2)), NULL, N'Belgian Quad', N'Belgian quadrupel (strong dark ale) brewed with Onyx Coffee Negusse Nare Bombe, a natural Ethiopian coffee. Tulip carob, and chicory on the palate. Light body with a sturdy minerality and a dry finish. copper-brown and bright.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (165, 3, N'Plums in Retrograde', CAST(6.50 AS Decimal(5, 2)), NULL, N'Tartshake Fruited Sour', N'Tartshake fruited sour brewed with plum purée, organic cold-pressed ginger juice, Kilogram Tea Organic Ginger Plum Iced Tea, Madagascar vanilla bean, and milk sugar.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (166, 3, N'Star Crumb', CAST(7.00 AS Decimal(5, 2)), NULL, N'Tartshake Fruited Sour', N'Tartshake fruited sour brewed with blackberry purèe, baking spices, graham cracker, milk sugar, and Madagascar vanilla bean.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (168, 3, N'Archive Series: Scotch Ale', CAST(8.00 AS Decimal(5, 2)), NULL, N'Scottish-style Ale', N'Strong Scottish-style ale brewed with premium UK malts and toasted oak.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (169, 4, N'Archibald''s Ado', CAST(8.00 AS Decimal(5, 2)), NULL, N'Cider', NULL, 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (171, 4, N'Bonnsch', CAST(4.90 AS Decimal(5, 2)), NULL, N'Kolsch', N'Born of a very specific German style of beer brewed in Bonn, this beauty is a merge of a Kölsch and a Belgian wit beer with an upfront hint of citrus, a slightly fruity aroma, a clean wheat and pilsner taste and a crisp finish. A very unique beer that is great in the summer but perfect winter drinker. There is no style that this fits well into, we just know it’s delicious.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (172, 4, N'Burning Phoenix', CAST(6.20 AS Decimal(5, 2)), NULL, N'Pale Ale', N' The most polarizing beer we produce starts with a simple American Pale Ale hopped with Cascade. It is then aged on over 150 lbs of jalapenos in the fermenter giving it a nose like fresh cut jalapenos, a spicy burn as it goes down and an even finish as the heat hits a plateau. You will either love it or hate it.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (173, 4, N'Triple Jack', CAST(10.00 AS Decimal(5, 2)), NULL, N'Triple New England/Hazy IPA', N'The latest in beer technology? TripleJack just might be. This deliciously balanced Triple IPA is triple dry hopped with an intricate blend of New Zealand Kohatu, Mosaic and Simcoe hops. Huge aromas of passionfruit spark outward with mango, papaya, and guava following through. Flaked & Malted Oats lend just a hint of sweetness to the delicate, lightly carbonated mouthfeel. TripleJack comes in with huge fruit notes, balanced sweetness and a touch of warmth to go with it. Wire in and let TripleJack press all the right buttons.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (175, 4, N'Slice', CAST(4.40 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'Our newest Slice! pulls from our German roots to create a liquid Strawberry-Rhubarb pie. This Western PA specialty is full of fresh Strawberry puree along with a dash of Rhubarb, brown sugar, vanilla and pie crust. A sweet & tart treat for all.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (176, 4, N'Nocturnal Rainbow: Orea', CAST(5.60 AS Decimal(5, 2)), NULL, N'Milk Stout', N'Sit back & relax with this smooth, roasty, chocolatey milk stout. Like a nice snack to be savored or devoured by the handful, this limited release will treat you right. Aged on Oreo cookie pieces this is a sultry elixir that can be enjoyed bright and early or into the night. The delicate balance between the Lactose sweetness, the roast of the malts, the distinctive Oreo chocolate and a blend of lactose & oreo cream sweetness blends well to allow all colors to shine through the darkness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (177, 4, N'Moon Series: Hunter''s Moon', CAST(7.60 AS Decimal(5, 2)), NULL, N'New England/Hazy IPA', N'The ninth our Moon series, we get a little changeup from the heavy tropical notes. Kettle hopped with Amarillo & Idaho 7 then doubling those two up in the Dry hop. This combo is dank and pungent with notes of citrus & sticky pine, resinous and smooth with a crisp finish. As always a strong base of oats & wheat leave a perfect blanket for the hops to hold center stage. Keep an eye out for these ones, releasing every full moon throughout 2021. Each will be a progressively hopped beer building on the last.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (178, 4, N'Nocturnal Rainbow: Original', CAST(5.60 AS Decimal(5, 2)), NULL, N'Milk Stout', N'Wake up with this silky smooth coffee inspired Milk Stout. Working with our friends at La Prima Espresso we carefully selected their Moka Java coffee to pair into this beer. With rich notes of chocolate, molasses, lightly roasted coffee beans and hints of lime and a mild spiciness. This is a sultry elixir that can be enjoyed bright and early or into the night. The delicate balance between the Lactose sweetness and the roast plays out well to allow all colors to shine through the darkness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (179, 4, N'Nocturnal Rainbow: S''mores', CAST(5.60 AS Decimal(5, 2)), NULL, N'Milk Stout', N'Grab a seat by the fire and enjoy this smooth, roasty, chocolatey milk stout. A pairing meant for a firepit, this is a sweet, chocolate, marshmallow dream. Aged on graham crackers, marshmallow bits and hunks of pure milk chocolate, this is a sultry elixir meant to keep you warm by the fire. The delicate balance between the Lactose sweetness, the roast of the malts, milk chocolate, a blend of lactose and a saccharine marshmallow finish lets this girl shine through the darkness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (180, 4, N'Dream Cannon: No. 4 Spring Sorbet', CAST(4.40 AS Decimal(5, 2)), NULL, N'Fruited Sour', N'We''ve tweaked the latest Dream Cannon to add lactose into the process, bringing a new layer of sweetness to our beloved sour series. Recipe No. 4 also features piles of fresh raspberries and hand zested lemon peel and fresh squeezed lemon juice. The fruit flavors, crisp tartness and soft creamy mouthfeel bring to mind a fresh spring sorbet... no spoon required. Have fear, spring is on its way.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (181, 4, N'Moon Series: Beaver Moon', CAST(7.10 AS Decimal(5, 2)), NULL, N'New England/Hazy IPA', N'The penultimate entry in our Moon series we get a nice mellow, subtle citrus and flashes of papaya . Kettle hopped with Amarillo & Idaho 7 then smashing the dry hop with El Dorado. This gives a fulfilling dose of citrus and an always a strong base of oats & wheat give a silky stage for the hops. Go grab an eyeful of this moon and maybe the partial eclipse if you''re ready.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (182, 4, N'Daisy Pils', CAST(5.50 AS Decimal(5, 2)), NULL, N'Pilsner', N'Inspired by the tradition of aggressively hopped craft pilsners that originated in Italy, Daisy Pils follows suite with a clean crisp pilsner base and a punch of noble hops. We use premium floor malted pilsner malt to craft a light golden base, and then hopped it liberally with German Noble hops varieties. Several dry hops of Bavarian Polaris lends a crisp mint and pine aroma, and heavy hands of Mittelfruh in the kettle provide the bitterness to stand up to a crisp malty sweetness.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (183, 1, N'The Barbarian', CAST(7.50 AS Decimal(5, 2)), NULL, N'IPA', N'Brewed with Oats and Vienna Malt. Hopped with Mosaic and Amarillo.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (185, 1, N'Bane of Existence ', CAST(6.60 AS Decimal(5, 2)), NULL, N'IPA', N'Brewed with oats. Hopped with Citra, and Simcoe. Notes of passion fruit, melon, stone fruit, and mango.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (186, 1, N'''Sup', CAST(6.80 AS Decimal(5, 2)), NULL, N'Red IPA', N'Brewed with Crystal Malts. Hopped with Amarillo and Simcoe. Notes of Citrus, Pine, and Caramel.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (187, 1, N'One to One', CAST(7.00 AS Decimal(5, 2)), NULL, N'IPA', N'Brewed with Oats and Wheat. Hopped equal parts Mosaic and Amarillo. Notes of Berries, Lemon, Grapefruit, and Pine.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (188, 1, N'Point of Confusion', CAST(9.20 AS Decimal(5, 2)), NULL, N'White Pastry Stout', N'Brewed with Oats.  Conditioned on our Shakes coffee blend, Cacao Nibs,Maple Syrup, and Hazelnut.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (189, 1, N'Crossline', CAST(8.00 AS Decimal(5, 2)), NULL, N'Double IPA', N'Brewed with Wheat and Oats. Hopped with Nelson Sauvin and Amarillo.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (190, 1, N'How Many Planets?', CAST(9.00 AS Decimal(5, 2)), NULL, N'Double IPA', N'Brewed with Wheat and Oats. Hopped with Nelson Sauvin, Galaxy, and Citra.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (191, 1, N'Double Bane of Existence', CAST(9.00 AS Decimal(5, 2)), NULL, N'Double IPA', N'Brewed with Oats and Wheat. Hopped with Citra and Simcoe. Notes of tropical fruits, stone fruit, and mango.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (193, 1, N'Yellow Blazer', CAST(8.80 AS Decimal(5, 2)), NULL, N'Double IPA', N'Collaboration with New Trail Brewing Co.  Brewed with Pilsner Malt, Oats, and White Wheat. Hopped with Citra and Nelson Sauvin Hops. Yellow Blazer is named after a hiker who skips a section of trail by Hitchhiking.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (194, 1, N'Single Cell', CAST(4.40 AS Decimal(5, 2)), NULL, N'Unfiltered Pilsner', N'Brewed with Pilsner Malt and fermented with our House Lager yeast. Dry Hopped with Nelson Sauvin.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (195, 1, N'Cran-bottle Service', CAST(7.00 AS Decimal(5, 2)), NULL, N'Mimosa Smoothie Sour', N'This kettle sour was brewed with Oats. Conditioned on Orange and Cranberries.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (196, 1, N'Just Filling', CAST(8.00 AS Decimal(5, 2)), NULL, N'Smoothie Sour', N'Kettle Sour brewed with Oats and Milk Sugar. Conditioned on Tart Plum, Blueberry, Cinnamon & Vanilla.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (197, 1, N'Subsurface All Orange', CAST(7.00 AS Decimal(5, 2)), NULL, N'Smoothie Sour', N'Kettle Sour brewed with Wheat. Conditioned on Cara Cara Orange, Blood Orange, and Tangerine.', 1)
GO
INSERT [dbo].[beers] ([beer_id], [brewery_id], [name], [abv], [ibu], [style], [description], [isActive]) VALUES (198, 1, N'Implement of Destruction', CAST(10.40 AS Decimal(5, 2)), NULL, N'Imperial Stout', N'Brewed with Caramel and Dark Malts. A classic Imperial Stout.', 1)
GO
SET IDENTITY_INSERT [dbo].[beers] OFF
GO
ALTER TABLE [dbo].[beers]  WITH CHECK ADD  CONSTRAINT [FK_beers_breweries] FOREIGN KEY([brewery_id])
REFERENCES [dbo].[breweries] ([brewery_id])
GO
ALTER TABLE [dbo].[beers] CHECK CONSTRAINT [FK_beers_breweries]
GO

CREATE TABLE [beer_reviews] (
	review_id INT IDENTITY(1,1) NOT NULL,
	subject VARCHAR(50) NOT NULL,
	description NVARCHAR(MAX),
	rating DECIMAL NOT NULL,
	date DATE NOT NULL DEFAULT cast(GETUTCDATE()as date),
	beer_id INT NOT NULL,
	user_id INT NOT NULL,
	CONSTRAINT [PK_event] PRIMARY KEY (review_id),
	CONSTRAINT [FK_event_beer] FOREIGN KEY (beer_id) REFERENCES beers(beer_id),
	CONSTRAINT [FK_event_user] FOREIGN KEY (user_id) REFeRENCES users(user_id),
	CONSTRAINT [CHK_duration] CHECK (rating >= 0 and rating <= 5)
);

