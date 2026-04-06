import 'models/user.dart';
import 'models/listing.dart';
import 'models/conversation.dart';

String _img(int seed, [int w = 400, int h = 400]) =>
    'https://picsum.photos/seed/$seed/$w/$h';

final mockUser = AppUser(
  uid: 'user-me',
  email: 'alex@purdue.edu',
  displayName: 'Alex Johnson',
  avatarUrl: _img(100, 200, 200),
  bio: 'Junior, CS major. Trying to declutter my dorm before summer!',
  campusId: 'purdue',
  campusName: 'Purdue University',
  graduationYear: 2027,
  listingCount: 4,
  rating: 4.8,
  ratingCount: 12,
  badges: ['Fast Responder', '5-Star Seller'],
  itemsSold: 8,
  itemsDonated: 3,
  itemsBought: 5,
  moneySaved: 340,
  co2Diverted: 45,
);

final mockListings = <Listing>[
  Listing(id: 'l1', sellerId: 'user-2', sellerName: 'Maya Patel', sellerAvatarUrl: _img(201, 200, 200), sellerRating: 4.9,
    title: 'TI-84 Plus CE Graphing Calculator', description: 'Used for one semester of calc. Works perfectly, comes with USB cable.', price: 65, category: 'electronics', condition: 'Like New', images: [_img(10), _img(11)], createdAt: DateTime.now().subtract(const Duration(hours: 3))),
  Listing(id: 'l2', sellerId: 'user-3', sellerName: 'Jordan Kim', sellerAvatarUrl: _img(202, 200, 200), sellerRating: 4.5,
    title: 'Organic Chemistry Textbook (8th Ed)', description: 'McMurry Organic Chemistry. No highlighting, good condition.', price: 35, category: 'books', condition: 'Good', images: [_img(20)], createdAt: DateTime.now().subtract(const Duration(hours: 6))),
  Listing(id: 'l3', sellerId: 'user-4', sellerName: 'Sam Rivera', sellerAvatarUrl: _img(203, 200, 200), sellerRating: 4.7,
    title: 'Mini Fridge - Perfect for Dorm', description: 'Galanz 3.3 cu ft mini fridge. Works great. Pick up from Earhart.', price: 50, category: 'dorm_stuff', condition: 'Good', images: [_img(30)], createdAt: DateTime.now().subtract(const Duration(hours: 12))),
  Listing(id: 'l4', sellerId: 'user-5', sellerName: 'Priya Sharma', sellerAvatarUrl: _img(204, 200, 200), sellerRating: 5.0,
    title: 'North Face Puffer Jacket (M)', description: 'Black 700-fill puffer. Worn maybe 5 times, basically new.', price: 85, category: 'clothing', condition: 'Like New', images: [_img(40)], createdAt: DateTime.now().subtract(const Duration(days: 1))),
  Listing(id: 'l5', sellerId: 'user-2', sellerName: 'Maya Patel', sellerAvatarUrl: _img(201, 200, 200), sellerRating: 4.9,
    title: 'Desk Lamp with USB Charging', description: 'LED desk lamp with 3 brightness levels and USB port.', price: 0, isDonate: true, category: 'dorm_stuff', condition: 'Good', images: [_img(50)], createdAt: DateTime.now().subtract(const Duration(days: 1))),
  Listing(id: 'l6', sellerId: 'user-6', sellerName: 'Chris Lee', sellerAvatarUrl: _img(205, 200, 200), sellerRating: 4.2,
    title: 'MacBook Pro Charger (67W USB-C)', description: 'Original Apple charger. Upgraded to MagSafe so don\'t need this.', price: 25, category: 'electronics', condition: 'Good', images: [_img(60)], createdAt: DateTime.now().subtract(const Duration(days: 2))),
  Listing(id: 'l7', sellerId: 'user-3', sellerName: 'Jordan Kim', sellerAvatarUrl: _img(202, 200, 200), sellerRating: 4.5,
    title: 'Physics for Scientists & Engineers', description: 'Serway & Jewett 10th edition. Some highlighting in ch 1-8.', price: 20, category: 'books', condition: 'Fair', images: [_img(70)], createdAt: DateTime.now().subtract(const Duration(days: 2))),
  Listing(id: 'l8', sellerId: 'user-7', sellerName: 'Taylor Brooks', sellerAvatarUrl: _img(206, 200, 200), sellerRating: 4.6,
    title: 'Yoga Mat + Resistance Bands Set', description: 'Thick yoga mat and set of 5 resistance bands. Used a few times.', price: 15, category: 'sports', condition: 'Like New', images: [_img(80)], createdAt: DateTime.now().subtract(const Duration(days: 3))),
  Listing(id: 'l9', sellerId: 'user-4', sellerName: 'Sam Rivera', sellerAvatarUrl: _img(203, 200, 200), sellerRating: 4.7,
    title: 'Bose QC35 II Headphones', description: 'Noise cancelling, Bluetooth. Battery still lasts 15+ hours.', price: 95, category: 'electronics', condition: 'Good', images: [_img(90), _img(91)], createdAt: DateTime.now().subtract(const Duration(days: 3))),
  Listing(id: 'l10', sellerId: 'user-5', sellerName: 'Priya Sharma', sellerAvatarUrl: _img(204, 200, 200), sellerRating: 5.0,
    title: 'Keurig K-Mini Coffee Maker', description: 'Single serve, barely used. Comes with 10 free K-cups.', price: 30, category: 'dorm_stuff', condition: 'Like New', images: [_img(101)], createdAt: DateTime.now().subtract(const Duration(days: 4))),
  Listing(id: 'l11', sellerId: 'user-6', sellerName: 'Chris Lee', sellerAvatarUrl: _img(205, 200, 200), sellerRating: 4.2,
    title: 'IKEA Desk Chair (Black)', description: 'Basic office chair, adjustable height. Free if you pick up from Hilltop.', price: 0, isDonate: true, category: 'dorm_stuff', condition: 'Fair', images: [_img(110)], createdAt: DateTime.now().subtract(const Duration(days: 4))),
  Listing(id: 'l12', sellerId: 'user-me', sellerName: 'Alex Johnson', sellerAvatarUrl: _img(100, 200, 200), sellerRating: 4.8,
    title: 'Data Structures & Algorithms Textbook', description: 'CLRS Introduction to Algorithms, 4th edition. Like new.', price: 45, category: 'books', condition: 'Like New', images: [_img(120)], createdAt: DateTime.now().subtract(const Duration(days: 5))),
  Listing(id: 'l13', sellerId: 'user-7', sellerName: 'Taylor Brooks', sellerAvatarUrl: _img(206, 200, 200), sellerRating: 4.6,
    title: '2 Purdue Football Tickets - vs Ohio State', description: 'Section 114, Row 22. Selling both for \$70.', price: 70, category: 'tickets', condition: 'New', images: [_img(130)], createdAt: DateTime.now().subtract(const Duration(days: 1))),
  Listing(id: 'l14', sellerId: 'user-2', sellerName: 'Maya Patel', sellerAvatarUrl: _img(201, 200, 200), sellerRating: 4.9,
    title: 'Extension Cord (15 ft, 6 outlets)', description: 'Surge protector power strip. Works great, just have too many.', price: 0, isDonate: true, category: 'utilities', condition: 'Good', images: [_img(140)], createdAt: DateTime.now().subtract(const Duration(days: 6))),
  Listing(id: 'l15', sellerId: 'user-3', sellerName: 'Jordan Kim', sellerAvatarUrl: _img(202, 200, 200), sellerRating: 4.5,
    title: 'Nike Air Force 1 (Size 10)', description: 'White AF1s, worn a handful of times. Minor creasing.', price: 55, category: 'clothing', condition: 'Good', images: [_img(150)], createdAt: DateTime.now().subtract(const Duration(days: 7))),
  Listing(id: 'l16', sellerId: 'user-4', sellerName: 'Sam Rivera', sellerAvatarUrl: _img(203, 200, 200), sellerRating: 4.7,
    title: 'Logitech Webcam C920', description: 'HD 1080p webcam. Works perfectly with Zoom/Teams.', price: 30, category: 'electronics', condition: 'Good', images: [_img(160)], createdAt: DateTime.now().subtract(const Duration(days: 7))),
  Listing(id: 'l17', sellerId: 'user-me', sellerName: 'Alex Johnson', sellerAvatarUrl: _img(100, 200, 200), sellerRating: 4.8,
    title: 'Twin XL Mattress Topper', description: 'Memory foam, 3 inch. Makes dorm beds comfortable.', price: 25, category: 'dorm_stuff', condition: 'Good', images: [_img(170)], createdAt: DateTime.now().subtract(const Duration(days: 8))),
  Listing(id: 'l18', sellerId: 'user-5', sellerName: 'Priya Sharma', sellerAvatarUrl: _img(204, 200, 200), sellerRating: 5.0,
    title: 'Lululemon Align Leggings (Size 6)', description: 'Black, 25 inch. Worn maybe 3 times.', price: 40, category: 'clothing', condition: 'Like New', images: [_img(180)], createdAt: DateTime.now().subtract(const Duration(days: 9))),
  Listing(id: 'l19', sellerId: 'user-6', sellerName: 'Chris Lee', sellerAvatarUrl: _img(205, 200, 200), sellerRating: 4.2,
    title: 'Basketball (Spalding)', description: 'Good grip, holds air well. Great for the co-rec.', price: 10, category: 'sports', condition: 'Good', images: [_img(190)], createdAt: DateTime.now().subtract(const Duration(days: 10))),
  Listing(id: 'l20', sellerId: 'user-7', sellerName: 'Taylor Brooks', sellerAvatarUrl: _img(206, 200, 200), sellerRating: 4.6,
    title: 'Shower Caddy + Bathroom Kit', description: 'Mesh caddy, towels, shower shoes. All free, just pick up.', price: 0, isDonate: true, category: 'utilities', condition: 'Fair', images: [_img(200)], createdAt: DateTime.now().subtract(const Duration(days: 5))),
  Listing(id: 'l21', sellerId: 'user-me', sellerName: 'Alex Johnson', sellerAvatarUrl: _img(100, 200, 200), sellerRating: 4.8,
    title: 'USB-C Hub (7-in-1)', description: 'Anker hub: HDMI, USB-A, USB-C PD, SD card.', price: 20, category: 'electronics', condition: 'Like New', images: [_img(210)], createdAt: DateTime.now().subtract(const Duration(days: 12))),
  Listing(id: 'l22', sellerId: 'user-me', sellerName: 'Alex Johnson', sellerAvatarUrl: _img(100, 200, 200), sellerRating: 4.8,
    title: 'Box of School Supplies', description: 'Notebooks, pens, highlighters, sticky notes. Take the whole box, free!', price: 0, isDonate: true, category: 'utilities', condition: 'Good', images: [_img(220)], createdAt: DateTime.now().subtract(const Duration(days: 3))),
];

final mockConversations = <Conversation>[
  Conversation(id: 'conv-1', otherUserId: 'user-2', otherUserName: 'Maya Patel', otherUserAvatar: _img(201, 200, 200),
    listingId: 'l1', listingTitle: 'TI-84 Plus CE', listingImage: _img(10),
    lastMessageText: 'I\'m free after 4pm. Meet at PMU?', lastMessageTime: DateTime.now().subtract(const Duration(minutes: 15)), unreadCount: 1),
  Conversation(id: 'conv-2', otherUserId: 'user-4', otherUserName: 'Sam Rivera', otherUserAvatar: _img(203, 200, 200),
    listingId: 'l3', listingTitle: 'Mini Fridge', listingImage: _img(30),
    lastMessageText: 'I can pick it up tomorrow at 3pm', lastMessageTime: DateTime.now().subtract(const Duration(hours: 2)), unreadCount: 1),
  Conversation(id: 'conv-3', otherUserId: 'user-5', otherUserName: 'Priya Sharma', otherUserAvatar: _img(204, 200, 200),
    listingId: 'l10', listingTitle: 'Keurig K-Mini', listingImage: _img(101),
    lastMessageText: 'Sounds good, see you then!', lastMessageTime: DateTime.now().subtract(const Duration(days: 1)), unreadCount: 0),
];

final mockMessages = <String, List<Message>>{
  'conv-1': [
    Message(id: 'm1', senderId: 'user-me', text: 'Hey! Is the TI-84 still available?', createdAt: DateTime.now().subtract(const Duration(minutes: 30)), isMe: true),
    Message(id: 'm2', senderId: 'user-2', text: 'Yes it is! Are you on campus?', createdAt: DateTime.now().subtract(const Duration(minutes: 25)), isMe: false),
    Message(id: 'm3', senderId: 'user-me', text: 'Yeah I\'m at Hillenbrand. Can you do \$55?', createdAt: DateTime.now().subtract(const Duration(minutes: 20)), isMe: true),
    Message(id: 'm4', senderId: 'user-2', text: 'How about \$60? It\'s basically new', createdAt: DateTime.now().subtract(const Duration(minutes: 18)), isMe: false),
    Message(id: 'm5', senderId: 'user-me', text: 'Deal! When can we meet?', createdAt: DateTime.now().subtract(const Duration(minutes: 16)), isMe: true),
    Message(id: 'm6', senderId: 'user-2', text: 'I\'m free after 4pm. Meet at PMU?', createdAt: DateTime.now().subtract(const Duration(minutes: 15)), isMe: false),
  ],
  'conv-2': [
    Message(id: 'm10', senderId: 'user-me', text: 'Hi! Interested in the mini fridge.', createdAt: DateTime.now().subtract(const Duration(hours: 5)), isMe: true),
    Message(id: 'm11', senderId: 'user-4', text: 'Great! It\'s in Earhart. Would you do \$45?', createdAt: DateTime.now().subtract(const Duration(hours: 4)), isMe: false),
    Message(id: 'm12', senderId: 'user-me', text: 'Sure, \$45 works!', createdAt: DateTime.now().subtract(const Duration(hours: 3)), isMe: true),
    Message(id: 'm13', senderId: 'user-4', text: 'I can pick it up tomorrow at 3pm', createdAt: DateTime.now().subtract(const Duration(hours: 2)), isMe: false),
  ],
  'conv-3': [
    Message(id: 'm20', senderId: 'user-5', text: 'Hey, saw you\'re interested in the Keurig!', createdAt: DateTime.now().subtract(const Duration(days: 2)), isMe: false),
    Message(id: 'm21', senderId: 'user-me', text: 'Yes! Does it come with the K-cups?', createdAt: DateTime.now().subtract(const Duration(days: 2)), isMe: true),
    Message(id: 'm22', senderId: 'user-5', text: 'Yep, 10 assorted pods included!', createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 12)), isMe: false),
    Message(id: 'm23', senderId: 'user-me', text: 'How about Friday at noon?', createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 5)), isMe: true),
    Message(id: 'm24', senderId: 'user-5', text: 'Perfect! Meet at WALC lobby?', createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 3)), isMe: false),
    Message(id: 'm25', senderId: 'user-me', text: 'Sounds good, see you then!', createdAt: DateTime.now().subtract(const Duration(days: 1)), isMe: true),
  ],
};

final mockWishlist = <WishlistItem>[
  WishlistItem(id: 'w1', query: 'iPad', category: 'electronics', maxPrice: 200),
  WishlistItem(id: 'w2', query: 'Calculus textbook', category: 'books', maxPrice: 30),
  WishlistItem(id: 'w3', query: 'Bike', maxPrice: 100),
];

final categories = [
  {'key': 'all', 'label': 'All'},
  {'key': 'electronics', 'label': 'Electronics'},
  {'key': 'books', 'label': 'Books'},
  {'key': 'clothing', 'label': 'Clothing'},
  {'key': 'dorm_stuff', 'label': 'Dorm'},
  {'key': 'utilities', 'label': 'Utilities'},
  {'key': 'sports', 'label': 'Sports'},
  {'key': 'tickets', 'label': 'Tickets'},
];

String timeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inMinutes < 1) return 'Just now';
  if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
  if (diff.inHours < 24) return '${diff.inHours}h ago';
  if (diff.inDays < 7) return '${diff.inDays}d ago';
  return '${(diff.inDays / 7).floor()}w ago';
}
