import 'package:flutter/material.dart';

import 'package:test_suitmedia_intern/view/home_screen.dart';

class LoginViewModel {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  void dispose() {
    usernameController.dispose();
    palindromeController.dispose();
  }

  bool isPalindrome(String text) {
    // Untuk Menghilangkan spasi dan menjadikan huruf kecil
    String processedText = text.replaceAll(' ', '').toLowerCase();
    String reversed = processedText.split('').reversed.join('');
    return processedText == reversed;
  }

  void checkPalindrome(BuildContext context) {
    String text = usernameController.text;
    if (text.isNotEmpty) {
      if (isPalindrome(text)) {
        palindromeController.text = 'isPalindrome';
      } else {
        palindromeController.text = 'NotPalindrome';
      }
    } else {
      palindromeController.text = 'Please Enter a Name';
    }
  }

  void navigateToHomeScreen(BuildContext context) {
    final username = usernameController.text;
    if (username.isEmpty) {
      // Tampilan jika nama kosong
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Input Error'),
            content: const Text('Please enter a name before proceeding.'),
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
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(username: username),
        ),
      );
    }
  }
}
