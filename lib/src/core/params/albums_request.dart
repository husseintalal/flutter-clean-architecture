import 'package:equatable/equatable.dart';

class AlbumsRequest extends Equatable{
  final String type;
  const AlbumsRequest({required this.type});

  @override
  List<Object?> get props => [type];
}