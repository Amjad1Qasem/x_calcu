class UserModel {
  String? token;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? phone;
  String? birthDate;
  String? gender;
  String? id;
  String? fcmToken;
  UserModel(
      {this.token,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.birthDate,
      this.gender,
      this.id,
      this.fcmToken});
  @override
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        birthDate: json["birthdate"],
        gender: json["gender"],
      );
  factory UserModel.fromJsonLogin(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );
  Map<String, dynamic> toJson() => {
        //
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone.toString(),
        "password": password,
        "birthdate": birthDate,
        "gender": gender,
      };
  Map<String, dynamic> toJsonLogin() => {
        "phone": phone.toString(),
        "password": password,
        "fcmToken": fcmToken,
      };
}
