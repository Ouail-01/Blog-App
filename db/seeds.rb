# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding..."
Like.destroy_all
Comment.destroy_all
Post.destroy_all
User.destroy_all

first_user = User.create(name: 'Ouail', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Web developer by day, gaming enthusiast by night 🕹️🎮. Code lover with a passion for building web applications and exploring the latest tech trends. Let\'s create something awesome together! 💻🚀 #WebDevelopment #Gamer #TechNerd', posts_counter: '0')
second_user = User.create(name: 'Noah', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Passionate traveler and foodie 🌍🍔. Always on the lookout for new adventures and hidden gems. Follow my journey as I explore the world one city at a time! ✈️📸 #Traveler #Foodie #Wanderlust', posts_counter: 0)
third_user = User.create(name: 'Emma', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Fitness enthusiast and yoga lover 🧘‍♀️💪. On a mission to inspire others to lead a healthy and balanced lifestyle. Join me on this journey to achieve wellness and inner peace. Namaste! 🌿🌸 #Fitness #Yoga #Wellness', posts_counter: 0)
fourth_user = User.create(name: 'Michael', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Nature lover and outdoor adventurer 🏞️⛺. Exploring the beauty of Mother Earth one hike at a time. Join me on my outdoor escapades and let\'s embrace the wonders of nature together! 🌳🌄 #Hiking #NatureLover #Adventure', posts_counter: 0)
fifth_user = User.create(name: 'Olivia', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Bookworm and aspiring writer 📚✍️. Lost in the world of words and imagination. I\'ll take you on literary adventures through my writing. Let\'s get lost in the magic of books together! 📖🌟 #BookLover #WritingCommunity #Storyteller', posts_counter: 0)
sixth_user = User.create(name: 'Liam', photo: 'ghttps://unsplash.com/photos/6dmx8YnkPGo', bio: 'Tech geek and coffee addict ☕🤓. Constantly amazed by the power of technology and fueled by caffeine. Join me as we dive into the world of gadgets, apps, and everything tech! 📱💻 #TechGeek #CoffeeLover #GadgetEnthusiast', posts_counter: 0)

first_post = Post.create(author: first_user, title: 'Exploring the Enchanting Forest', text: 'Venturing deep into the mystical woods, I discovered a hidden world of ancient trees and magical creatures. The air was filled with a sense of wonder as I wandered through the lush greenery.', comment_counter: 0, likes_counter: 0, )
second_post = Post.create(author: second_user, title: 'A Journey to the Heart of the Mountains', text: 'Scaling the rugged peaks, I embraced the breathtaking vistas that stretched before me. The towering mountains stood as silent witnesses to the grandeur of nature.', comment_counter: 0, likes_counter: 0, )
third_post = Post.create(author: third_user, title: 'Unraveling the Secrets of the Ancient Ruins', text: 'Walking amidst the ancient ruins, I felt a connection to the past, lost in time. Each crumbling stone whispered tales of a forgotten civilization waiting to be discovered.', comment_counter: 0, likes_counter: 0, )
fourth_post = Post.create(author: fourth_user, title: 'Sunset Serenade by the Ocean', text: 'As the sun dipped below the horizon, the ocean sang its evening symphony. The crashing waves and gentle breeze lulled me into a state of tranquility.', comment_counter: 0, likes_counter: 0, )
fifth_post = Post.create(author: fifth_user, title: 'In the Footsteps of History: Exploring Ancient Cities', text: 'Strolling through ancient cities, I marveled at the architectural wonders built centuries ago. The cobblestone streets echoed with the whispers of bygone civilizations.', comment_counter: 0, likes_counter: 0, )
sixth_post = Post.create(author: sixth_user, title: 'Savoring Culinary Delights Around the World', text: 'From the sizzling street food in bustling markets to the elegant haute cuisine in Michelin-starred restaurants, my taste buds embarked on a global culinary adventure."', comment_counter: 0, likes_counter: 0, )
seventh_post = Post.create(author: first_user, title: 'A Night Under the Stars: Camping in the Wilderness', text: 'Cocooned in a cozy tent, I gazed up at the twinkling constellations overhead. The crackling campfire and the distant howls of wildlife created an unforgettable night in the wilderness.', comment_counter: 0, likes_counter: 0, )
eighth_post = Post.create(author: second_user, title: 'Diving into the Azure Depths: Exploring Coral Reefs', text: 'Submerged in the vibrant underwater world, I swam alongside colorful coral reefs teeming with a kaleidoscope of marine life. The ocean\'s beauty left me mesmerized.', comment_counter: 0, likes_counter: 0, )
nineth_post = Post.create(author: third_user, title: 'Lost in the Pages: A Book Lover\'s Retreat', text: 'Immersed in the embrace of my favorite books, I found solace in a cozy nook surrounded by literary treasures. The written words transported me to far-off lands and fantastical realms.', comment_counter: 0, likes_counter: 0, )
tenth_post = Post.create(author: first_user, title: 'Through the Lens: Capturing Nature\'s Beauty', text: 'With camera in hand, I embarked on a photographic journey to capture the essence of nature\'s wonders. Each shot revealed the raw beauty of landscapes and wildlife.', comment_counter: 0, likes_counter: 0, )

Comment.create(post: first_post, author: second_user, text: 'Great post! Really enjoyed reading it.' )
Comment.create(post: second_post, author: fifth_user, text: 'I totally agree with your points. Well said!' )
Comment.create(post: third_post, author: second_user, text: 'This is so informative. Thanks for sharing!' )
Comment.create(post: fifth_post, author: second_user, text: 'Nice work on this article. Keep it up!' )
Comment.create(post: sixth_post, author: second_user, text: 'I have a question about the topic. Can you elaborate more?' )
Comment.create(post: second_post, author: first_user, text: 'Your writing style is engaging. Looking forward to more posts.' )
Comment.create(post: first_post, author: fifth_user, text: 'I found a typo in the second paragraph. Just a heads-up.' )
Comment.create(post: fifth_post, author: fourth_user, text: 'This post helped me a lot. Thanks for the valuable insights.' )
Comment.create(post: fourth_post, author: third_user, text: 'Interesting perspective. I hadn\'t thought about it that way before.' )
Comment.create(post: sixth_post, author: first_user, text: 'I shared this with my friends. It\'s worth spreading the knowledge.' )
Comment.create(post: sixth_post, author: fourth_user, text: 'Great post! I loved the insights you shared.' )

puts "Seeding done."