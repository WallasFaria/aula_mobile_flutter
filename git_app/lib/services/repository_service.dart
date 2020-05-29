import 'package:dio/dio.dart';
import 'package:git_app/modes/repository.dart';

const baseUrl = 'https://api.github.com';

class RepositoryService {
  final client = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Repository>> getRepositories(String username) async {
    var resp = await client.get('/users/$username/repos');

    return List<Repository>.from(resp.data.map((r) => Repository.fromJson(r)));
  }
}
