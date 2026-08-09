import 'package:flutter/material.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 12 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Customers',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
              ),
              if (!isMobile)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Customer'),
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

          // Search and Filters (Responsive)
          if (isMobile)
            Column(
              children: [
                _buildSearchField(),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterDropdown('Service'),
                      const SizedBox(width: 8),
                      _buildFilterDropdown('Location'),
                      const SizedBox(width: 8),
                      _buildFilterDropdown('Status'),
                    ],
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(flex: 2, child: _buildSearchField()),
                const SizedBox(width: 16),
                _buildFilterDropdown('Service'),
                const SizedBox(width: 12),
                _buildFilterDropdown('Location'),
                const SizedBox(width: 12),
                _buildFilterDropdown('Payment Status'),
              ],
            ),
          const SizedBox(height: 24),

          // Customers Table / List
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 8 : 20),
                child: isMobile 
                  ? _buildCustomersList()
                  : Column(
                      children: [
                        _buildTableHeader(),
                        const Divider(),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildCustomerRow('Raj Kumar', '98xxxxxx21', '5', '₹8,500', 'Active', Colors.green),
                              _buildCustomerRow('Amit Singh', '97xxxxxx45', '2', '₹2,400', 'Active', Colors.green),
                              _buildCustomerRow('Neha Sharma', '96xxxxxx88', '7', '₹14,200', 'Active', Colors.green),
                              _buildCustomerRow('Suresh Raina', '99xxxxxx12', '1', '₹1,200', 'Inactive', Colors.grey),
                              _buildCustomerRow('Hardik P.', '91xxxxxx00', '12', '₹45,000', 'Active', Colors.green),
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

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search customers...',
        prefixIcon: const Icon(Icons.search, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      ),
    );
  }

  Widget _buildFilterDropdown(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(label, style: const TextStyle(fontSize: 12)),
          items: [],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(flex: 1, child: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(flex: 1, child: Text('Total Jobs', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(flex: 1, child: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          Expanded(flex: 1, child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
          SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildCustomerRow(String name, String phone, String jobs, String amount, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.blue.shade50,
                  child: Text(name[0], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Expanded(flex: 1, child: Text(phone)),
          Expanded(flex: 1, child: Text(jobs)),
          Expanded(flex: 1, child: Text(amount)),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                ),
                const SizedBox(width: 8),
                Text(status, style: TextStyle(color: statusColor, fontSize: 13, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildCustomersList() {
    final customers = [
      ('Raj Kumar', '98xxxxxx21', '5', '₹8,500', 'Active', Colors.green),
      ('Amit Singh', '97xxxxxx45', '2', '₹2,400', 'Active', Colors.green),
      ('Neha Sharma', '96xxxxxx88', '7', '₹14,200', 'Active', Colors.green),
      ('Suresh Raina', '99xxxxxx12', '1', '₹1,200', 'Inactive', Colors.grey),
    ];

    return ListView.separated(
      itemCount: customers.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final customer = customers[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            child: Text(customer.$1[0], style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
          title: Text(customer.$1, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(customer.$2),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(customer.$4, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
              Text('${customer.$3} Jobs', style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        );
      },
    );
  }
}
