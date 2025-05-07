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

    final List<Map<String, String>> products = [
      {
        'name': t['product1_name']!,
        'desc': t['product1_desc']!,
        'image': 'assets/images/black_headphones.png',
      },
      {
        'name': t['product2_name']!,
        'desc': t['product2_desc']!,
        'image': 'assets/images/smart_watch.png',
      },
      {
        'name': t['product3_name']!,
        'desc': t['product3_desc']!,
        'image': 'assets/images/running_shoes.png',
      },
      {
        'name': t['product4_name']!,
        'desc': t['product4_desc']!,
        'image': 'assets/images/speaker.png',
      },
      {
        'name': t['product5_name']!,
        'desc': t['product5_desc']!,
        'image': 'assets/images/backpack.png',
      },
    ];

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
        child: ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductTile(
              name: product['name']!,
              description: product['desc']!,
              imageAsset: product['image']!,
            );
          },
        ),
      ),
    );
  }
}
