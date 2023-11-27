// Import the 'dart:math' library for random number generation
import 'dart:math';

// Create a random number generator
Random random = Random();

// List of names for users
List names = [
  "Ling Waldner",
  "Gricelda Barrera",
  "Lenard Milton",
  "Bryant Marley",
  "Rosalva Sadberry",
  "Guadalupe Ratledge",
  "Brandy Gazda",
  "Kurt Toms",
  "Rosario Gathright",
  "Kim Delph",
  "Stacy Christensen",
];

// List of sample messages
List messages = [
  "Hey, how are you doing?",
  "Are you available tomorrow?",
  "It's late. Go to bed!",
  "This cracked me up 😂😂",
  "Flutter Rocks!!!",
  "The last rocket🚀",
  "Griezmann signed for Barca❤️❤️",
  "Will you be attending the meetup tomorrow?",
  "Are you angry at something?",
  "Let's make a UI serie.",
  "Can I hear your voice?",
];

// List of sample notifications
List notifs = [
  "${names[random.nextInt(10)]} and ${random.nextInt(100)} others liked your post",
  "${names[random.nextInt(10)]} mentioned you in a comment",
  "${names[random.nextInt(10)]} shared your post",
  "${names[random.nextInt(10)]} commented on your post",
  "${names[random.nextInt(10)]} replied to your comment",
  "${names[random.nextInt(10)]} reacted to your comment",
  "${names[random.nextInt(10)]} asked you to join a Group️",
  "${names[random.nextInt(10)]} asked you to like a page",
  "You have memories with ${names[random.nextInt(10)]}",
  "${names[random.nextInt(10)]} Tagged you and ${random.nextInt(100)} others in a post",
  "${names[random.nextInt(10)]} Sent you a friend request",
];

// List of sample notifications with details
List notifications = List.generate(13, (index) => {
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "time": "${random.nextInt(50)} min ago",
  "notif": notifs[random.nextInt(10)],
});

// List of sample posts
List posts = List.generate(13, (index) => {
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "time": "${random.nextInt(50)} min ago",
  "img": "assets/cm${random.nextInt(10)}.jpeg",
});

// List of sample chats
List chats = List.generate(13, (index) => {
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(50)} min ago",
  "isOnline": random.nextBool(),
});

// List of sample groups
List groups = List.generate(13, (index) => {
  "name": "Group ${random.nextInt(20)}",
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "msg": messages[random.nextInt(10)],
  "counter": random.nextInt(20),
  "time": "${random.nextInt(50)} min ago",
  "isOnline": random.nextBool(),
});

// List of message types (text, image)
List types = ["text", "image"];

// List of sample conversation messages
List conversation = List.generate(10, (index) => {
  "username": "Group ${random.nextInt(20)}",
  "time": "${random.nextInt(50)} min ago",
  "type": types[random.nextInt(2)],
  "replyText": messages[random.nextInt(10)],
  "isMe": random.nextBool(),
  "isGroup": false,
  "isReply": random.nextBool(),
});

// List of sample friends
List friends = List.generate(13, (index) => {
  "name": names[random.nextInt(10)],
  "dp": "assets/cm${random.nextInt(10)}.jpeg",
  "status": "Anything could be here",
  "isAccept": random.nextBool(),
});
