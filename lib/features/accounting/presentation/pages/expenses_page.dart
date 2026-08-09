import 'package:flutter/material.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Expenses', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Expense'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2563EB), foregroundColor: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Card(
              child: ListView(
                children: [
                  _buildExpenseItem('08 Aug', 'Fuel', 'Amit', '₹500', Icons.local_gas_station),
                  const Divider(height: 1),
                  _buildExpenseItem('08 Aug', 'Parts Purchase', 'ABC Supplier', '₹12,500', Icons.shopping_cart),
                  const Divider(height: 1),
                  _buildExpenseItem('07 Aug', 'Rent', 'Office', '₹15,000', Icons.home),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpenseItem(String date, String category, String reference, String amount, IconData icon) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: Colors.red.shade50, child: Icon(icon, color: Colors.red, size: 20)),
      title: Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$date • $reference'),
      trailing: Text(amount, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red)),
    );
  }
}
