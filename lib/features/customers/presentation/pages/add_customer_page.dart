import 'package:flutter/material.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  String _customerType = 'Individual';
  
  // Mock check for existing mobile
  void _saveCustomer() {
    // In a real app, this would check the database
    const existingMobile = '9876543210';
    final mobile = _mobileController.text;

    if (mobile == existingMobile) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Customer already exists with this mobile number.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      // Logic to save
      Navigator.pop(context);
    }
  }

  final _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Customer')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  
                  _buildLabel('Name *'),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Enter full name'),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Mobile *'),
                            TextFormField(
                              controller: _mobileController,
                              decoration: const InputDecoration(hintText: 'Mobile number'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Alternate Mobile'),
                            TextFormField(
                              decoration: const InputDecoration(hintText: 'Optional'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _buildLabel('Email'),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'customer@email.com'),
                  ),
                  const SizedBox(height: 24),

                  const Divider(),
                  const SizedBox(height: 24),

                  _buildLabel('Address *'),
                  TextFormField(
                    maxLines: 2,
                    decoration: const InputDecoration(hintText: 'House/Street/Area'),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('City'),
                            TextFormField(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildLabel('Pincode'),
                            TextFormField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('Customer Type'),
                  Row(
                    children: [
                      _choiceChip('Individual'),
                      const SizedBox(width: 12),
                      _choiceChip('Business'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('Notes'),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(hintText: 'Special instructions...'),
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _saveCustomer,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Save Customer', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey)),
    );
  }

  Widget _choiceChip(String label) {
    final isSelected = _customerType == label;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) => setState(() => _customerType = label),
      selectedColor: const Color(0xFF2563EB).withOpacity(0.1),
      labelStyle: TextStyle(
        color: isSelected ? const Color(0xFF2563EB) : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
