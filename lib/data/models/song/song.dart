import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/songs/songs.dart';

class SongModel{
   String ? title;
   String ? artist;
   num ? duration;
   Timestamp ? releaseDate;
   String ? imageUrl;

  SongModel({required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.imageUrl
  });
  SongModel.fromJson(Map<String, dynamic> data){
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
    imageUrl: 'https://firebasestorage.googleapis.com/v0/b/soptify-d9a6b.appspot.com/o/Covers%2Fthird.png?alt=media&token=6944404b-4e91-4c94-b791-d8e2ef89de47';
  }
}

extension SongModelX on SongModel{

  SongEntity toEntity(){
    return SongEntity(title: title!,
        artist: artist!,
        duration: duration!,
        releaseDate: releaseDate!,
        imageUrl: imageUrl!
    );
  }
}