class UserModel {
  int id;
  String name;
  String email;
  String password;
  String image;
  String tel;

  UserModel({
    required this.id,
    this.name = "no-name",
    this.email = "no-email",
    this.password = "no-password",
    this.image = "no-tel",
    this.tel = "no-tel",
  });
}
