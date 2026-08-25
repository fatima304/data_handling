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
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age,
      'profile_image': profileImage,
    };
  }
}
