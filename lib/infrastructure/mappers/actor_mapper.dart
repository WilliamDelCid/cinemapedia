import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper{
  static Actor castToEntity(Cast cast)=> Actor(
    id: cast.id,
    name: cast.name,
    character: cast.character,
    profilePath: cast.profilePath != null ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' :'https://st4.depositphotos.com/3265223/21282/v/450/depositphotos_212821870-stock-illustration-default-avatar-photo-placeholder-profile.jpg',
  );
}