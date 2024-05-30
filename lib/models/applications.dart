class ApplicationModel {
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String currentlyEmployed;
  final String? currentCompany;
  final String? position;
  final String jobId;
  final String status;
  final String? pdfUrl;

  ApplicationModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.currentlyEmployed,
    this.currentCompany,
    this.position,
    required this.jobId,
    this.status = "applied",
    this.pdfUrl,
  });

  ApplicationModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? currentlyEmployed,
    String? currentCompany,
    String? position,
    String? jobId,
    String? status,
    String? pdfUrl,
  }) {
    return ApplicationModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      currentlyEmployed: currentlyEmployed ?? this.currentlyEmployed,
      currentCompany: currentCompany ?? this.currentCompany,
      position: position ?? this.position,
      jobId: jobId ?? this.jobId,
      status: status ?? this.status,
      pdfUrl: pdfUrl ?? this.pdfUrl,
    );
  }

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      currentlyEmployed: json['currentlyEmployed'],
      currentCompany: json['currentCompany'],
      position: json['position'],
      jobId: json['jobId'],
      status: json['status'] ?? "applied",
      pdfUrl: json['pdfUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'currentlyEmployed': currentlyEmployed,
      'currentCompany': currentCompany,
      'position': position,
      'jobId': jobId,
      'status': status,
      'pdfUrl': pdfUrl,
    };
  }
}
