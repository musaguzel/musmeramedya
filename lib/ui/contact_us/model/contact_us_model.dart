class ContactUsModel {
  String name;
  String email;
  String message;
  String userId;

  ContactUsModel({
    required this.name,
    required this.email,
    required this.message,
    required this.userId
  });

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      name: json['name'],
      email: json['email'],
      message: json['message'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
      'user_id': userId,
    };
  }
}