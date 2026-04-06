class Conversation {
  final String id;
  final String otherUserId;
  final String otherUserName;
  final String? otherUserAvatar;
  final String listingId;
  final String listingTitle;
  final String listingImage;
  final String lastMessageText;
  final DateTime lastMessageTime;
  final int unreadCount;

  const Conversation({
    required this.id,
    required this.otherUserId,
    required this.otherUserName,
    this.otherUserAvatar,
    required this.listingId,
    required this.listingTitle,
    required this.listingImage,
    required this.lastMessageText,
    required this.lastMessageTime,
    this.unreadCount = 0,
  });
}

class Message {
  final String id;
  final String senderId;
  final String text;
  final DateTime createdAt;
  final bool isMe;

  const Message({
    required this.id,
    required this.senderId,
    required this.text,
    required this.createdAt,
    required this.isMe,
  });
}
