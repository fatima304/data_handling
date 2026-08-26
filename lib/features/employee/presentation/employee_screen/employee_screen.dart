import 'package:data_handling/core/constants/app_colors.dart';
import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:data_handling/features/employee/data/service/api_service.dart';
import 'package:data_handling/features/employee/data/service/employee_cache_service.dart';
import 'package:data_handling/features/employee/presentation/employee_screen/widgets/employee_header.dart';
import 'package:data_handling/features/employee/presentation/employee_screen/widgets/employee_list_content.dart';
import 'package:data_handling/features/employee/presentation/employee_screen/widgets/load_employees_button.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeService _employeeService = EmployeeService();
  bool _isLoading = false;
  bool _hasError = false;
  List<EmployeeModel> _employees = [];
  final EmployeeCacheService _cacheService = EmployeeCacheService();

  @override
  void initState() {
    super.initState();
    _loadCachedEmployees();
  }

  Future<void> _loadCachedEmployees() async {
    final cachedEmployees = await _cacheService.getCachedEmployees();

    if (!mounted || cachedEmployees.isEmpty) return;

    setState(() {
      _employees = cachedEmployees;
    });
  }

  Future<void> _fetchEmployees() async {
    final hadExistingData = _employees.isNotEmpty;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final employees = await _employeeService.fetchEmployees();

      if (!mounted) return;

      await _cacheService.saveEmployees(employees);

      setState(() {
        _employees = employees;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
        // Only show error state if we don't have existing data to display
        _hasError = !hadExistingData;
      });

      // Show a snackbar to indicate the refresh failed but existing data is preserved
      if (hadExistingData && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to refresh. Showing cached data.'),
            backgroundColor: AppColors.errorColor,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
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
            const EmployeeHeader(),
            const SizedBox(height: 20),
            LoadEmployeesButton(onPressed: _fetchEmployees),
            const SizedBox(height: 24),
            Expanded(
              child: EmployeeListContent(
                isLoading: _isLoading,
                hasError: _hasError,
                employees: _employees,
                onRetry: _fetchEmployees,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
