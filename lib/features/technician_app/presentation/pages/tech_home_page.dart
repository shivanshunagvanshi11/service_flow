import 'package:flutter/material.dart';

class TechHomePage extends StatelessWidget {
  const TechHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Good Morning Amit 👋'),
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: _buildSummaryCard('Today\'s Jobs', '5', Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Completed', '2', Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildSummaryCard('Pending', '3', Colors.orange)),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Next Job', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildJobCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, String value, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
            Text(label, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('10:00 AM', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                Text('2.5 km away', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const Divider(height: 24),
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text('Raj Kumar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('AC Repair • Gorakhpur'),
              trailing: Icon(Icons.ac_unit, color: Colors.blue),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.directions),
                    label: const Text('Navigate'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB), foregroundColor: Colors.white),
                    child: const Text('View Job'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
