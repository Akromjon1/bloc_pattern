
class Post {
  int id;
  String title;
  String body;
  int userId;

  Post({required this.id, required this.title, required this.body, required this.userId});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'userId': userId,
  };
}



// class Post {
//   int id;
//   String fullname;
//   String mobile;
//
//   Post({required this.id, required this.fullname, required this.mobile});
//
//   Post.fromJson(Map<String, dynamic> json)
//       : id = json['id'],
//         fullname = json['fullname'],
//         mobile = json['mobile'];
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'fullname': fullname,
//     'mobile': mobile,
//   };
// }