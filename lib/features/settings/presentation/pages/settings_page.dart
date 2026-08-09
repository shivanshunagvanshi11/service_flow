import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Settings', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sidebar-like Settings Navigation
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    _buildSettingsNavItem(Icons.business, 'Business Profile', true),
                    _buildSettingsNavItem(Icons.people, 'Users & Roles', false),
                    _buildSettingsNavItem(Icons.category, 'Service Types', false),
                    _buildSettingsNavItem(Icons.receipt, 'Invoice Settings', false),
                    _buildSettingsNavItem(Icons.notifications, 'Notification Center', false),
                    _buildSettingsNavItem(Icons.security, 'Subscription & Plan', false),
                  ],
                ),
              ),
              const SizedBox(width: 48),
              // Settings Content Area
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Business Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.grey.shade100,
                              child: const Icon(Icons.add_a_photo, color: Colors.grey),
                            ),
                            const SizedBox(width: 24),
                            const Text('Company Logo', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 32),
                        _buildField('Business Name', 'ABC AC Services'),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(child: _buildField('Support Email', 'support@abc.com')),
                            const SizedBox(width: 24),
                            Expanded(child: _buildField('Support Phone', '+91 98765 43210')),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildField('GST Number', '22AAAAA0000A1Z5'),
                        const SizedBox(height: 48),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                          child: const Text('Save Changes'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsNavItem(IconData icon, String label, bool isSelected) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? const Color(0xFF2563EB) : Colors.grey),
      title: Text(label, style: TextStyle(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? const Color(0xFF2563EB) : Colors.black,
      )),
      selected: isSelected,
      selectedTileColor: const Color(0xFF2563EB).withOpacity(0.05),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onTap: () {},
    );
  }

  Widget _buildField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Colors.grey)),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: value,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ],
    );
  }
}
