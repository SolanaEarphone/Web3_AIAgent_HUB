import 'dart:async';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final _authStateController = StreamController<bool>.broadcast();
  bool _isAuthenticated = false;

  Stream<bool> get authStateStream => _authStateController.stream;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> signIn(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      _isAuthenticated = true;
      _authStateController.add(_isAuthenticated);
      return true;
    } catch (e) {
      _isAuthenticated = false;
      _authStateController.add(_isAuthenticated);
      return false;
    }
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      _isAuthenticated = true;
      _authStateController.add(_isAuthenticated);
      return true;
    } catch (e) {
      _isAuthenticated = false;
      _authStateController.add(_isAuthenticated);
      return false;
    }
  }

  Future<void> signOut() async {
    _isAuthenticated = false;
    _authStateController.add(_isAuthenticated);
  }

  void dispose() {
    _authStateController.close();
  }
}
