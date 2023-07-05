class SignupResponse {
  int? id;
  String? name;
  String? guardianName;
  String? guardianPhoneNumber;

  SignupResponse(
      {this.id, this.name, this.guardianName, this.guardianPhoneNumber});

  SignupResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    guardianName = json['guardian_name'];
    guardianPhoneNumber = json['guardian_phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['guardian_name'] = guardianName;
    data['guardian_phone_number'] = guardianPhoneNumber;
    return data;
  }
}
