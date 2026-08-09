import 'package:flutter/material.dart';

class AddTechnicianPage extends StatefulWidget {
  const AddTechnicianPage({super.key});

  @override
  State<AddTechnicianPage> createState() => _AddTechnicianPageState();
}

class _AddTechnicianPageState extends State<AddTechnicianPage> {
  final Map<String, bool> _skills = {
    'AC Repair': true,
    'AC Installation': true,
    'Refrigerator': false,
    'Washing Machine': false,
    'CCTV Setup': false,
    'Electrical': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Technician')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Icon(Icons.add_a_photo_outlined, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        const Text('Profile Photo', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Column(
                        children: [
                          _buildField('Name *', 'Enter full name'),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(child: _buildField('Mobile *', 'Mobile number')),
                              const SizedBox(width: 16),
                              Expanded(child: _buildField('Email', 'Email address')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                
                const Text('Skills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 24,
                  runSpacing: 12,
                  children: _skills.keys.map((skill) {
                    return SizedBox(
                      width: 200,
                      child: CheckboxListTile(
                        title: Text(skill, style: const TextStyle(fontSize: 14)),
                        value: _skills[skill],
                        onChanged: (val) => setState(() => _skills[skill] = val!),
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    );
                  }).toList(),
                ),
                
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(child: _buildField('Experience', 'e.g. 5 Years')),
                    const SizedBox(width: 16),
                    Expanded(child: _buildField('Service Area', 'e.g. North Gorakhpur')),
                  ],
                ),
                const SizedBox(height: 24),
                _buildField('Working Hours', 'e.g. 9:00 AM - 6:00 PM'),
                
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Create Technician', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }
}
