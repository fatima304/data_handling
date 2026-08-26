import 'package:data_handling/core/constants/app_colors.dart';
import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:data_handling/features/employee/presentation/employee_details_screen/widgets/employee_avatar.dart';
import 'package:data_handling/features/employee/presentation/employee_details_screen/widgets/employee_info_card.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeModel employeeModel;

  const EmployeeDetailsScreen({super.key, required this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
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
            EmployeeAvatar(employeeModel: employeeModel),
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
              style: const TextStyle(fontSize: 14, color: AppColors.gray),
            ),
            const SizedBox(height: 32),
            EmployeeInfoCard(
              icon: Icons.cake_outlined,
              title: 'Age',
              value: '${employeeModel.age} years',
            ),
            const SizedBox(height: 14),
            EmployeeInfoCard(
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
