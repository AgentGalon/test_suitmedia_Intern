import 'package:flutter/material.dart';

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
}
