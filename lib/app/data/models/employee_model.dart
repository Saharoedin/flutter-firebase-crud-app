class Employee {
  String? id;
  String? name;
  int? age;
  String? location;

  Employee({this.id, this.name, this.age, this.location});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['location'] = location;
    return data;
  }

  static List<Employee> fromJsonList(List? data) {
    if (data == null || data.isEmpty) return List<Employee>.empty();
    return data.map((e) => Employee.fromJson(e)).toList();
  }
}
