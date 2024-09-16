import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:happy_kitchen/core/utils/services/api_service.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo_implementation%20.dart';
  final getIt = GetIt.instance;
  void setupServiceLocator() {
    getIt.registerSingleton<ApiService>(
      ApiService(
        dio: Dio(),
      ),
    );
    getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(
        apiService: getIt.get<ApiService>(),
      ),
    );
  }
