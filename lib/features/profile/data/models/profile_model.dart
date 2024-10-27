class ProfileModel {
  final String name;
  final String id;
  final String photoUrl;
  final String bio;
  final int followersCount;
  final int followingCount;

  ProfileModel({
    required this.name,
    required this.id,
    required this.photoUrl,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
  });


// from map
  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] as String,
      id: map['user_id'] as String,
      photoUrl: map['profile_pic'] as String,
      bio: map['bio'] as String,
      followersCount: map['followers_count'] as int,
      followingCount: map['following_count'] as int,
    );
  }
 
}
