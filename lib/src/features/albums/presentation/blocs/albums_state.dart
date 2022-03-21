part of 'albums_bloc.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();
}

class AlbumsInitial extends AlbumsState {
  @override
  List<Object> get props => [];
}

class AlbumsLoading extends AlbumsState{
  @override
  List<Object?> get props => [];
}

class AlbumsLoaded extends AlbumsState{
  final List<Albums> _albumsList;
  const AlbumsLoaded(this._albumsList);
  List<Albums>get albumsData => _albumsList;
  @override
  List<Object?> get props => [_albumsList];
}

class AlbumsError extends AlbumsState{
  final String _errorMessage;
  const AlbumsError(this._errorMessage);
  String get errorMessage => _errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}