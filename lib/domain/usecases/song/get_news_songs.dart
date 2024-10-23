import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/sources/song/song_firebase_service_impl.dart';

import '../../../service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async{
    return await sl<SongFirebaseServiceImpl>().getNewsSongs();
  }
}