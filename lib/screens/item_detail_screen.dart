import 'package:flutter/material.dart';
import '../theme.dart';
import '../mock_data.dart';
import 'chat_room_screen.dart';
import 'seller_profile_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  final String listingId;

  const ItemDetailScreen({super.key, required this.listingId});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  bool _isWishlisted = false;
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final listing = mockListings.firstWhere(
      (l) => l.id == widget.listingId,
      orElse: () => mockListings.first,
    );

    // Find a conversation with this listing if one exists, else use a placeholder
    final existingConv = mockConversations.where(
        (c) => c.listingId == listing.id).toList();
    final convId = existingConv.isNotEmpty ? existingConv.first.id : 'conv-1';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Image sliver app bar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: AppColors.background,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_rounded,
                    color: AppColors.textPrimary, size: 20),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => setState(() => _isWishlisted = !_isWishlisted),
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    _isWishlisted ? Icons.favorite : Icons.favorite_border,
                    color: _isWishlisted ? AppColors.error : AppColors.textSecondary,
                    size: 20,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  listing.images.isNotEmpty
                      ? Image.network(
                          listing.images[_currentImageIndex
                              .clamp(0, listing.images.length - 1)],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stack) => Container(
                            color: AppColors.skeleton,
                            alignment: Alignment.center,
                            child: const Icon(Icons.image_not_supported_outlined,
                                size: 48, color: AppColors.textSecondary),
                          ),
                        )
                      : Container(color: AppColors.skeleton),
                  // Image dots indicator
                  if (listing.images.length > 1)
                    Positioned(
                      bottom: 12,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          listing.images.length,
                          (i) => GestureDetector(
                            onTap: () =>
                                setState(() => _currentImageIndex = i),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              width: _currentImageIndex == i ? 20 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentImageIndex == i
                                    ? Colors.white
                                    : Colors.white.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price & title row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          listing.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      listing.isDonate
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: AppColors.secondary
                                    .withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'FREE',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.secondary,
                                ),
                              ),
                            )
                          : Text(
                              listing.formattedPrice,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.success,
                              ),
                            ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Condition chip
                  _ConditionChip(condition: listing.condition),
                  const SizedBox(height: 20),

                  // Seller row
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SellerProfileScreen(
                              sellerId: listing.sellerId),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundImage: listing.sellerAvatarUrl != null
                                ? NetworkImage(listing.sellerAvatarUrl!)
                                : null,
                            backgroundColor: AppColors.skeleton,
                            child: listing.sellerAvatarUrl == null
                                ? Text(
                                    listing.sellerName[0],
                                    style: const TextStyle(
                                        color: AppColors.textSecondary),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listing.sellerName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rounded,
                                        size: 14, color: AppColors.warning),
                                    const SizedBox(width: 2),
                                    Text(
                                      listing.sellerRating
                                          .toStringAsFixed(1),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right,
                              color: AppColors.textSecondary),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    listing.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Posted ${timeAgo(listing.createdAt)}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  // Bottom padding for the fixed bar
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom action bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
            20, 12, 20, MediaQuery.of(context).padding.bottom + 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ChatRoomScreen(conversationId: convId),
                    ),
                  );
                },
                icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
                label: const Text('Message Seller'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: OutlinedButton.icon(
                onPressed: () =>
                    setState(() => _isWishlisted = !_isWishlisted),
                icon: Icon(
                  _isWishlisted ? Icons.bookmark : Icons.bookmark_border,
                  size: 18,
                ),
                label: Text(_isWishlisted ? 'Saved' : 'Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ConditionChip extends StatelessWidget {
  final String condition;

  const _ConditionChip({required this.condition});

  Color get _color {
    switch (condition) {
      case 'New':
        return AppColors.success;
      case 'Like New':
        return const Color(0xFF00B894);
      case 'Good':
        return AppColors.warning;
      case 'Fair':
        return AppColors.error;
      default:
        return AppColors.textSecondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color.withValues(alpha: 0.4)),
      ),
      child: Text(
        condition,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}
