# College Marketplace

A high-fidelity mobile prototype for a student marketplace app, built with Flutter for an HCI (Human-Computer Interaction) class project.

Think Facebook Marketplace, but exclusively for college students. Students can buy, sell, and donate items within their campus community.

## Screenshots

The app features 12 fully interactive screens with a bold purple + teal color scheme.

| Login | Home Feed | Item Detail | Chat |
|-------|-----------|-------------|------|
| Sign in screen | 2-column grid with search and category filters | Full item view with seller info | Real-time style message bubbles |

## Features

- **Login / Sign Up** - .edu email with campus auto-detection
- **Home Feed** - Browse 20+ listings in a 2-column grid
- **Search & Filter** - Search by title, filter by category (Electronics, Books, Clothing, Dorm, Utilities, Sports, Tickets)
- **Item Detail** - View item photos, price, condition, seller rating, and description
- **Sell** - Create a listing with photo placeholders, category, condition, and price
- **Donate** - Free items section with "FREE" badges
- **Messaging** - Chat with sellers, item context banner, message bubbles
- **Profile** - View stats, sustainability impact, reputation badges, and your listings
- **Edit Profile** - Update name, bio, and graduation year
- **Wishlist** - Save searches for items you want
- **Seller Profiles** - View other users' listings and ratings

## Tech Stack

- **Flutter** (Dart) - zero external dependencies
- **State Management** - simple `setState` (no backend needed)
- **Navigation** - Flutter Navigator with custom bottom nav bar
- **Images** - `placehold.co` labeled placeholders
- **Data** - All mock data hardcoded in `lib/mock_data.dart`

## Project Structure

```
lib/
├── main.dart                 # App entry, theme, routing, auth state
├── theme.dart                # Colors, text styles, spacing
├── mock_data.dart            # 22 listings, 3 conversations, user profile
├── models/
│   ├── user.dart             # User model
│   ├── listing.dart          # Listing + WishlistItem models
│   └── conversation.dart     # Conversation + Message models
├── screens/
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── item_detail_screen.dart
│   ├── donate_screen.dart
│   ├── create_listing_screen.dart
│   ├── chat_list_screen.dart
│   ├── chat_room_screen.dart
│   ├── profile_screen.dart
│   ├── edit_profile_screen.dart
│   ├── seller_profile_screen.dart
│   └── wishlist_screen.dart
└── widgets/
    ├── bottom_nav.dart        # Custom bottom nav with oversized Sell button
    ├── item_card.dart         # Listing card for grid
    ├── category_chip.dart     # Colored filter chip
    ├── search_bar.dart        # Search input
    ├── chat_bubble.dart       # Sent/received message bubble
    └── sustainability_card.dart
```

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- iOS Simulator (Xcode) or Android emulator

### Run the app

```bash
git clone https://github.com/parthavfulzele/college-marketplace.git
cd college-marketplace
flutter run
```

That's it. No API keys, no backend setup, no environment variables.

## Design

- **Primary:** #6C5CE7 (vivid purple)
- **Secondary:** #00CECE (bright teal)
- **Accent:** #FD79A8 (hot pink)
- **Price:** #00B894 (green)
- Each category has its own color (Electronics = blue, Books = orange, Clothing = pink, etc.)
- Bold typography, 12px rounded cards, oversized Sell button in center of tab bar

## Note

This is a **prototype** for an HCI class project at University of the Pacific. There is no backend, no real authentication, and no data persistence. All data is hardcoded mock data that resets when the app restarts.

## License

MIT
