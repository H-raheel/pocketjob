class UserModel {
  final String userId;
  final String name;
  final String email;
  final String? phone;
  final String? gender;
  final List<String> appliedJobs;
  final List<String> savedJobs;
  final List<String>? skills;
  final String? lastHighestEducation;
  final String? instituteAttended;
  final int? yearOfGraduation;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    this.phone,
    this.gender,
    required this.appliedJobs,
    required this.savedJobs,
    this.skills,
    this.lastHighestEducation,
    this.instituteAttended,
    this.yearOfGraduation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
      appliedJobs: List<String>.from(json['appliedJobs'] ?? []),
      savedJobs: List<String>.from(json['savedJobs'] ?? []),
      skills: List<String>.from(json['skills'] ?? []),
      lastHighestEducation: json['lastHighestEducation'],
      instituteAttended: json['instituteAttended'],
      yearOfGraduation: json['yearOfGraduation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'gender': gender,
      'appliedJobs': appliedJobs,
      'savedJobs': savedJobs,
      'skills': skills,
      'lastHighestEducation': lastHighestEducation,
      'instituteAttended': instituteAttended,
      'yearOfGraduation': yearOfGraduation,
    };
  }

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? gender,
    List<String>? appliedJobs,
    List<String>? savedJobs,
    List<String>? skills,
    String? lastHighestEducation,
    String? instituteAttended,
    int? yearOfGraduation,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      appliedJobs: appliedJobs ?? this.appliedJobs,
      savedJobs: savedJobs ?? this.savedJobs,
      skills: skills ?? this.skills,
      lastHighestEducation: lastHighestEducation ?? this.lastHighestEducation,
      instituteAttended: instituteAttended ?? this.instituteAttended,
      yearOfGraduation: yearOfGraduation ?? this.yearOfGraduation,
    );
  }
}
