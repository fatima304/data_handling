import 'package:data_handling/core/constants/app_colors.dart';
import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:flutter/material.dart';

class EmployeeAvatar extends StatelessWidget {
  final EmployeeModel employeeModel;

  const EmployeeAvatar({super.key, required this.employeeModel});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 45,
      backgroundColor: const Color(0xFFE0E7FF),
      child: Text(
        employeeModel.name.isNotEmpty
            ? employeeModel.name[0].toUpperCase()
            : '?',
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
