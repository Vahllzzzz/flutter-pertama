
import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

// Data produk statis
final List<Map<String, dynamic>> mockProducts = [
  {'id': '1', 'name': 'Alienware Gaming Desktop', 'price': 1999.00, 'icon': Icons.computer, 'color': Colors.blueGrey},
  {'id': '2', 'name': 'Apple Watch Series 8', 'price': 399.00, 'icon': Icons.watch, 'color': Colors.grey},
  {'id': '3', 'name': 'Wireless Headphones Max', 'price': 549.00, 'icon': Icons.headphones, 'color': Colors.redAccent},
  {'id': '4', 'name': 'Smartphone Pro 5G', 'price': 999.00, 'icon': Icons.phone_android, 'color': Colors.teal},
  {'id': '5', 'name': 'Gaming Console X', 'price': 499.00, 'icon': Icons.gamepad, 'color': Colors.black87},
  {'id': '6', 'name': 'Drone 4K Camera', 'price': 799.00, 'icon': Icons.airplanemode_active, 'color': Colors.orange},
];

// Keranjang belanja global
List<Map<String, dynamic>> globalCart = [];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _addToCart(Map<String, dynamic> product) {
    setState(() {
      int index = globalCart.indexWhere((item) => item['product']['id'] == product['id']);
      if (index != -1) {
        globalCart[index]['quantity'] = (globalCart[index]['quantity'] as int) + 1;
      } else {
        globalCart.add({'product': product, 'quantity': 1});
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product['name']} ditambahkan ke keranjang!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalItems = globalCart.fold(0, (sum, item) => sum + (item['quantity'] as int));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('eCommax', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.checkoutScreen).then((_) => setState(() {}));
                },
              ),
              if (totalItems > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '$totalItems',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Hero
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: const Color(0xFF00155C),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SPECIAL OFFER TODAY!', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('ALIENWARE GAMING\nDESKTOPS', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('STARTING AT \$1,999', style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                    child: const Text('SHOP NOW'),
                  )
                ],
              ),
            ),
            
            // Product Grid
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('NEW ARRIVALS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: mockProducts.length,
                itemBuilder: (context, index) {
                  final product = mockProducts[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Center(
                              child: Icon(product['icon'] as IconData, size: 64, color: product['color'] as Color),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(product['name'] as String, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('\$${(product['price'] as double).toStringAsFixed(2)}', style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _addToCart(product),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00155C),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Add to Cart'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
