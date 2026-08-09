import 'package:flutter/material.dart';

class TechJobDetailsPage extends StatefulWidget {
  const TechJobDetailsPage({super.key});

  @override
  State<TechJobDetailsPage> createState() => _TechJobDetailsPageState();
}

class _TechJobDetailsPageState extends State<TechJobDetailsPage> {
  String _jobStatus = 'Assigned'; // Assigned -> Traveling -> InProgress -> Completed

  void _updateStatus(String newStatus) {
    setState(() => _jobStatus = newStatus);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Status updated to $newStatus')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job #SF-1024')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Raj Kumar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('AC Repair', style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),
            
            _buildInfoTile(Icons.warning_amber_rounded, 'Problem', 'AC not cooling'),
            _buildInfoTile(Icons.location_on_outlined, 'Address', 'ABC Colony, Gorakhpur'),
            _buildInfoTile(Icons.access_time, 'Scheduled', '10:00 AM Today'),
            
            const SizedBox(height: 32),
            
            if (_jobStatus == 'Assigned') ...[
              _buildActionButton('Accept Job', Colors.green, () => _updateStatus('Accepted')),
            ] else if (_jobStatus == 'Accepted') ...[
              Row(
                children: [
                  Expanded(child: _buildActionButton('Call Customer', Colors.blue, () {}, icon: Icons.phone)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildActionButton('Navigate', Colors.orange, () {}, icon: Icons.directions)),
                ],
              ),
              const SizedBox(height: 16),
              _buildActionButton('Start Travel', Colors.blue, () => _updateStatus('Traveling')),
            ] else if (_jobStatus == 'Traveling') ...[
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 12),
                      Text('Traveling to location...', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              _buildActionButton('Check In / Arrived', Colors.green, () => _updateStatus('InProgress')),
            ] else if (_jobStatus == 'InProgress') ...[
              _buildServiceExecution(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, Color color, VoidCallback onPressed, {IconData? icon}) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
        label: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildServiceExecution() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Service Checklist', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _buildCheckItem('Check Power Supply'),
        _buildCheckItem('Clean AC Filter'),
        _buildCheckItem('Check Gas Pressure'),
        _buildCheckItem('Test Cooling Performance'),
        const SizedBox(height: 24),
        const Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
        const TextField(decoration: InputDecoration(hintText: 'Technician notes...')),
        const SizedBox(height: 24),
        _buildActionButton('Add Before/After Photos', Colors.grey.shade800, () {}, icon: Icons.camera_alt),
        const SizedBox(height: 32),
        _buildActionButton('Complete Job & Collect Payment', Colors.green, () {}),
      ],
    );
  }

  Widget _buildCheckItem(String label) {
    return CheckboxListTile(
      title: Text(label),
      value: false,
      onChanged: (v) {},
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
    );
  }
}
