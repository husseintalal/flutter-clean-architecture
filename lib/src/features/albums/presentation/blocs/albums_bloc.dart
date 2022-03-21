import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/params/albums_request.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/albums.dart';
import '../../domain/usecases/get_albums_use_case.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  final GetAlbumsUseCase getAlbumsUseCase;
  AlbumsBloc(this.getAlbumsUseCase) : super(AlbumsInitial()){
    on<AlbumsEvent>((event, emit)async{
      if(event is GetAlbums){
        emit(AlbumsLoading());
        final albumsData = await getAlbumsUseCase(event._albumsRequest);
        albumsData.fold(
            (left)async{
              emit(AlbumsError(_mapFailureToErrorMessage(left)));
            },
            (right)async{
              emit(AlbumsLoaded(right));
            }
        );
      }
    });
  }

  String _mapFailureToErrorMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure : return serverFailureMessage;
      case CacheFailure : return cacheFailureMessage;
      default: return defaultErrorMessage;
    }
  }

}
