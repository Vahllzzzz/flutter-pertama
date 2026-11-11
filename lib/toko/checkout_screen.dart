import 'package:flutter/material.dart';
import 'home_screen.dart'; 
import '../routes/app_routes.dart';

enum PaymentMethod { cash, transfer }

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentMethod _paymentMethod = PaymentMethod.transfer;

  void _processPayment() {
    if (globalCart.isEmpty) return;

    double total = 0.0;
    for (var item in globalCart) {
      double price = item['product']['price'] as double;
      int quantity = item['quantity'] as int;
      total += (price * quantity);
    }

    final orderItems = List<Map<String, dynamic>>.from(globalCart);
    final orderTotal = total;
    final method = _paymentMethod;

    setState(() {
      globalCart.clear();
    });

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.receiptScreen,
      arguments: {
        'items': orderItems,
        'total': orderTotal,
        'paymentMethod': method,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double total = 0.0;
    for (var item in globalCart) {
      double price = item['product']['price'] as double;
      int quantity = item['quantity'] as int;
      total += (price * quantity);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: globalCart.isEmpty
          ? const Center(child: Text('Keranjang belanja kosong.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: globalCart.length,
                    itemBuilder: (context, index) {
                      final cartItem = globalCart[index];
                      final product = cartItem['product'] as Map<String, dynamic>;
                      final quantity = cartItem['quantity'] as int;

                      return ListTile(
                        leading: Icon(product['icon'] as IconData, color: product['color'] as Color),
                        title: Text(product['name'] as String),
                        subtitle: Text('\$${(product['price'] as double).toStringAsFixed(2)} x $quantity'),
                        trailing: Text('\$${((product['price'] as double) * quantity).toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, -5))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Method', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      RadioListTile<PaymentMethod>(
                        title: const Text('Bank Transfer'),
                        value: PaymentMethod.transfer,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() { _paymentMethod = value!; });
                        },
                      ),
                      RadioListTile<PaymentMethod>(
                        title: const Text('Cash on Delivery'),
                        value: PaymentMethod.cash,
                        groupValue: _paymentMethod,
                        onChanged: (PaymentMethod? value) {
                          setState(() { _paymentMethod = value!; });
                        },
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _processPayment,
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00155C), foregroundColor: Colors.white),
                          child: const Text('PAY NOW', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}