import 'package:flutter/material.dart';

class TechnicianDetailsPage extends StatefulWidget {
  const TechnicianDetailsPage({super.key});

  @override
  State<TechnicianDetailsPage> createState() => _TechnicianDetailsPageState();
}

class _TechnicianDetailsPageState extends State<TechnicianDetailsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(title: const Text('Technician Details')),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
                const SizedBox(width: 24),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Amit Kumar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Senior AC Technician • 5 Years Exp.', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.edit), label: const Text('Edit')),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: const Color(0xFF2563EB),
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Jobs'),
                Tab(text: 'Performance'),
                Tab(text: 'Attendance'),
                Tab(text: 'Expenses'),
                Tab(text: 'Documents'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverview(),
                const Center(child: Text('Jobs List')),
                const Center(child: Text('Performance Analytics')),
                const Center(child: Text('Attendance Log')),
                const Center(child: Text('Expense Claims')),
                const Center(child: Text('KYC Documents')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildStatCard('Jobs Completed', '184', Icons.task_alt, Colors.green)),
              const SizedBox(width: 16),
              Expanded(child: _buildStatCard('Completion Rate', '94%', Icons.speed, Colors.blue)),
              const SizedBox(width: 16),
              Expanded(child: _buildStatCard('Average Rating', '4.8', Icons.star, Colors.orange)),
              const SizedBox(width: 16),
              Expanded(child: _buildStatCard('Revenue Generated', '₹4.2L', Icons.payments, Colors.purple)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
