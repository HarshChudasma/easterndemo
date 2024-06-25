import 'package:application/data/model/bottom_repo_model.dart';
import 'package:application/data/model/category_repo_model.dart';
import 'package:application/data/model/middle_repo_model.dart';
import 'package:application/data/model/top_repo_model.dart';

abstract class DashboardRepository {

  // category menu api call
  Future<CategoryRepositoryModel> categoryGetApiCall();

  // top repo menu api call
  Future<TopRepositoryModel> topRepoGetApiCall();

  // middle repo menu api call
  Future<MiddleRepositoryModel> middleRepoGetApiCall();

  // bottom repo menu api call
  Future<BottomRepositoryModel> bottomRepoGetApiCall();

}