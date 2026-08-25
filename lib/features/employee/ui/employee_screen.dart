import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:data_handling/features/employee/data/service/api_service.dart';
import 'package:data_handling/features/employee/ui/widgets/employee_card.dart';
import 'package:data_handling/features/employee/ui/widgets/empty_state.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeService _employeeService = EmployeeService();

  List<EmployeeModel> _employees = [];

  Future<void> _fetchEmployees() async {
    final employees = await _employeeService.fetchEmployees();

    setState(() {
      _employees = employees;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4F46E5),
        elevation: 0,
        title: const Text(
          'Employee Directory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Our Employees',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Tap the button to load employee data',
              style: TextStyle(fontSize: 14, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _fetchEmployees,
                icon: const Icon(Icons.download_rounded),
                label: const Text(
                  'Load Employees',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F46E5),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: _employees.isEmpty
                  ? const EmptyState()
                  : ListView.separated(
                      itemCount: _employees.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final employee = _employees[index];
                        return EmployeeCard(employee: employee);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
