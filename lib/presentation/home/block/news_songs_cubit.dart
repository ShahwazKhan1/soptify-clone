import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/presentation/home/block/news_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewSongsState>{
  final GetIt sl;
  NewsSongsCubit(this.sl) : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
            (l) {
              emit(NewsSongsLoadFailure());
            },
            (data) {
              emit(
                NewsSongsLoaded(songs: data)
              );
            });
  }
}