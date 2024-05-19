class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Berkane Ali",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user/user_1.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Hammadi Mohamed",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Khalfawi Ahmed",
    lastMessage: "Do you have update...",
    image: "assets/images/user/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Temame Adam",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user/user_4.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Lakhdarezzine Hanaa",
    lastMessage: "Thanks",
    image: "assets/images/user/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Berkane Ali",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user/user_1.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Hammadi Mohamed",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Khalfawi Ahmed",
    lastMessage: "Do you have update...",
    image: "assets/images/user/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];
