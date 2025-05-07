import 'package:flutter/material.dart';
import 'package:product_list_multilang/providers/language_provider.dart';
import 'package:product_list_multilang/translations/translations.dart';
import 'package:product_list_multilang/widgets/product_tile.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final lang = langProvider.currentLang;
    final t = translations[lang]!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          DropdownButton<String>(
            value: lang,
            underline: const SizedBox(),
            onChanged: (val) => langProvider.changeLanguage(val!),
            items: const [
              DropdownMenuItem(value: 'en', child: Text('English')),
              DropdownMenuItem(value: 'ar', child: Text('Arabic')),
              DropdownMenuItem(value: 'fr', child: Text('French')),
            ],
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Directionality(
        textDirection: langProvider.textDirection,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: ProductTile(
            name: translations[lang]!['product1_name']!,
            description: translations[lang]!['product1_desc']!,
            imageAsset: 'assets/images/black_headphones.png',
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(t['add_to_cart']!),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.payment,
                  color: Colors.white,
                  size: 20,
                ),
                label: Text(t['buy_now']!),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Proceeding to buy')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
