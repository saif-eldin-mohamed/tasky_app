import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky_app/Core/networking/api_constants.dart';
import 'package:tasky_app/features/add_task/data/models/add_edit_task_request_body.dart';
import 'package:tasky_app/features/add_task/data/models/edit_task_request_body.dart';
import 'package:tasky_app/features/home/data/models/todo_response.dart';
import 'package:tasky_app/features/login/data/models/login_request_body.dart';
import 'package:tasky_app/features/login/data/models/login_response.dart';
import 'package:tasky_app/features/login/data/models/refresh_token_response.dart';
import 'package:tasky_app/features/profile/data/profile_response.dart';
import '../../features/sign_up/data/models/sign_up_request_body.dart';
import '../../features/sign_up/data/models/sign_up_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
//auth
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody,
  );
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @GET(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken( @Query("token") String refreshToken);


//home
  @GET(ApiConstants.getTodoList)
  Future<List<TodoResponse>> getTodosList(@Query("page") int pageNum);


//profile
 @GET(ApiConstants.profile)
Future<ProfileResponse> getProfile();


 
  //crud task
   @POST(ApiConstants.createTask)
  Future<void> createTask( @Body() AddEditTaskRequestBody addEditTaskRequestBody);

  @GET("/todos/{id}")
  Future<TodoResponse> getTodoById(@Path("id") String id);

  @DELETE("todos/{id}")
Future<void> deleteTodoById(@Path("id") String id);

  @PUT("todos/{id}")
  Future<void> editTask(@Path("id") String postId, @Body() EditTaskRequestBody editTaskRequestBody,);


  
}
