part of 'albums_bloc.dart';

abstract class AlbumsEvent extends Equatable {
  const AlbumsEvent();
}


class GetAlbums extends AlbumsEvent{
  final AlbumsRequest _albumsRequest;
  const GetAlbums(this._albumsRequest);
  @override
  List<Object?> get props => [_albumsRequest];
}