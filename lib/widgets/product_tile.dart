import 'package:flutter/material.dart';
import 'package:product_list_multilang/providers/language_provider.dart';
import 'package:product_list_multilang/translations/translations.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final String name;
  final String description;
  final String imageAsset;

  const ProductTile({
    super.key,
    required this.name,
    required this.description,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    final langProvider = Provider.of<LanguageProvider>(context);
    final lang = langProvider.currentLang;
    final t = translations[lang]!;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                  child: Image.asset(imageAsset,
                      height: 240, fit: BoxFit.contain)),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            Row(
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
          ],
        ),
      ),
    );
  }
}
