import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/albums_request.dart';
import '../entities/albums.dart';

abstract class AlbumsRepository{
  //API Methods
  Future<Either<Failure,List<Albums>>>getAlbums(AlbumsRequest params);
}