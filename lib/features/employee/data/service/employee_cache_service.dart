import 'dart:convert';

import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeCacheService {
  static const String _employeesKey = 'cached_employees';

  Future<void> saveEmployees(List<EmployeeModel> employees) async {
    try {
      final preferences = await SharedPreferences.getInstance();

      // Convert employees to JSON before storing them locally.
      final employeesJson = employees
          .map(
            (employee) => {
              'id': employee.id,
              'employee_name': employee.name,
              'employee_salary': employee.salary,
              'employee_age': employee.age,
              'profile_image': employee.profileImage,
            },
          )
          .toList();

      await preferences.setString(_employeesKey, jsonEncode(employeesJson));
    } catch (error) {
      // Silently fail - caching is optional for the app to function
    }
  }

  Future<List<EmployeeModel>> getCachedEmployees() async {
    try {
      final preferences = await SharedPreferences.getInstance();

      final cachedData = preferences.getString(_employeesKey);

      if (cachedData == null) {
        return [];
      }

      // Decode cached JSON and convert it back to Employee models.
      final employeesJson = jsonDecode(cachedData) as List;

      return employeesJson
          .map(
            (employee) =>
                EmployeeModel.fromJson(employee as Map<String, dynamic>),
          )
          .toList();
    } catch (error) {
      return [];
    }
  }
}
