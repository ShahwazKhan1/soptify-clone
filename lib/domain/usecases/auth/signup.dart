import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq> {
  @override
  Future<Either<dynamic, dynamic>> call({dynamic params}) async {
    CreateUserReq ? createUserReq = params as CreateUserReq?;
    return sl<AuthRepository>().signup(params!);
  }

}