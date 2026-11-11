import 'package:flutter/material.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data yang dikirim dari CheckoutScreen
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    
    // PERBAIKAN 1: Memastikan cart dibaca sebagai List of Maps yang benar
    final rawCart = args?['cart'] as List? ?? [];
    final cart = rawCart.map((item) => item as Map<String, dynamic>).toList();
    final total = args?['total'] as double? ?? 0.0;
    
    // PERBAIKAN 2: Menerima tipe data PaymentMethod (enum) lalu mengubahnya ke String
    final rawPayment = args?['paymentMethod'];
    final paymentMethod = rawPayment != null 
        ? rawPayment.toString().split('.').last.toUpperCase() 
        : 'CASH';

    // Format tanggal sederhana
    final date = DateTime.now();
    final dateString = "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Warna biru gelap navy
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 80),
                  const SizedBox(height: 16),
                  const Text(
                    "Payment Successful!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Date: $dateString",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Text(
                    "Method: $paymentMethod",
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const Divider(height: 40, thickness: 2),
                  const Text(
                    "Items:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    children: cart.map((item) {
                      final product = item['product'] as Map<String, dynamic>;
                      final qty = item['quantity'] as int;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${product['name']} (x$qty)",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Text(
                              "\$${product['price'] * qty}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const Divider(height: 40, thickness: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TOTAL",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        "\$$total",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: const BorderSide(color: Color(0xFF0F172A)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}