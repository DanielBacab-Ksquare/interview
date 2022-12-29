import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  dynamic product;
  Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serie Details"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(product["product"]['image']['medium']),
            const SizedBox(height: 15),
            Text(product["product"]['name'],
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w800)),
            const SizedBox(height: 60),
            Text('Language: ${product["product"]['language']}',
                style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Text('Genres: ${product["product"]['genres'].join(', ')}',
                style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
