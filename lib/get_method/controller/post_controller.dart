import 'package:get/get.dart';
import '../models/post_model.dart';
import '../repository/post_repository.dart';


class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Post>[].obs;
  final PostRepository repository = PostRepository();

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      var posts = await repository.getPosts();
      postList.value = posts.map((e) => Post.fromJson(e)).toList();
    } finally {
      isLoading(false);
      throw Exception('Failed To Load Data');
    }
  }
}
