import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entities/songs/songs.dart';
import 'package:spotify/presentation/home/block/news_songs_cubit.dart';
import 'package:spotify/presentation/home/block/news_songs_state.dart';

import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/constant/app_urls.dart';
import '../../../service_locator.dart.';

class NewsSongs extends StatelessWidget{
  const NewsSongs({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NewsSongsCubit(sl)..getNewsSongs(),
      child: SizedBox(
        height: 300,
        child: BlocBuilder<NewsSongsCubit, NewSongsState>(
          builder: (context, state){
            if (state is NewsSongsLoading){
              return Container(
                alignment: Alignment.center,
                  child: const CircularProgressIndicator());
            }
            if(state is NewsSongsLoaded){
              return _songs(
                state.songs
              );
            }
            return Container();
          },
        )

      ),
    );
  }
  Widget Images(){
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context ,index){
          return SizedBox(
            width: 160,
            child:  Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(AppImages.first))
                    ),
                  ),
                ),

              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 14,),
        itemCount: 4);
  }
  Widget _songs(List<SongEntity> songs){
    return ListView.separated(
      scrollDirection: Axis.horizontal,
        itemBuilder: (context ,index){
      return SizedBox(
        width: 160,
        child:  Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(songs[index].imageUrl
                      ))
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(songs[index].title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16
            ),
            )
          ],
        ),
      );
    },
        separatorBuilder: (context, index) => const SizedBox(width: 14,),
        itemCount: songs.length);
  }
}
// SizedBox(
// width: 160,
// child:  Column(
// children: [
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// image: const DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage(AppImages.homeArtist))
// ),
// ),
// )
// ],
// ),
// );