import 'package:dio/dio.dart';

final String baseUrl ="http://188.166.164.3:9595";

class HttpService{

  Dio _dio;

  HttpService(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl
    ));

  }

  Future<Response> getRequest(String endpoint) async{

    Response response;

    try{
      response = await _dio.get(endpoint);
    } on DioError catch(e){
      print("Error::::::=>"+e.message);
      throw Exception(e);
    }
    return response;
  }

  Future<Response> postRequest(String  endPoint, Map<String, dynamic> data) async{

    Response response;
    try{
      response = await _dio.post(endPoint,data: data,options:Options(
        headers: {
          "Content-Type":"application/json; charset=utf8"
        }
      ));

    }on DioError catch(e){

      throw Exception(e);
    }

    return response;
  }

  initializeDio(){
    _dio.interceptors.add(InterceptorsWrapper (
        onRequest:(options, handler){

        },
        onResponse:(response,handler) {
          print(response.data);
        },
        onError: (DioError e, handler) {
          print(e.message);
        }
    ));


  }
}

