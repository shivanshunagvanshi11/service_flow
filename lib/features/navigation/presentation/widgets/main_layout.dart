import 'package:flutter/material.dart';
import 'package:service_flow/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:service_flow/features/customers/presentation/pages/customers_page.dart';
import 'package:service_flow/features/jobs/presentation/pages/service_requests_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<(_NavItem, Widget)> _pages = [
    (const _NavItem(Icons.dashboard_rounded, 'Dashboard'), const DashboardPage()),
    (const _NavItem(Icons.people_rounded, 'Customers'), const CustomersPage()),
    (const _NavItem(Icons.assignment_rounded, 'Service Requests'), const ServiceRequestsPage()),
    (const _NavItem(Icons.work_rounded, 'Jobs'), const Center(child: Text('Jobs Page'))),
    (const _NavItem(Icons.calendar_month_rounded, 'Calendar'), const Center(child: Text('Calendar Page'))),
    (const _NavItem(Icons.engineering_rounded, 'Technicians'), const Center(child: Text('Technicians Page'))),
    (const _NavItem(Icons.receipt_long_rounded, 'Invoices'), const Center(child: Text('Invoices Page'))),
    (const _NavItem(Icons.settings_rounded, 'Settings'), const Center(child: Text('Settings Page'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 260,
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Icon(Icons.bolt_rounded, color: Colors.blue, size: 32),
                      SizedBox(width: 12),
                      Text(
                        'ServiceFlow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: ListView.builder(
                    itemCount: _pages.length,
                    itemBuilder: (context, index) {
                      final item = _pages[index].$1;
                      final isSelected = _selectedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        child: ListTile(
                          onTap: () => setState(() => _selectedIndex = index),
                          leading: Icon(
                            item.icon,
                            color: isSelected ? Colors.white : Colors.grey[400],
                            size: 20,
                          ),
                          title: Text(
                            item.title,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.grey[400],
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                          selected: isSelected,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          selectedTileColor: Colors.blue.withValues(alpha: 0.1),
                        ),
                      );
                    },
                  ),
                ),
                // User Profile at bottom
                const Divider(color: Colors.white12),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  title: const Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 14)),
                  subtitle: const Text('Admin', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  trailing: const Icon(Icons.logout, color: Colors.white70, size: 18),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top Header
                Container(
                  height: 64,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Text(
                        _pages[_selectedIndex].$1.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none_rounded),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('New Job'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                // Page Content
                Expanded(
                  child: _pages[_selectedIndex].$2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String title;
  const _NavItem(this.icon, this.title);
}
