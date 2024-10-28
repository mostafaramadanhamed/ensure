class SearchModel {
  final String userId;
  final String userName;
  final String userImage;

  SearchModel({
    required this.userId,
    required this.userName,
    required this.userImage,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      userId: json['user_id'],
      userName: json['name'],
      userImage: json['profile_pic'],
    );
  }
}