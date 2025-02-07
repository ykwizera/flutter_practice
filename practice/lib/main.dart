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
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpandedProductPage(product: product),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: product['color'],
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['description'],
                            style: TextStyle(color: Colors.black87),
                          ),
                          SizedBox(height: 8),
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
                          SizedBox(height: 8),
                          Text(
                            'Price: \$${product['price']}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
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

class ExpandedProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ExpandedProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Name with Background Color
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: product['color'],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Product Description
            Text(
              product['description'],
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(height: 16),

            // Product Price
            Text(
              'Price: \$${product['price']}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            SizedBox(height: 16),

            // Product Rating
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
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
