import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('JOB #SF-1024'),
        actions: [
          IconButton(icon: const Icon(Icons.share_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Side: Job Info
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderCard(),
                  const SizedBox(height: 24),
                  _buildStatusTimeline(),
                  const SizedBox(height: 24),
                  _buildJobDetailsCard(),
                  const SizedBox(height: 24),
                  _buildPartsCard(),
                ],
              ),
            ),
          ),
          
          // Right Side: Summary & Actions
          Container(
            width: 350,
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(left: BorderSide(color: Color(0xFFE2E8F0))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Payment Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 24),
                _buildPaymentSummary(),
                const Spacer(),
                const Divider(),
                const SizedBox(height: 24),
                _buildActionButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('AC Repair', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Chip(label: Text('High Priority'), backgroundColor: Colors.redAccent, labelStyle: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildInfoItem(Icons.person_outline, 'Customer', 'Raj Kumar\n98XXXXXXXX'),
                const SizedBox(width: 48),
                _buildInfoItem(Icons.engineering_outlined, 'Technician', 'Amit'),
                const SizedBox(width: 48),
                _buildInfoItem(Icons.calendar_today_outlined, 'Scheduled', '08 Aug, 10:00 AM'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusTimeline() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Status Timeline', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _buildStep(true, 'Job Created', '08 Aug, 09:00 AM'),
            _buildLine(true),
            _buildStep(true, 'Technician Assigned', '08 Aug, 09:15 AM'),
            _buildLine(true),
            _buildStep(true, 'Technician Accepted', '08 Aug, 09:20 AM'),
            _buildLine(true),
            _buildStep(true, 'Traveling', '08 Aug, 09:45 AM'),
            _buildLine(false),
            _buildStep(false, 'In Progress', 'Current Status'),
            _buildLine(false),
            _buildStep(false, 'Completed', '-'),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(bool isDone, String title, String subtitle) {
    return Row(
      children: [
        Icon(
          isDone ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isDone ? Colors.green : Colors.grey,
          size: 20,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: isDone ? FontWeight.bold : FontWeight.normal)),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget _buildLine(bool isDone) {
    return Container(
      margin: const EdgeInsets.only(left: 9),
      width: 2,
      height: 20,
      color: isDone ? Colors.green : Colors.grey.shade300,
    );
  }

  Widget _buildJobDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Problem', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('AC not cooling.'),
            const SizedBox(height: 24),
            const Text('Technician Notes', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Filter blocked and gas pressure low.', style: TextStyle(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildPartsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Parts & Services', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPartItem('AC Filter', '₹300'),
            _buildPartItem('Gas Refill', '₹800'),
            _buildPartItem('Service Charge', '₹500'),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const Text('₹1,600', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF2563EB))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartItem(String name, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(price, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      children: [
        _buildPaymentRow('Total Amount', '₹1,600', isBold: true),
        const SizedBox(height: 12),
        _buildPaymentRow('Paid', '₹1,000', color: Colors.green),
        const SizedBox(height: 12),
        _buildPaymentRow('Remaining', '₹600', color: Colors.red, isBold: true),
      ],
    );
  }

  Widget _buildPaymentRow(String label, String value, {bool isBold = false, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: color)),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        _actionButton('Assign Technician', Icons.person_add_outlined, Colors.blue),
        _actionButton('Reschedule', Icons.calendar_month_outlined, Colors.blue),
        _actionButton('Collect Payment', Icons.payments_outlined, Colors.green),
        _actionButton('Generate Invoice', Icons.receipt_outlined, Colors.blue),
        const SizedBox(height: 12),
        _actionButton('Cancel Job', Icons.cancel_outlined, Colors.red, isOutlined: true),
      ],
    );
  }

  Widget _actionButton(String label, IconData icon, Color color, {bool isOutlined = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: isOutlined
            ? OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(icon, size: 20),
                label: Text(label),
                style: OutlinedButton.styleFrom(foregroundColor: color, side: BorderSide(color: color)),
              )
            : ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(icon, size: 20),
                label: Text(label),
                style: ElevatedButton.styleFrom(backgroundColor: color, foregroundColor: Colors.white),
              ),
      ),
    );
  }
}
