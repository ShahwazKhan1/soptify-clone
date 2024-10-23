import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firebase_service_impl.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImp extends SongsRepository{
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();

  }

}