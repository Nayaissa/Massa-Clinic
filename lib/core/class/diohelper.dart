
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:massaclinic/controller/auth/login_controller.dart';
import 'package:massaclinic/core/services/services.dart';

MyServices? myServices = Get.find();

class DioHelper {
  static dio.Dio? dioClient;

  static void init() {
    dioClient = dio.Dio(
      dio.BaseOptions(
        baseUrl: 'http://10.0.2.2:8000',
        connectTimeout: Duration(seconds: 50),
        validateStatus: (status) => true,
        receiveDataWhenStatusError: false,
      ),
    );
  }

  static Future<dio.Response?> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = '',
  }) async {
    try {
      dioClient!.options.headers = {};
      return await dioClient?.get(url, queryParameters: query);
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  static Future<dio.Response?> getDataa({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
   // String token = '',
  }) async {
    try {
      print('{$token========}');
      dioClient!.options.headers = {
        'Accept': 'application/json',
        'Authorization':
            'Bearer 14|qKCr9z0ertCZkuKSIbUGXwdQDk1a8iSQVADkWxpG44916a7d',
      };

      return await dioClient?.get(url, queryParameters: query);
    } catch (e, s) {
      print(' Error fetching data: $e');
      print(' StackTrace: $s');
      return null;
    }
  }

  Future<dio.Response?> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    try {
      dioClient!.options.headers = {'Accept': 'application/json'};
      return await dioClient?.post(url, queryParameters: query, data: data);
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  static Future<dio.Response?> postsData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String token = '',
  }) async {
    try {
      dioClient!.options.headers = {
        'Accept': 'application/json',
        'Authorization':
            'Bearer 14|qKCr9z0ertCZkuKSIbUGXwdQDk1a8iSQVADkWxpG44916a7d',
      };
      return await dioClient?.post(url, queryParameters: query, data: data
      
      );
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }

  static Future<dio.Response?> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String token = '',
  }) async {
    dioClient!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token,
    };
    return await dioClient?.put(url, queryParameters: query, data: data);
  }

  static Future<dio.Response?> deleteData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    try {
      dioClient!.options.headers = {
        'Accept': 'application/json',
        'Authorization':
            'Bearer 9|1tUoUqqstCaPGnSrYY5i7QCUPoktmFyQ0kMGebPB896f7e48',
      };
      return await dioClient?.delete(url, queryParameters: query, data: data);
    } catch (e) {
      print('Error fetching data: $e');
      return null;
    }
  }
}
