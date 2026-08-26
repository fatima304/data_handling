import 'dart:convert';

import 'package:data_handling/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/employee_model.dart';

class EmployeeService {
  static const String _employeesUrl =
      ApiConstants.baseUrl + ApiConstants.employeesEndpoint;

  Future<List<EmployeeModel>> fetchEmployees() async {
    // Fetch employee data from the API
    final response = await http.get(Uri.parse(_employeesUrl));

    // Parse JSON response
    final data = jsonDecode(response.body);

    // Extract employee list from response
    final employees = data['data'] as List;

    // Map each employee JSON to EmployeeModel
    return employees
        .map((employee) => EmployeeModel.fromJson(employee))
        .toList();
  }
}