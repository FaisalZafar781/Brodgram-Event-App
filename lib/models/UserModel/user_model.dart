class UserModel {
  String id;
  String name;
  String email;
  String role;
  String phoneNo; // New phone number field

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phoneNo, // Add phone number to the constructor
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phoneNo': phoneNo, // Add phone number to the map
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      role: map['role'],
      phoneNo: map['phoneNo'], // Add phone number while creating an instance
    );
  }
}
