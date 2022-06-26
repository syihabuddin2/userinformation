import 'package:dio/dio.dart';
import 'package:userinformation/model/user/user.dart';
import 'package:userinformation/model/user/userpost.dart';
import 'package:userinformation/model/user/userprofile.dart';

class UserService {
  final Dio _dio = Dio();
  String? apiUrl = 'https://dummyapi.io/data/v1/user';
  String appId = '61e04c885acdab19daa8cce6';

  ///Get All Users
  Future<User> getAllUser({int? limit}) async {
    Response response = await _dio.get(
      apiUrl!,
      queryParameters: {
        "limit": limit,
      },
      options: Options(
        headers: {'app-id': '$appId'},
      ),
    );

    print('response: ${response}');

    final userList = User.fromJson(response.data);

    return userList;
  }

  ///Get User Profile
  Future<UserProfile> getUserById({int? id}) async {
    Response response = await _dio.get(
      '$apiUrl/$id',
      options: Options(
        headers: {'app-id': '${appId}'},
      ),
    );

    print('response: ${response}');

    final userProfile = UserProfile.fromJson(response.data);

    return userProfile;
  }

  ///Get User Post
  Future<UserPost> getUserPost({int? id, int? limit}) async {
    Response response = await _dio.get(
      '$apiUrl/$id/post',
      queryParameters: {
        "limit": limit,
      },
      options: Options(
        headers: {'app-id': '${appId}'},
      ),
    );

    print('response: ${response}');

    final userPost = UserPost.fromJson(response.data);

    return userPost;
  }
}
