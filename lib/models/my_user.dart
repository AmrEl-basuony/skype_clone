class MyUser {
  MyUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.username,
    this.status,
    this.state,
    this.profilePhoto,
  });

  String uid;
  String name;
  String email;
  String username;
  String? status;
  int? state;
  String? profilePhoto;

  factory MyUser.fromMap(Map<String, dynamic> json, [param1]) => MyUser(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        status: json["status"],
        state: json["state"],
        profilePhoto: json["profilePhoto"],
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "name": name,
        "email": email,
        "username": username,
        "status": status,
        "state": state,
        "profilePhoto": profilePhoto,
      };
}
