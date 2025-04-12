import 'package:flutter/material.dart';

import '../utils/device_status_service.dart';

class MyDevicePage extends StatefulWidget {
  const MyDevicePage({super.key});

  @override
  State<MyDevicePage> createState() => _MyDevicePageState();
}

class _MyDevicePageState extends State<MyDevicePage> {
  final _deviceStatusService = DeviceStatusService();
  Map<String, int> _batteryLevels = {};
  Map<String, double> _temperatures = {};
  Map<String, dynamic> _deviceInfo = {};

  @override
  void initState() {
    super.initState();
    _deviceStatusService.startMonitoring();
    _loadDeviceInfo();
    _deviceStatusService.batteryStream.listen((levels) {
      setState(() {
        _batteryLevels = levels;
      });
    });
    _deviceStatusService.temperatureStream.listen((temps) {
      setState(() {
        _temperatures = temps;
      });
    });
  }

  Future<void> _loadDeviceInfo() async {
    final info = await _deviceStatusService.getDeviceInfo();
    setState(() {
      _deviceInfo = info;
    });
  }

  @override
  void dispose() {
    _deviceStatusService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Device'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeviceCard(),
            const SizedBox(height: 16),
            _buildBatteryStatus(),
            const SizedBox(height: 16),
            _buildTemperatureStatus(),
            const SizedBox(height: 16),
            _buildDeviceInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Icon(Icons.earbuds, size: 64),
            const SizedBox(height: 16),
            Text('Solana Earphone', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Connected', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Battery Status', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBatteryIndicator('Left', _batteryLevels['left'] ?? 0),
                _buildBatteryIndicator('Right', _batteryLevels['right'] ?? 0),
                _buildBatteryIndicator('Case', _batteryLevels['case'] ?? 0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBatteryIndicator(String label, int percentage) {
    return Column(
      children: [
        Icon(Icons.battery_full, size: 32, color: percentage > 20 ? Colors.green : Colors.red),
        const SizedBox(height: 8),
        Text(label),
        Text('$percentage%'),
      ],
    );
  }

  Widget _buildTemperatureStatus() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperature', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTemperatureIndicator('Left', _temperatures['left'] ?? 0.0),
                _buildTemperatureIndicator('Right', _temperatures['right'] ?? 0.0),
                _buildTemperatureIndicator('Ambient', _temperatures['ambient'] ?? 0.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTemperatureIndicator(String label, double temperature) {
    return Column(
      children: [
        Icon(Icons.thermostat, size: 32, color: temperature > 40 ? Colors.red : Colors.blue),
        const SizedBox(height: 8),
        Text(label),
        Text('${temperature.toStringAsFixed(1)}°C'),
      ],
    );
  }

  Widget _buildDeviceInfo() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Device Information', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildInfoRow('Firmware', _deviceInfo['firmwareVersion'] ?? 'N/A'),
            _buildInfoRow('Hardware', _deviceInfo['hardwareVersion'] ?? 'N/A'),
            _buildInfoRow('Serial Number', _deviceInfo['serialNumber'] ?? 'N/A'),
            _buildInfoRow('Manufacturing Date', _deviceInfo['manufacturingDate'] ?? 'N/A'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
