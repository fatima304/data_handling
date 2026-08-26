class EmployeeModel {
  final int id;
  final String name;
  final int salary;
  final int age;
  final String profileImage;

  const EmployeeModel({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
    required this.profileImage,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'] as int,
      name: json['employee_name'] as String? ?? 'Unknown',
      salary: json['employee_salary'] as int? ?? 0,
      age: json['employee_age'] as int? ?? 0,
      profileImage: json['profile_image'] as String? ?? '',
    );
  }
}
