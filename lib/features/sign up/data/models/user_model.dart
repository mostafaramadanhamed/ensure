class UserModel {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String bio;
  final String profilePic;
  final int followers;
  final int following;

  UserModel({
    required this.profilePic,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.bio,
    required this.followers,
    required this.following,
  });
}
