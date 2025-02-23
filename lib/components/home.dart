import 'package:flutter/material.dart';

/// HomePage widget for the Solana Earphone app
/// Displays the main interface including battery status, audio modes,
/// and quick access to common features
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Simulated device connection status
  bool isConnected = true;

  // Battery levels for left earbud, right earbud, and charging case
  int leftBattery = 85;
  int rightBattery = 78;
  int caseBattery = 92;

  // Current audio mode selection
  String currentMode = "Normal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solana Earphone'),
        actions: [
          // Bluetooth connection status indicator and button
          IconButton(
            icon: Icon(isConnected ? Icons.bluetooth_connected : Icons.bluetooth),
            onPressed: () {
              // TODO: Implement bluetooth connection handling
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Device status card showing battery levels
              _buildDeviceStatusCard(),
              const SizedBox(height: 20),

              // Audio mode selection card
              _buildAudioModeCard(),
              const SizedBox(height: 20),

              // Quick actions card for common features
              _buildQuickActionsCard(),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the device status card showing battery levels
  Widget _buildDeviceStatusCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Device Status', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBatteryIndicator('Left', leftBattery),
                _buildBatteryIndicator('Right', rightBattery),
                _buildBatteryIndicator('Case', caseBattery),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a battery indicator widget with label and percentage
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

  /// Builds the audio mode selection card
  Widget _buildAudioModeCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Text('Audio Mode', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), const SizedBox(height: 16), _buildModeSelector()],
        ),
      ),
    );
  }

  /// Builds the mode selector list with different audio modes
  Widget _buildModeSelector() {
    return Column(
      children: [
        // Normal mode option
        ListTile(
          leading: const Icon(Icons.music_note),
          title: const Text('Normal Mode'),
          selected: currentMode == "Normal",
          onTap: () => setState(() => currentMode = "Normal"),
        ),
        // Active Noise Cancellation mode option
        ListTile(
          leading: const Icon(Icons.noise_aware),
          title: const Text('Noise Cancelling'),
          selected: currentMode == "ANC",
          onTap: () => setState(() => currentMode = "ANC"),
        ),
        // Transparency mode option
        ListTile(
          leading: const Icon(Icons.hearing),
          title: const Text('Transparency'),
          selected: currentMode == "Transparency",
          onTap: () => setState(() => currentMode = "Transparency"),
        ),
        // Voice Enhancement mode option
        ListTile(
          leading: const Icon(Icons.mic),
          title: const Text('Voice Enhancement'),
          selected: currentMode == "Voice",
          onTap: () => setState(() => currentMode = "Voice"),
        ),
      ],
    );
  }

  /// Builds the quick actions card with common features
  Widget _buildQuickActionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quick Actions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildQuickActions(),
          ],
        ),
      ),
    );
  }

  /// Builds the grid of quick action buttons
  Widget _buildQuickActions() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2.5,
      children: [
        // Equalizer settings button
        _buildActionButton(
          icon: Icons.equalizer,
          label: 'Equalizer',
          onTap: () {
            // TODO: Implement equalizer settings
          },
        ),
        // Touch control settings button
        _buildActionButton(
          icon: Icons.touch_app,
          label: 'Touch Controls',
          onTap: () {
            // TODO: Implement touch control settings
          },
        ),
        // Find my earbuds feature button
        _buildActionButton(
          icon: Icons.find_in_page,
          label: 'Find My Earbuds',
          onTap: () {
            // TODO: Implement find earbuds feature
          },
        ),
        // General settings button
        _buildActionButton(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {
            // TODO: Implement settings page navigation
          },
        ),
      ],
    );
  }

  /// Builds a single action button for the quick actions grid
  Widget _buildActionButton({required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 24), const SizedBox(height: 4), Text(label)]),
    );
  }
}
