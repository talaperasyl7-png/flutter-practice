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
      title: 'Restaurant Menu App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const ProductCatalogPage(),
    );
  }
}

// 1-ші экран: Басты каталог (Тізім)
class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({super.key});

  final List> products = const [
    {
      'name': 'Пицца Pepperoni',
      'category': 'Фастфуд',
      'price': 2500,
      'rating': 4.8,
      'time': '20 мин',
      'description': 'Дәмді ірімшік пен шұжық қосылған ыстық пицца.',
      'icon': Icons.local_pizza,
    },
    {
      'name': 'Бургер Classic',
      'category': 'Фастфуд',
      'price': 1800,
      'rating': 4.5,
      'time': '15 мин',
      'description': 'Сиыр етінен жасалған шырынды котлет пен балғын көкөністер.',
      'icon': Icons.lunch_dining,
    },
    {
      'name': 'Цезарь салаты',
      'category': 'Салаттар',
      'price': 1500,
      'rating': 4.7,
      'time': '10 мин',
      'description': 'Тауық еті, қытырлақ сухари және арнайы тұздық.',
      'icon': Icons.rice_bowl,
    },
    {
      'name': 'Томат сорпасы',
      'category': 'Сорпалар',
      'price': 1200,
      'rating': 4.2,
      'time': '12 мин',
      'description': 'Ыстық және дәмді итальяндық томат сорпасы.',
      'icon': Icons.soup_kitchen,
    },
    {
      'name': 'Ролл Филадельфия',
      'category': 'Суши',
      'price': 3200,
      'rating': 4.9,
      'time': '25 мин',
      'description': 'Қызыл балық пен крем-ірімшіктен жасалған жапондық ролл.',
      'icon': Icons.set_meal,
    },
    {
      'name': 'Картоп фри',
      'category': 'Снектер',
      'price': 900,
      'rating': 4.0,
      'time': '10 мин',
      'description': 'Қытырлақ алтын түстес картоп фри.',
      'icon': Icons.fastfood,
    },
    {
      'name': 'Балмұздақ десерті',
      'category': 'Десерт',
      'price': 1100,
      'rating': 4.6,
      'time': '5 мин',
      'description': 'Шоколад сиропы қосылған тәтті балмұздақ.',
      'icon': Icons.icecream,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мейрамхана Мәзірі'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            elevation: 3,
            child: ListTile(
              leading: Icon(product['icon'], size: 40, color: Colors.orange),
              title: Text(
                product['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${product['category']} • Бағасы: ${product['price']} ₸'),
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

// 2-ші экран: Толық ақпарат экраны (Detail Screen)
class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isCheap = product['price'] < 2000;

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                product['icon'],
                size: 100,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            if (isCheap)
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
              product['name'],
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
              'Дайындалу уақыты: ${product['time']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Бағасы: ${product['price']} ₸',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange),
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
                child: const Text('Каталогқа қайту'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}