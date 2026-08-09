import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payments',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Today\'s Collection: ₹48,500',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 16 : 18,
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPeriodChip('Today', true),
                    _buildPeriodChip('This Week', false),
                    _buildPeriodChip('This Month', false),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 20),
                child: Column(
                  children: [
                    if (!isMobile)
                      const Row(
                        children: [
                          Expanded(flex: 2, child: Text('Customer', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          Expanded(child: Text('Invoice', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          Expanded(child: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          Expanded(child: Text('Method', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          Expanded(child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                        ],
                      ),
                    if (!isMobile) const Divider(height: 32),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildPaymentItem(context, 'Raj Kumar', 'INV1024', '₹1,600', 'UPI', 'Paid', Colors.green, isMobile),
                          if (isMobile) const Divider(),
                          _buildPaymentItem(context, 'Amit Singh', 'INV1025', '₹2,500', 'Cash', 'Paid', Colors.green, isMobile),
                          if (isMobile) const Divider(),
                          _buildPaymentItem(context, 'Neha Sharma', 'INV1026', '₹800', 'UPI', 'Partial', Colors.orange, isMobile),
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

  Widget _buildPeriodChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: ChoiceChip(
        label: Text(label, style: const TextStyle(fontSize: 12)),
        selected: isSelected,
        onSelected: (v) {},
        selectedColor: Colors.blue.withOpacity(0.1),
        labelStyle: TextStyle(color: isSelected ? Colors.blue : Colors.black87),
      ),
    );
  }

  Widget _buildPaymentItem(BuildContext context, String name, String inv, String amount, String method, String status, Color color, bool isMobile) {
    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(inv, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.payment, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(method, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(child: Text(inv)),
          Expanded(child: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(method)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
              child: Text(status, textAlign: TextAlign.center, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
