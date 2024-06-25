import 'package:application/data/common/constants/api_endpoints_constants.dart';
import 'package:application/data/model/bottom_repo_model.dart';
import 'package:application/data/model/category_repo_model.dart';
import 'package:application/data/model/middle_repo_model.dart';
import 'package:application/data/model/top_repo_model.dart';
import 'package:application/data/providers/network/jwt/api_jwt.dart';
import 'package:application/domain/repositiories/dashboard_repo.dart';
import 'package:application/presentation/common/constants/string_constants.dart';

class DashboardRepoImpl extends DashboardRepository {

  @override
  Future<BottomRepositoryModel> bottomRepoGetApiCall() async {
    try {
      var response = await apiJwtService.get(url: ApiRoutes.bottomRepository, body: {});
      if (response.statusCode == 200) {
        return BottomRepositoryModel.fromJson(response.data);
      }
      throw Exception(StringConstants.somethingWentWrong);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<CategoryRepositoryModel> categoryGetApiCall() async {
    try {
      var response = await apiJwtService.get(url: ApiRoutes.categoryRepository, body: {});
      if (response.statusCode == 200) {
        return CategoryRepositoryModel.fromJson(response.data);
      }
      throw Exception(StringConstants.somethingWentWrong);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MiddleRepositoryModel> middleRepoGetApiCall() async {
    try {
      var response = await apiJwtService.get(url: ApiRoutes.middleRepository, body: {});
      if (response.statusCode == 200) {
        return MiddleRepositoryModel.fromJson(response.data);
      }
      throw Exception(StringConstants.somethingWentWrong);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopRepositoryModel> topRepoGetApiCall() async {
    try {
      var response = await apiJwtService.get(url: ApiRoutes.topRepository, body: {});
      if (response.statusCode == 200) {
        return TopRepositoryModel.fromJson(response.data);
      }
      throw Exception(StringConstants.somethingWentWrong);
    } catch (e) {
      rethrow;
    }
  }

}