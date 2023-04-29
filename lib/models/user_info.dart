import 'dart:convert';

class UserInfoModel {
  final String? id;
  final String? username, email, password;

  UserInfoModel({
    this.id,
    this.username,
    this.email,
    this.password,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return UserInfoModel(
      id: jsonData['id'],
      username: jsonData['username'],
      email: jsonData['email'],
      password: jsonData['password'],
     
    );
  }

  static Map<String, dynamic> toMap(UserInfoModel userInfo) => {
        'id': userInfo.id,
        'username': userInfo.username,
        'email': userInfo.email,
        'password': userInfo.password,
        
      };

  static String encode(List<UserInfoModel> userInfo) => json.encode(
        userInfo
            .map<Map<String, dynamic>>((music) => UserInfoModel.toMap(music))
            .toList(),
      );

  static List<UserInfoModel> decode(String userInfo) =>
      (json.decode(userInfo) as List<dynamic>)
          .map<UserInfoModel>((item) => UserInfoModel.fromJson(item))
          .toList();
}
