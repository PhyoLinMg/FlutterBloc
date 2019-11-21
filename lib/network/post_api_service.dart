import 'package:chopper/chopper.dart';
import 'package:starter/network/mobile_data_interceptor.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  @Get(path: '/{id}')
  Future<Response> getPost(@Path('id') int id);

  static PostApiService create() {
    final client = ChopperClient(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        services:  [
          _$PostApiService(),
        ],
        interceptors: [
          MobileDataInterceptor(),
        ],
        converter: JsonConverter());
    return _$PostApiService(client);
  }
}


