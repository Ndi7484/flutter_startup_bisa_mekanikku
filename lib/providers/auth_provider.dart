import 'package:flutter/material.dart';
import 'package:flutter_mekanikku/core/auth_repo.dart';
import 'package:flutter_mekanikku/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  UserModel? _loggedinUser;
  UserModel? get loggedinUser => _loggedinUser;

  Future<void> login(String username, String password) async {
    try {
      final user =
          await _authRepository.login(username: username, password: password);
      _loggedinUser = user;
      print(_loggedinUser);
    } catch (e) {
      print("Error : $e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> register(String name, String username, String password) async {
    try {
      final user = await _authRepository.register(
          username: username, password: password, name: name);
      _loggedinUser = user;
      print(_loggedinUser);
    } catch (e) {
      print("Error : $e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
      _loggedinUser = null;
    } catch (e) {
      print("Error : $e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> checkAccessToken() async {
    try {
      String? accessToken = await _secureStorage.read(key: 'access_token');

      if (accessToken != null) {
        final user = await _authRepository.reAuth();
        _loggedinUser = user;
      } else {
        _loggedinUser = null;
      }
    } catch (e) {
      print("Error : $e");
    }
  }
}
