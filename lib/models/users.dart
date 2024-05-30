class UserModel {
  final String userId;
  final String name;
  final String email;
  final List<String> appliedJobs;
  final List<String> savedJobs;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.appliedJobs,
    required this.savedJobs,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      appliedJobs: List<String>.from(json['appliedJobs'] ?? []),
      savedJobs: List<String>.from(json['savedJobs'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'appliedJobs': appliedJobs,
      'savedJobs': savedJobs,
    };
  }
}
