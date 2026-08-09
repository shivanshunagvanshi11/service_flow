import 'package:flutter/material.dart';
import 'package:service_flow/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:service_flow/features/customers/presentation/pages/customers_page.dart';
import 'package:service_flow/features/jobs/presentation/pages/service_requests_page.dart';
import 'package:service_flow/features/jobs/presentation/pages/jobs_page.dart';
import 'package:service_flow/features/technicians/presentation/pages/technicians_page.dart';
import 'package:service_flow/features/accounting/presentation/pages/payments_page.dart';
import 'package:service_flow/features/accounting/presentation/pages/expenses_page.dart';
import 'package:service_flow/features/inventory/presentation/pages/inventory_page.dart';
import 'package:service_flow/features/reports/presentation/pages/reports_page.dart';
import 'package:service_flow/features/scheduling/presentation/pages/calendar_page.dart';
import 'package:service_flow/features/settings/presentation/pages/settings_page.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<(_NavItem, Widget)> _pages = [
    (const _NavItem(Icons.dashboard_rounded, 'Dashboard'), const DashboardPage()),
    (const _NavItem(Icons.people_rounded, 'Customers'), const CustomersPage()),
    (const _NavItem(Icons.assignment_rounded, 'Service Requests'), const ServiceRequestsPage()),
    (const _NavItem(Icons.work_rounded, 'Jobs'), const JobsPage()),
    (const _NavItem(Icons.calendar_month_rounded, 'Calendar'), const CalendarPage()),
    (const _NavItem(Icons.engineering_rounded, 'Technicians'), const TechniciansPage()),
    (const _NavItem(Icons.inventory_2_rounded, 'Inventory'), const InventoryPage()),
    (const _NavItem(Icons.payments_rounded, 'Payments'), const PaymentsPage()),
    (const _NavItem(Icons.receipt_long_rounded, 'Expenses'), const ExpensesPage()),
    (const _NavItem(Icons.bar_chart_rounded, 'Reports'), const ReportsPage()),
    (const _NavItem(Icons.settings_rounded, 'Settings'), const SettingsPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 1100;

    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile ? Drawer(child: _buildSidebar(context, true)) : null,
      body: Row(
        children: [
          // Sidebar (Visible only on Desktop)
          if (!isMobile)
            Container(
              width: 260,
              color: Theme.of(context).colorScheme.secondary,
              child: _buildSidebar(context, false),
            ),
          
          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Top Header
                Container(
                  color: Colors.white,
                  child: SafeArea(
                    bottom: false,
                    child: Container(
                      height: 64,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          if (isMobile)
                            Builder(
                              builder: (context) => IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () => Scaffold.of(context).openDrawer(),
                              ),
                            ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _pages[_selectedIndex].$1.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications_none_rounded, size: 20),
                          ),
                          const SizedBox(width: 8),
                          // Responsive Add Button
                          if (MediaQuery.of(context).size.width > 600)
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('New Job'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            )
                          else
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    ),
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

  Widget _buildSidebar(BuildContext context, bool isDrawer) {
    final Color textColor = isDrawer ? Colors.black87 : Colors.white;
    final Color iconColor = isDrawer ? Colors.black54 : Colors.grey[400]!;

    return Container(
      color: isDrawer ? Colors.white : Theme.of(context).colorScheme.secondary,
      height: double.infinity,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Icon(Icons.bolt_rounded, color: Colors.blue, size: 32),
                  const SizedBox(width: 12),
                  Text(
                    'ServiceFlow',
                    style: TextStyle(
                      color: textColor,
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
                      onTap: () {
                        setState(() => _selectedIndex = index);
                        if (isDrawer) Navigator.pop(context); // Close drawer
                      },
                      leading: Icon(
                        item.icon,
                        color: isSelected ? (isDrawer ? Colors.blue : Colors.white) : iconColor,
                        size: 20,
                      ),
                      title: Text(
                        item.title,
                        style: TextStyle(
                          color: isSelected ? (isDrawer ? Colors.blue : Colors.white) : textColor,
                          fontSize: 14,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      selectedTileColor: isDrawer
                          ? Colors.blue.withOpacity(0.1)
                          : Colors.blue.withOpacity(0.2),
                    ),
                  );
                },
              ),
            ),
            // User Profile at bottom
            Divider(color: isDrawer ? Colors.grey[200] : Colors.white12),
            ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('JD', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              title: Text(
                'John Doe', 
                style: TextStyle(
                  color: textColor, 
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                'Admin', 
                style: TextStyle(
                  color: isDrawer ? Colors.black54 : Colors.white70, 
                  fontSize: 12,
                ),
              ),
              trailing: Icon(
                Icons.logout, 
                color: isDrawer ? Colors.black54 : Colors.white70, 
                size: 18,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String title;
  const _NavItem(this.icon, this.title);
}
