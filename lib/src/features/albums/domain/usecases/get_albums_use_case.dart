import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/albums_request.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/albums.dart';
import '../repositories/albums_repository.dart';

class GetAlbumsUseCase implements UseCase<List<Albums>,AlbumsRequest>{
  final AlbumsRepository albumsRepository;
  const GetAlbumsUseCase(this.albumsRepository);

  @override
  Future<Either<Failure,List<Albums>>> call(AlbumsRequest params)async{
    return await albumsRepository.getAlbums(params);
  }

}