import 'package:get/get.dart';
import '../model/user_model.dart';

import '../repository/user_repo.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  var isSuccess = false.obs;

  final UserRepository repository = UserRepository();

  void createUser (String name , String email) async{
    try{
      isLoading(true);
      User user = User(name: name, email: email);
      isSuccess(await repository.createUser(user));
    }finally{
      isLoading(false);
    }
  }
}
