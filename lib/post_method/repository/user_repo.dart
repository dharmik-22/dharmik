import '../model/user_model.dart';
import '../service/api_service.dart';

class UserRepository {
  final ApiServices apiService = ApiServices();

  Future<bool> createUser(User user){
    return apiService.createUser(user);
  }

  Future<List<User>> fetchUsers() {
    return apiService.fetchUsers();
  }
}
