// import 'dart:convert';
// import '../../../../core/databases/cache/cache_helper.dart';
// import '../../../../core/errors/expentions.dart';
// import '../models/login_model.dart';

// class LoginLocalDataSource {
//   final CacheHelper cache;
//   final String key = "Cachedlogin";
//   LoginLocalDataSource({required this.cache});

//   cachelogin(loginModel? loginToCache) {
//     if (loginToCache != null) {
//       cache.saveData(key: key, value: json.encode(loginToCache.toJson()));
//     } else {
//       throw CacheExeption(errorMessage: "No Internet Connection");
//     }
//   }

//   Future<loginModel> getLastlogin() {
//     final jsonString = cache.getDataString(key: key);

//     if (jsonString != null) {
//       return Future.value(loginModel.fromJson(json.decode(jsonString)));
//     } else {
//       throw CacheExeption(errorMessage: "No Internet Connection");
//     }
//   }
// }
