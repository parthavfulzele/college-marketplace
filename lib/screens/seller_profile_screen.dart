import 'package:flutter/material.dart';
import '../theme.dart';
import '../mock_data.dart';
import '../widgets/item_card.dart';
import '../widgets/sustainability_card.dart';
import 'item_detail_screen.dart';

class SellerProfileScreen extends StatelessWidget {
  final String sellerId;

  const SellerProfileScreen({super.key, required this.sellerId});

  @override
  Widget build(BuildContext context) {
    final sellerListings =
        mockListings.where((l) => l.sellerId == sellerId).toList();

    // Derive seller info from their first listing
    final String sellerName = sellerListings.isNotEmpty
        ? sellerListings.first.sellerName
        : 'Unknown Seller';
    final String? sellerAvatar = sellerListings.isNotEmpty
        ? sellerListings.first.sellerAvatarUrl
        : null;
    final double sellerRating = sellerListings.isNotEmpty
        ? sellerListings.first.sellerRating
        : 0.0;

    // Compute rough sustainability stats for this seller
    final itemsDiverted = sellerListings.length;
    final moneySaved = sellerListings
        .fold<double>(0, (sum, l) => sum + (l.isDonate ? l.price : 0));
    final co2Saved = (itemsDiverted * 2.5);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          sellerName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seller header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: sellerAvatar != null
                        ? NetworkImage(sellerAvatar)
                        : null,
                    backgroundColor: AppColors.skeleton,
                    child: sellerAvatar == null
                        ? Text(
                            sellerName[0],
                            style: const TextStyle(
                                fontSize: 28,
                                color: AppColors.textSecondary),
                          )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sellerName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Purdue University',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            ...List.generate(5, (i) => Icon(
                                  i < sellerRating.floor()
                                      ? Icons.star_rounded
                                      : Icons.star_outline_rounded,
                                  size: 16,
                                  color: AppColors.warning,
                                )),
                            const SizedBox(width: 4),
                            Text(
                              sellerRating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${sellerListings.length} listing${sellerListings.length != 1 ? "s" : ""}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Sustainability card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SustainabilityCard(
                itemsDiverted: itemsDiverted,
                moneySaved: moneySaved,
                co2Saved: co2Saved,
              ),
            ),
            const SizedBox(height: 20),

            // Listings
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Listings by $sellerName',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 12),
            sellerListings.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(32),
                    child: Center(
                      child: Text(
                        'No listings from this seller',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                    ),
                    itemCount: sellerListings.length,
                    itemBuilder: (context, index) {
                      final listing = sellerListings[index];
                      return ItemCard(
                        listing: listing,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ItemDetailScreen(listingId: listing.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
