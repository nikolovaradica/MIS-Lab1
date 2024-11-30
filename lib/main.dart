import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobilni informaciski sistemi - Laboratoriska 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 65, 38)),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16),
        ),
      ),
      home: const MyHomePage(title: '211022 Radica Nikolova'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {
        'name': 'Black dress',
        'image': 'assets/black-dress.jpg',
        'description':
            'Long sleeve black dress perfect for layering in the fall.',
        'price': '\$50'
      },
      {
        'name': 'Green sweater',
        'image': 'assets/green-sweater.jpg',
        'description':
            'Forest green turtleneck sweater to keep you warm in the cold winter nights.',
        'price': '\$35'
      },
      {
        'name': 'Denim jeans',
        'image': 'assets/denim-jeans.avif',
        'description':
            'High-waisted, dark wash denim jeans with a straight leg.',
        'price': '\$70'
      },
      {
        'name': 'White sneakers',
        'image': 'assets/white-sneakers.jpg',
        'description': 'Comfortable white sneakers for casual outings.',
        'price': '\$90'
      },
      {
        'name': 'Leather jacket',
        'image': 'assets/leather-jacket.jpg',
        'description':
            'Classic black leather jacket to add an edgy touch to any outfit.',
        'price': '\$120'
      },
      {
        'name': 'Wool scarf',
        'image': 'assets/wool-scarf.jpg',
        'description':
            'Cozy and warm scarf made of premium wool for chilly days.',
        'price': '\$25'
      },
      {
        'name': 'Red heels',
        'image': 'assets/red-heels.avif',
        'description': 'Elegant red heels perfect for formal occasions.',
        'price': '\$75'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0)),
            margin: const EdgeInsets.all(12.0),
            elevation: 15,
            child: InkWell(
              splashColor: const Color.fromARGB(255, 1, 92, 34).withAlpha(30),
              onTap: () {
                print('Card tapped!');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsScreen(item: item),
                  ),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: item['image']!.isNotEmpty
                        ? Image.asset(item['image']!, width: 100, height: 100)
                        : Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name']!,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['description']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['price']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 84, 35),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final Map<String, String> item;

  const ItemDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']!),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item['image']!.isNotEmpty
                ? Image.asset(
                    item['image']!,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  )
                : Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
            const SizedBox(height: 16),
            Text(
              item['name']!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              item['description']!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Price: ${item['price']}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
