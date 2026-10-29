import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Store App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductCatalogPage(),
    );
  }
}

class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({super.key});

  final List> products = const [
    {
      'name': 'Ноутбук',
      'category': 'Электроника',
      'price': 250000,
      'rating': 4.8,
      'description': 'Жұмыс пен оқуға арналған қуатты ноутбук.',
      'icon': Icons.laptop,
    },
    {
      'name': 'Смартфон',
      'category': 'Электроника',
      'price': 180000,
      'rating': 4.9,
      'description': 'Жоғары сапалы камерасы бар жаңа үлгідегі смартфон.',
      'icon': Icons.smartphone,
    },
    {
      'name': 'Құлаққап',
      'category': 'Аксессуарлар',
      'price': 15000,
      'rating': 4.5,
      'description': 'Шуды басатын функциясы бар сымсыз құлаққап.',
      'icon': Icons.headphones,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Тауарлар каталогы'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              leading: Icon(product['icon'] as IconData, size: 40, color: Colors.blue),
              title: Text(product['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Бағасы: ${product['price']} ₸'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isEffectiveOffer = (product['price'] as int) < 50000;

    return Scaffold(
      appBar: AppBar(
        title: Text('${product['name']} Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(product['icon'] as IconData, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            if (isEffectiveOffer)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Тиімді ұсыныс!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            Text(
              product['name'] as String,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Категория: ${product['category']}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              'Рейтинг: ⭐ ${product['rating']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Бағасы: ${product['price']} ₸',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 15),
            Text(
              'Сипаттамасы: ${product['description']}',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Артқа қайту'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
