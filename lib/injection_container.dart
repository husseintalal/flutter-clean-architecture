import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/core/network/network_info.dart';
import 'src/features/albums/data/datasources/local/albums_local_data_source.dart';
import 'src/features/albums/data/datasources/remote/albums_remote_data_source.dart';
import 'src/features/albums/data/repositories/albums_repository_impl.dart';
import 'src/features/albums/domain/repositories/albums_repository.dart';
import 'src/features/albums/domain/usecases/get_albums_use_case.dart';
import 'src/features/albums/presentation/blocs/albums_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance; //service locator

Future<void>initialize()async{
  //! Features - Albums
  await initAlbumsDependencies();
}


Future<void>initAlbumsDependencies()async{

  //! BLoCs
  sl.registerFactory(
      () => AlbumsBloc(sl())
  );

  //! UseCases
  sl.registerLazySingleton<GetAlbumsUseCase>(() => GetAlbumsUseCase(sl()));

  //! Repositories
  sl.registerLazySingleton<AlbumsRepository>(() => AlbumsRepositoryImpl(networkInfo: sl(), albumsLocalDataSource: sl(), albumsRemoteDataSource: sl()));

  //! DataSources
  sl.registerLazySingleton<AlbumsRemoteDataSource>(() => AlbumsRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<AlbumsLocalDataSource>(() => AlbumsLocalDataSourceImpl(sl()));

  //! Core: NetworkInfo
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External dependencies: HttpClient,InternetConnectionChecker,SharedPreferences
  sl.registerLazySingleton<http.Client>(() => http.Client());
  sl.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  final sharedPreferences= await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

}
