import 'dart:async';

class BluetoothService {
  static final BluetoothService _instance = BluetoothService._internal();
  factory BluetoothService() => _instance;
  BluetoothService._internal();

  bool _isConnected = false;
  final _connectionController = StreamController<bool>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;
  bool get isConnected => _isConnected;

  Future<bool> connect() async {
    await Future.delayed(const Duration(seconds: 2));
    _isConnected = true;
    _connectionController.add(_isConnected);
    return _isConnected;
  }

  Future<bool> disconnect() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _isConnected = false;
    _connectionController.add(_isConnected);
    return true;
  }

  Future<List<Map<String, dynamic>>> scanDevices() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {'id': 'device1', 'name': 'Solana Earphone Left', 'rssi': -65},
      {'id': 'device2', 'name': 'Solana Earphone Right', 'rssi': -67},
    ];
  }

  void dispose() {
    _connectionController.close();
  }
}
