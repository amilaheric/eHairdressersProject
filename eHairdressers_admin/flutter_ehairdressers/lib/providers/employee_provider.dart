import '../models/user.dart';
import 'base_provider.dart';

class EmployeeProvider extends BaseProvider<User> {
  EmployeeProvider() : super("User");

  @override
  User fromJson(data) {
    // TODO: implement fromJson
    return User.fromJson(data);
  }
}
