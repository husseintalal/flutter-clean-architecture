import '../../domain/entities/albums.dart';

class AlbumsModel extends Albums{
  const AlbumsModel({required int userId, required int id, required String title})
      : super(userId: userId, id: id, title: title);

  factory AlbumsModel.fromJson(Map<String,dynamic>data) => AlbumsModel(
    userId: data['userId'],
    id: data['id'],
    title: data['title']
  );

  Map<String,dynamic>toJson() => {
    'userId' : userId,
    'id' : id,
    'title' : title,
  };

}