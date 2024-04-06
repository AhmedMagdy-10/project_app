class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String image;
  late String age;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    required this.image,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      uId: jsonData['uId'],
      image: jsonData['image'],
      age: jsonData['age'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'age': age,
    };
  }
}
