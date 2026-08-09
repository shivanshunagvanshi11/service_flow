import 'package:flutter/material.dart';

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({super.key});

  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Customer Details'),
        actions: [
          IconButton(icon: const Icon(Icons.edit_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Customer Profile Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xFF2563EB),
                  child: Text('RK', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Raj Kumar',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          const Text('98XXXXXXXX', style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 24),
                          const Icon(Icons.location_on, size: 16, color: Colors.grey),
                          const SizedBox(width: 8),
                          const Text('Gorakhpur, UP', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('New Job'),
                ),
              ],
            ),
          ),
          
          // Tabs
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: const Color(0xFF2563EB),
              unselectedLabelColor: Colors.grey,
              indicatorColor: const Color(0xFF2563EB),
              tabs: const [
                Tab(text: 'Overview'),
                Tab(text: 'Jobs'),
                Tab(text: 'Invoices'),
                Tab(text: 'Payments'),
                Tab(text: 'Equipment'),
                Tab(text: 'Warranty'),
                Tab(text: 'Notes'),
              ],
            ),
          ),
          
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverviewTab(),
                const Center(child: Text('Jobs')),
                const Center(child: Text('Invoices')),
                const Center(child: Text('Payments')),
                const Center(child: Text('Equipment')),
                const Center(child: Text('Warranty')),
                const Center(child: Text('Notes')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // KPI Grid
          const Row(
            children: [
              Expanded(child: _MiniKPICard(label: 'Total Jobs', value: '8')),
              SizedBox(width: 16),
              Expanded(child: _MiniKPICard(label: 'Total Spent', value: '₹14,500')),
              SizedBox(width: 16),
              Expanded(child: _MiniKPICard(label: 'Pending', value: '₹2,000', color: Colors.red)),
              SizedBox(width: 16),
              Expanded(child: _MiniKPICard(label: 'Last Service', value: '05 Aug')),
            ],
          ),
          const SizedBox(height: 32),
          
          const Text('Service History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          Card(
            child: Column(
              children: [
                _buildHistoryItem('05 Aug', 'AC Repair', '₹1,200', 'Completed', Colors.green),
                const Divider(height: 1),
                _buildHistoryItem('20 Jun', 'AC Cleaning', '₹800', 'Completed', Colors.green),
                const Divider(height: 1),
                _buildHistoryItem('10 Apr', 'AC Gas Refill', '₹2,500', 'Completed', Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String date, String service, String amount, String status, Color color) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date.split(' ')[0], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(date.split(' ')[1], style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      title: Text(service, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(amount),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class _MiniKPICard extends StatelessWidget {
  final String label;
  final String value;
  final Color? color;
  const _MiniKPICard({required this.label, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}
