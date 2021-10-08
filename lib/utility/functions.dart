import 'package:skype_clone/models/my_user.dart';

class Functions {
  static String extractUserName(String email) {
    return email.split('@')[0];
  }

  userSearchFilter(String query, List<MyUser> userList) {
    final List<MyUser> searchList = query.isEmpty
        ? []
        : userList.where((MyUser user) {
            String _getUsername = user.username.toLowerCase();
            String _query = query.toLowerCase();
            String _getName = user.name.toLowerCase();
            bool matchesUsername = _getUsername.contains(_query);
            bool matchesName = _getName.contains(_query);

            return (matchesName || matchesUsername);
          }).toList();
  }
}
