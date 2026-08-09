import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inventory', style: TextStyle(fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.bold)),
                    if (!isMobile) const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildSummaryChip('Total: 248', Colors.blue, isMobile),
                          const SizedBox(width: 8),
                          _buildSummaryChip('Low: 12', Colors.orange, isMobile),
                          const SizedBox(width: 8),
                          _buildSummaryChip('Out: 3', Colors.red, isMobile),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Product'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Filters & Search
          if (isMobile)
            Column(
              children: [
                _buildSearchField(),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildFilterDropdown('Category')),
                    const SizedBox(width: 12),
                    Expanded(child: _buildFilterDropdown('Supplier')),
                  ],
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(child: _buildSearchField()),
                const SizedBox(width: 16),
                _buildFilterDropdown('Category'),
                const SizedBox(width: 12),
                _buildFilterDropdown('Supplier'),
              ],
            ),
          const SizedBox(height: 24),

          // Inventory Table / List
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 8 : 20),
                child: isMobile 
                  ? _buildInventoryList()
                  : Column(
                      children: [
                        const Row(
                          children: [
                            Expanded(flex: 2, child: Text('Product', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(child: Text('SKU', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(child: Text('Stock', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(child: Text('Min. Level', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                            Expanded(child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey))),
                          ],
                        ),
                        const Divider(height: 32),
                        Expanded(
                          child: ListView(
                            children: [
                              _buildInventoryRow('AC Filter', 'AC-F001', '18', '10', '₹300', 'In Stock', Colors.green),
                              _buildInventoryRow('Copper Pipe (10m)', 'CP-010', '5', '8', '₹1,200', 'Low Stock', Colors.orange),
                              _buildInventoryRow('RO Membrane', 'RO-M02', '0', '5', '₹850', 'Out of Stock', Colors.red),
                              _buildInventoryRow('AC Gas R32 (kg)', 'GAS-32', '12', '5', '₹800', 'In Stock', Colors.green),
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

  Widget _buildSummaryChip(String label, Color color, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: isMobile ? 4 : 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: isMobile ? 10 : 12),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search SKU...',
        prefixIcon: const Icon(Icons.search, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
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
          isExpanded: true,
          hint: Text(label, style: const TextStyle(fontSize: 12)),
          items: [],
          onChanged: (v) {},
        ),
      ),
    );
  }

  Widget _buildInventoryRow(String name, String sku, String stock, String min, String price, String status, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(name, style: const TextStyle(fontWeight: FontWeight.w600))),
          Expanded(child: Text(sku)),
          Expanded(child: Text(stock, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(min, style: const TextStyle(color: Colors.grey))),
          Expanded(child: Text(price)),
          Expanded(
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

  Widget _buildInventoryList() {
    final items = [
      ('AC Filter', 'AC-F001', '18', '10', '₹300', 'In Stock', Colors.green),
      ('Copper Pipe', 'CP-010', '5', '8', '₹1,200', 'Low Stock', Colors.orange),
      ('RO Membrane', 'RO-M02', '0', '5', '₹850', 'Out of Stock', Colors.red),
    ];

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(item.$1, style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('SKU: ${item.$2} • Price: ${item.$5}'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${item.$3}/${item.$4}', style: const TextStyle(fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: item.$7.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item.$6,
                  style: TextStyle(color: item.$7, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
