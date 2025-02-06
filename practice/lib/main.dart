import 'package:flutter/material.dart';

void main() {
  runApp(ProductNavigationApp());
}

class ProductNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Pixel',
      'description': 'Pixel is the most featureful phone ever',
      'price': 800,
      'color': Colors.blue,
      'rating': 4.5
    },
    {
      'name': 'Laptop',
      'description': 'Laptop is the most productive development tool',
      'price': 2000,
      'color': Colors.green,
      'rating': 4.7
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is the most useful device ever for meetings',
      'price': 1500,
      'color': Colors.orange,
      'rating': 4.3
    },
    {
      'name': 'Pendrive',
      'description': 'Pendrive is the stylish storage device',
      'price': 100,
      'color': Colors.red,
      'rating': 4.0
    },
    {
      'name': 'Floppy Drive',
      'description': 'Floppy Drive is a legacy device',
      'price': 50,
      'color': Colors.purple,
      'rating': 3.5
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Navigation'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: product['color'],
                child: Text(
                  product['name'][0],
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['description']),
                  Row(
                    children: List.generate(
                      5,
                      (starIndex) => Icon(
                        Icons.star,
                        color: starIndex < product['rating'].round()
                            ? Colors.amber
                            : Colors.grey,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: Text('Price: \$${product['price']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
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

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product['name'],
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              product['description'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Row(
              children: List.generate(
                5,
                (starIndex) => Icon(
                  Icons.star,
                  color: starIndex < product['rating'].round()
                      ? Colors.amber
                      : Colors.grey,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
