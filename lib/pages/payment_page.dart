import 'package:flutter/material.dart';
import 'package:ecommerce_app/components/my_text_field.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Hãy nhập thông tin cá nhân của bạn',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          MyTextField(controller: nameController, text: 'Name'),
          const SizedBox(height: 20),
          MyTextField(controller: emailController, text: 'Email'),
          const SizedBox(height: 20),
          MyTextField(controller: phoneController, text: 'Phone'),
          const SizedBox(height: 20),
          MyTextField(controller: addressController, text: 'Address'),
          const SizedBox(height: 20),

          // Display the total price
          // Text(
          //   'Total Price: \$${totalPrice.toStringAsFixed(2)}',
          //   style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              _handleSubmit(context);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // Text color
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty) {
      _showErrorDialog(context, 'Bạn cần điền đầy đủ thông tin');
    } else {
      _showConfirmationDialog(context);
    }
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Đơn hàng của bạn đã được xác nhận'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
