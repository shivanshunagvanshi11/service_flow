import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning, Raj 👋',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF0F172A),
                        ),
                  ),
                  const SizedBox(height: 4),
                  const Text('Here\'s what\'s happening with your business today.'),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('New Job'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // KPI Cards Grid
          const Row(
            children: [
              Expanded(child: _KPICard(title: 'Jobs Today', value: '24', color: Colors.blue, icon: Icons.calendar_today)),
              SizedBox(width: 20),
              Expanded(child: _KPICard(title: 'Pending', value: '6', color: Colors.orange, icon: Icons.pending_actions)),
              SizedBox(width: 20),
              Expanded(child: _KPICard(title: 'Completed', value: '18', color: Colors.green, icon: Icons.check_circle_outline)),
              SizedBox(width: 20),
              Expanded(child: _KPICard(title: 'Revenue', value: '₹28,500', color: Colors.purple, icon: Icons.currency_rupee)),
            ],
          ),
          const SizedBox(height: 32),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column: Today's Jobs & Revenue Chart
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildSectionCard(
                      title: 'Today\'s Jobs',
                      child: _buildJobsTable(),
                      action: TextButton(onPressed: () {}, child: const Text('View All')),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionCard(
                      title: 'Revenue Trends',
                      child: _buildRevenueChart(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              // Right Column: Technician Status & Alerts
              Expanded(
                child: Column(
                  children: [
                    _buildSectionCard(
                      title: 'Technician Status',
                      child: _buildTechnicianList(),
                    ),
                    const SizedBox(height: 24),
                    _buildSectionCard(
                      title: 'Alerts & Notifications',
                      child: _buildAlertsList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child, Widget? action}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                ),
                if (action != null) action,
              ],
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildJobsTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1.5),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1),
      },
      children: [
        const TableRow(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Customer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
            Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Technician', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
            Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Service', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
            Padding(padding: EdgeInsets.only(bottom: 12), child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          ],
        ),
        _buildJobRow('Raj Kumar', 'Amit', 'AC Repair', 'Assigned', Colors.blue),
        _buildJobRow('Amit Singh', 'Ravi', 'AC Gas Refill', 'In Progress', Colors.orange),
        _buildJobRow('Neha Sharma', 'Mohit', 'Installation', 'Completed', Colors.green),
        _buildJobRow('Suresh Raina', 'Rahul', 'Maintenance', 'Traveling', Colors.amber),
      ],
    );
  }

  TableRow _buildJobRow(String name, String tech, String service, String status, Color color) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(tech)),
        Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(service)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRevenueChart() {
    return SizedBox(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBar('Mon', 0.4),
          _buildBar('Tue', 0.6),
          _buildBar('Wed', 0.8),
          _buildBar('Thu', 1.0),
          _buildBar('Fri', 0.7),
          _buildBar('Sat', 0.5),
          _buildBar('Sun', 0.3),
        ],
      ),
    );
  }

  Widget _buildBar(String day, double factor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: 150 * factor,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildTechnicianList() {
    return Column(
      children: [
        _buildTechItem('Amit', 'On Job', Colors.green),
        _buildTechItem('Ravi', 'Available', Colors.green),
        _buildTechItem('Mohit', 'Offline', Colors.red),
        _buildTechItem('Rahul', 'Traveling', Colors.amber),
      ],
    );
  }

  Widget _buildTechItem(String name, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue.shade50,
            child: Text(name[0], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildAlertsList() {
    return Column(
      children: [
        _buildAlertItem('3 jobs pending approval', Icons.pending_actions, Colors.orange),
        _buildAlertItem('2 warranties expiring soon', Icons.verified_user_outlined, Colors.blue),
        _buildAlertItem('₹12,500 payment pending', Icons.payments_outlined, Colors.red),
        _buildAlertItem('Low stock: AC filters (2 left)', Icons.inventory_2_outlined, Colors.amber),
      ],
    );
  }

  Widget _buildAlertItem(String message, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _KPICard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _KPICard({required this.title, required this.value, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
