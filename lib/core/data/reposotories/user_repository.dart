// import 'package:dartz/dartz.dart';
// import 'package:flutter_templete/core/data/models/apis/token_info.dart';
// import 'package:flutter_templete/core/data/models/common_response.dart';
// import 'package:flutter_templete/core/data/network/endpoints/user_endpoints.dart';
// import 'package:flutter_templete/core/data/network/network_config.dart';
// import 'package:flutter_templete/core/enums/request_type.dart';
// import 'package:flutter_templete/core/utils/network_util.dart';
// import 'package:http/http.dart';

// class UserRepository {
//   Future<Either<String, TokenInfo>> Login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//           type: RequestType.POST,
//           url: UserEndpoints.login,
//           headers:
//               NetworkConfig.getHeaders(needAuth: false, type: RequestType.POST),
//           body: {
//             'userName': email,
//             'password': password,
//           }).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(response);
//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(
//             commonResponse.data ?? {},
//           ));
//         } else {
//           return Left(commonResponse.message ?? "");
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
// //object
//     }
//   }

//   Future<Either<String, bool>> register({
//     // required String email,
//     // required String password,
//     required String lastname,
//     required String firstname,
//     // required int age,
//     required String Images,
//     required String email,
//     required String password,
//     int? age,
//   }) async {
//     try {
//       return NetworkUtil.SendMultipartRequest(
//         requestType: RequestType.POST,
//         url: UserEndpoints.register,
//         fields: {
//           'Email': email,
//           'FirstName': firstname,
//           'LastName': lastname,
//           'Password': password,
//           'Age': age.toString(),
//         },
//         files: {"Images": Images},
//         headers: NetworkConfig.getHeaders(needAuth: false, extraHeaders: {
//           // "Host":"training.owner-tech.com",
//           // "Content-Type":"multipart/form-data; boundary=--------------------------124862966303117164690513",
//           // "Content-Length" : "776",
//         }),
//       ).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(response);

//         if (commonResponse.getStatus) {
//           return Right(commonResponse.getStatus);
//         } else {
//           return Left(commonResponse.message ?? ''); //رسالة الخطأ
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }
