import 'package:data_handling/core/constants/app_colors.dart';
import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:data_handling/features/employee/presentation/employee_details_screen/employee_details_screen.dart';
import 'package:data_handling/features/employee/presentation/employee_screen/widgets/employee_card.dart';
import 'package:data_handling/features/employee/presentation/employee_screen/widgets/employee_error_widget.dart';
import 'package:flutter/material.dart';

class EmployeeListContent extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final List<EmployeeModel> employees;
  final VoidCallback onRetry;

  const EmployeeListContent({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.employees,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (hasError) {
      return EmployeeErrorView(onRetry: onRetry);
    }

    if (employees.isEmpty) {
      return const Center(
        child: Text(
          'No employees loaded yet',
          style: TextStyle(color: AppColors.gray, fontSize: 15),
        ),
      );
    }

    return ListView.separated(
      itemCount: employees.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final employee = employees[index];

        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EmployeeDetailsScreen(employeeModel: employee),
              ),
            );
          },
          child: EmployeeCard(employee: employee),
        );
      },
    );
  }
}
