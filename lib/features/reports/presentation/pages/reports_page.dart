import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              Text(
                'Business Reports',
                style: TextStyle(
                  fontSize: isMobile ? 24 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download),
                label: const Text('Export Data'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          
          // Analytics Grid / List
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              // Adjust aspect ratio based on content and screen width
              childAspectRatio: isMobile ? 1.4 : 1.6,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildReportCard(
                  'Job Performance',
                  [
                    _buildReportItem('Total Jobs', '482'),
                    _buildReportItem('Completed', '421', color: Colors.green),
                    _buildReportItem('Cancelled', '21', color: Colors.red),
                    _buildReportItem('Pending', '40', color: Colors.orange),
                  ],
                );
              } else if (index == 1) {
                return _buildReportCard(
                  'Revenue by Service',
                  [
                    _buildReportItem('AC Repair', '₹1.84L'),
                    _buildReportItem('AC Installation', '₹72K'),
                    _buildReportItem('AC Cleaning', '₹91K'),
                    _buildReportItem('Gas Refill', '₹54K'),
                  ],
                );
              } else if (index == 2) {
                return _buildReportCard(
                  'Payment Methods',
                  [
                    _buildReportItem('UPI', '₹2.1L', color: Colors.blue),
                    _buildReportItem('Cash', '₹1.4L', color: Colors.green),
                    _buildReportItem('Card', '₹80K', color: Colors.orange),
                    _buildReportItem('Pending', '₹35K', color: Colors.red),
                  ],
                );
              } else {
                return _buildReportCard(
                  'Top Technicians',
                  [
                    _buildReportItem('Amit Kumar', '102 Jobs'),
                    _buildReportItem('Ravi Singh', '94 Jobs'),
                    _buildReportItem('Mohit Sharma', '81 Jobs'),
                    _buildReportItem('Rahul V.', '72 Jobs'),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard(String title, List<Widget> items) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Added to prevent internal expansion
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget _buildReportItem(String label, String value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
