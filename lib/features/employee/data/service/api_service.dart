import 'package:data_handling/core/constants/api_constants.dart';
import 'package:data_handling/features/employee/data/models/employee_model.dart';
import 'package:dio/dio.dart';


class EmployeeService {
  static const String _employeesUrl =
      ApiConstants.baseUrl + ApiConstants.employeesEndpoint;

  final Dio _dio = Dio();

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      // Fetch employee data from the API using Dio.
      final response = await _dio.get(_employeesUrl);

      // Parse the JSON response and map it to Employee models.
      final employees = response.data['data'] as List;

      return employees
          .map((employee) => EmployeeModel.fromJson(employee))
          .toList();
    } on DioException catch (error) {
      throw Exception(
        error.message ?? 'Failed to fetch employees. Please try again.',
      );
    } catch (error) {
      throw Exception(
        'Something went wrong. Please try again.',
      );
    }
  }
}