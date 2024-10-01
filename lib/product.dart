import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'productview.dart';


class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List product = [];

  Future<void> fetchData() async {
    try {
      final res = await http.get(Uri.parse('https://dummyjson.com/products'));
      print("API Method");
      print(res.toString());
      print(res.body.toString());

      if (res.statusCode == 200) {
        setState(() {
          product = json.decode(res.body)["products"];
        });
      } else {
        print("Error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Product",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.yellow),
            onPressed: () {},
          ),
        ],
      ),
      body: product.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: product.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Productview(product: product[index]),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product[index]['images'][0] ?? '',
                          height: 150,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product[index]['title'] ?? 'No Title',
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product[index]['description'] ?? 'No Description',
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                "ID: ${product[index]['id']?.toString() ?? 'N/A'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Discount: ${product[index]['discountPercentage']?.toString() ?? 'N/A'}%",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Rating: ${product[index]['rating']?.toString() ?? 'N/A'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Stock: ${product[index]['stock']?.toString() ?? 'N/A'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Tags: ${product[index]['tags']?.join(', ') ?? 'No Tags'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Brand: ${product[index]['brand'] ?? 'No Brand'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "SKU: ${product[index]['sku'] ?? 'No SKU'}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                "\$${product[index]['price']?.toString() ?? 'No Price'}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                            ],
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
