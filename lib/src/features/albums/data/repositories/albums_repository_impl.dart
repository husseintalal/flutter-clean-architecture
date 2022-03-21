import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/params/albums_request.dart';
import '../../domain/entities/albums.dart';
import '../../domain/repositories/albums_repository.dart';
import '../datasources/local/albums_local_data_source.dart';
import '../datasources/remote/albums_remote_data_source.dart';


class AlbumsRepositoryImpl implements AlbumsRepository{
  final NetworkInfo networkInfo;
  final AlbumsRemoteDataSource albumsRemoteDataSource;
  final AlbumsLocalDataSource albumsLocalDataSource;
  const AlbumsRepositoryImpl({required this.networkInfo,required this.albumsLocalDataSource,required this.albumsRemoteDataSource});


  @override
  Future<Either<Failure, List<Albums>>> getAlbums(AlbumsRequest params)async{
    if(await networkInfo.isConnected){
      try{
        final response = await albumsRemoteDataSource.getAlbums(params);
        //cache the data after fetching it...
        await albumsLocalDataSource.cacheData(response);
        return Right(response);
      }on ServerException{
        return Left(ServerFailure());
      }
    }else{
      ///no internet connection, check the cached data from local
      ///if no data found then throw cache exception
      try{
        final albumsData = await albumsLocalDataSource.getDataFromLocal();
        return Right(albumsData);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }

}