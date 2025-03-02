import 'dart:async';

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  String _currentMode = 'Normal';
  final _modeController = StreamController<String>.broadcast();
  final _volumeController = StreamController<double>.broadcast();

  double _volume = 0.5;
  Map<String, Map<String, double>> _equalizerSettings = {};

  Stream<String> get modeStream => _modeController.stream;
  Stream<double> get volumeStream => _volumeController.stream;

  Future<void> setMode(String mode) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _currentMode = mode;
    _modeController.add(mode);
  }

  Future<void> setVolume(double volume) async {
    _volume = volume.clamp(0.0, 1.0);
    _volumeController.add(_volume);
  }

  Future<void> updateEqualizerBand(String band, double value) async {
    if (!_equalizerSettings.containsKey(_currentMode)) {
      _equalizerSettings[_currentMode] = {};
    }
    _equalizerSettings[_currentMode]![band] = value;
  }

  Map<String, double> getEqualizerSettings() {
    return _equalizerSettings[_currentMode] ?? {};
  }

  void dispose() {
    _modeController.close();
    _volumeController.close();
  }
}
