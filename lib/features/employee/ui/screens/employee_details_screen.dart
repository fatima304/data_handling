import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeModel employeeModel;

  const EmployeeDetailsScreen({super.key, required this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Employee Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 45,
              backgroundColor: const Color(0xFFE0E7FF),
              child: Text(
                employeeModel.name[0],
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4F46E5),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              employeeModel.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Employee #${employeeModel.id}',
              style: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),

            const SizedBox(height: 32),

            _EmployeeInfoCard(
              icon: Icons.cake_outlined,
              title: 'Age',
              value: '${employeeModel.age} years',
            ),

            const SizedBox(height: 14),

            _EmployeeInfoCard(
              icon: Icons.payments_outlined,
              title: 'Salary',
              value: '\$${employeeModel.salary}',
            ),
          ],
        ),
      ),
    );
  }
}

class _EmployeeInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _EmployeeInfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF4F46E5)),
          ),

          const SizedBox(width: 14),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
