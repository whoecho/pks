import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../data/products.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  int bottomIndex = 1;

  void _onBottomTap(int idx) {
    if (idx == 0) Navigator.pushReplacementNamed(context, '/shop');
    if (idx == 2) Navigator.pushReplacementNamed(context, '/cart');
  }

  @override
  Widget build(BuildContext context) {
    final favProv = context.watch<FavoritesProvider>();
    final favIds = favProv.allFavorites;
    final favProducts = products.where((p) => favIds.contains(p.id)).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'My Favourites',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: favProducts.isEmpty
            ? _buildEmptyState(context)
            : _buildFavoritesGrid(favProducts),
      ),
      bottomNavigationBar: MyBottomNav(
        currentIndex: bottomIndex,
        onTap: _onBottomTap,
      ),
    );
  }

  /// --- Empty State UI ---
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      key: const ValueKey('empty'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border,
                size: 80, color: Colors.grey.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text(
              'No favourites yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start exploring and tap the heart icon to save items you love.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/shop');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              icon: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
              label: const Text(
                'Browse Products',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// --- Grid of Favourite Products ---
  Widget _buildFavoritesGrid(List favProducts) {
    return GridView.builder(
      key: const ValueKey('grid'),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.68,
      ),
      itemCount: favProducts.length,
      itemBuilder: (_, i) {
        final product = favProducts[i];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ProductCard(product: product),
        );
      },
    );
  }
}