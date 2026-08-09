import 'package:flutter/material.dart';

class JobsPage extends StatelessWidget {
  const JobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jobs',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
              ),
              if (!isMobile)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Create Job'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Tabs (Scrollable on mobile)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTab('Today', true),
                _buildTab('Upcoming', false),
                _buildTab('Completed', false),
                _buildTab('Cancelled', false),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Table / List
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 8 : 20),
                child: isMobile 
                  ? _buildJobsList()
                  : Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(child: Text('Job ID', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 2, child: Text('Customer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 1, child: Text('Service', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 1, child: Text('Technician', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 1, child: Text('Date', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 1, child: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(flex: 1, child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          ],
                        ),
                        const Divider(height: 32),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildJobRow('SF-1024', 'Raj Kumar', 'AC Repair', 'Amit', '08 Aug', '₹1,600', 'In Progress', Colors.orange),
                              _buildJobRow('SF-1023', 'Amit Singh', 'AC Gas', 'Ravi', '08 Aug', '₹2,500', 'Assigned', Colors.blue),
                              _buildJobRow('SF-1022', 'Neha Sharma', 'Installation', 'Mohit', '07 Aug', '₹1,200', 'Completed', Colors.green),
                            ],
                          ),
                        ),
                      ],
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (val) {},
        selectedColor: const Color(0xFF2563EB).withOpacity(0.1),
        labelStyle: TextStyle(
          color: isSelected ? const Color(0xFF2563EB) : Colors.black54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildJobRow(String id, String customer, String service, String tech, String date, String amount, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Text(id, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB)))),
          Expanded(flex: 2, child: Text(customer, style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(flex: 1, child: Text(service)),
          Expanded(flex: 1, child: Text(tech)),
          Expanded(flex: 1, child: Text(date)),
          Expanded(flex: 1, child: Text(amount)),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
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
      ),
    );
  }

  Widget _buildJobsList() {
    final jobs = [
      ('SF-1024', 'Raj Kumar', 'AC Repair', 'Amit', '08 Aug', '₹1,600', 'In Progress', Colors.orange),
      ('SF-1023', 'Amit Singh', 'AC Gas', 'Ravi', '08 Aug', '₹2,500', 'Assigned', Colors.blue),
      ('SF-1022', 'Neha Sharma', 'Installation', 'Mohit', '07 Aug', '₹1,200', 'Completed', Colors.green),
    ];

    return ListView.separated(
      itemCount: jobs.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final job = jobs[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(job.$2, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(job.$6, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text('${job.$1} • ${job.$3}'),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.person, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(job.$4, style: const TextStyle(fontSize: 12)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: job.$8.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      job.$7,
                      style: TextStyle(color: job.$8, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
