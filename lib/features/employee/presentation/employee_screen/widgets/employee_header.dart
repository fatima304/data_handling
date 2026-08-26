import 'package:data_handling/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmployeeHeader extends StatelessWidget {
  const EmployeeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Employees',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Tap the button to load employee data',
          style: TextStyle(fontSize: 14, color: AppColors.gray),
        ),
      ],
    );
  }
}
