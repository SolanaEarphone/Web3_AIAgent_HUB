import 'dart:async';

class DeviceStatusService {
  static final DeviceStatusService _instance = DeviceStatusService._internal();
  factory DeviceStatusService() => _instance;
  DeviceStatusService._internal();

  final _batteryController = StreamController<Map<String, int>>.broadcast();
  final _temperatureController = StreamController<Map<String, double>>.broadcast();
  Timer? _updateTimer;

  Stream<Map<String, int>> get batteryStream => _batteryController.stream;
  Stream<Map<String, double>> get temperatureStream => _temperatureController.stream;

  void startMonitoring() {
    _updateTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      _updateStatus();
    });
    _updateStatus();
  }

  Future<void> _updateStatus() async {
    final batteryLevels = {'left': 85, 'right': 78, 'case': 92};

    final temperatures = {'left': 37.5, 'right': 37.8, 'ambient': 25.0};

    _batteryController.add(batteryLevels);
    _temperatureController.add(temperatures);
  }

  Future<Map<String, dynamic>> getDeviceInfo() async {
    return {'firmwareVersion': '1.0.4', 'hardwareVersion': 'A1', 'serialNumber': 'SE2024XXXX', 'manufacturingDate': '2024-01-01'};
  }

  void stopMonitoring() {
    _updateTimer?.cancel();
  }

  void dispose() {
    stopMonitoring();
    _batteryController.close();
    _temperatureController.close();
  }
}
