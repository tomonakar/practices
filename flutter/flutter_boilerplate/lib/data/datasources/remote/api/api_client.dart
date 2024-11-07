// lib/data/datasources/remote/api/api_client.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_boilerplate/data/models/user/user_dto.dart';
import 'package:flutter_boilerplate/data/models/auth/auth_token_dto.dart';
import 'package:flutter_boilerplate/data/models/response/api_response.dart';
import 'package:flutter_boilerplate/data/models/response/paginated_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Auth
  @POST('/auth/sign-in')
  Future<HttpResponse<ApiResponse<AuthTokenDTO>>> signIn(
      @Body() Map<String, dynamic> body);

  @POST('/auth/sign-out')
  Future<HttpResponse<void>> signOut(
      @Header('Authorization') String accessToken);

  @POST('/auth/refresh')
  Future<HttpResponse<ApiResponse<AuthTokenDTO>>> refreshToken(
      @Body() Map<String, dynamic> body);

  @GET('/auth/me')
  Future<HttpResponse<ApiResponse<UserDTO>>> getCurrentUser(
    @Header('Authorization') String accessToken,
  );

  // Users
  @GET('/users/{id}')
  Future<HttpResponse<ApiResponse<UserDTO>>> getUser(
    @Header('Authorization') String accessToken,
    @Path() String id,
  );

  @PUT('/users/{id}')
  Future<HttpResponse<ApiResponse<UserDTO>>> updateUser(
    @Header('Authorization') String accessToken,
    @Path() String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE('/users/{id}')
  Future<HttpResponse<void>> deleteUser(
    @Header('Authorization') String accessToken,
    @Path() String id,
  );

  @GET('/users')
  Future<HttpResponse<ApiResponse<PaginatedResponse<UserDTO>>>> getUsers(
    @Header('Authorization') String accessToken,
    @Queries() Map<String, dynamic> queries,
  );

  @GET('/users/{id}/profile')
  Future<HttpResponse<ApiResponse<UserProfileDTO>>> getUserProfile(
    @Header('Authorization') String accessToken,
    @Path() String id,
  );

  @PUT('/users/{id}/profile')
  Future<HttpResponse<ApiResponse<UserProfileDTO>>> updateUserProfile(
    @Header('Authorization') String accessToken,
    @Path() String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/auth/password/reset')
  Future<HttpResponse<void>> sendPasswordResetEmail(
      @Body() Map<String, dynamic> body);

  @PUT('/auth/email')
  Future<HttpResponse<void>> updateEmail(
    @Header('Authorization') String accessToken,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/auth/password')
  Future<HttpResponse<void>> updatePassword(
    @Header('Authorization') String accessToken,
    @Body() Map<String, dynamic> body,
  );
}
