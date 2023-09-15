
class Post{
  final String userName;
  final String userPass;

  Post({
  required this.userName,
  required this.userPass
});


factory Post.fromJson(Map<String, dynamic > json) => Post(
  userName: json['userName'],
  userPass: json['userPass']
);
}

