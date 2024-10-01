import 'package:flutter/material.dart';

class Productview extends StatelessWidget {
  final Map<String, dynamic> product;

  const Productview({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Image.network(
                product['images'][0] ?? '',
                height: 150,
                width: 100,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  product['description'] ?? 'No Description',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "ID: ${product['id']?.toString() ?? 'N/A'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Discount: ${product['discountPercentage']?.toString() ?? 'N/A'}%",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Rating: ${product['rating']?.toString() ?? 'N/A'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Stock: ${product['stock']?.toString() ?? 'N/A'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Tags: ${product['tags']?.join(', ') ?? 'No Tags'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Brand: ${product['brand'] ?? 'No Brand'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "SKU: ${product['sku'] ?? 'No SKU'}",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "\$${product['price']?.toString() ?? 'No Price'}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
