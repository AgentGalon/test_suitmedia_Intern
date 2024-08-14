import 'package:flutter/foundation.dart';

import 'package:test_suitmedia_intern/models/user_data.dart';
import 'package:test_suitmedia_intern/viewmodel/service/api_user.dart';

class ApiUserProvider extends ChangeNotifier {
  final ApiUserService _apiService = ApiUserService();
  List<Datum>? _userData;
  String? _errorMessage;
  bool _isLoading = false;

  List<Datum>? get userData => _userData;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void fetchUserData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _userData = await _apiService.fetchUserData();
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
