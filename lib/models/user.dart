class User {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNo;
  final String password;

  User({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  Map<String, dynamic> toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "PhoneNo": phoneNo,
      "Password": password,
    };
  }
}
