import 'package:flutter/material.dart';

class PalindromeModel extends ChangeNotifier {
  String _name = '';
  String _sentence = '';
  String _selectedUserName = ''; 

  String get name => _name;
  String get sentence => _sentence;
  String get selectedUserName => _selectedUserName;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set sentence(String value) {
    _sentence = value;
    notifyListeners();
  }

  set selectedUserName(String value) {
    _selectedUserName = value;
    notifyListeners();
  }

  bool isPalindrome(String text) {
    String normalizedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = normalizedText.split('').reversed.join('');
    return normalizedText == reversedText;
  }
}
