import '../service/api_service.dart';

class PostRepository {
  final ApiService _apiService = ApiService();

  Future<List<dynamic>> getPosts() async {
    return await _apiService.fetchPosts();
  }
}
