import 'dart:convert';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/params/albums_request.dart';
import '../../models/albums_model.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRemoteDataSource{
  /// Calls the [kBaseUrl]/{request} endpoint
  ///
  /// Throws [ServerException] if any error happens
  Future<List<AlbumsModel>>getAlbums(AlbumsRequest request);
}

class AlbumsRemoteDataSourceImpl extends AlbumsRemoteDataSource{
  final http.Client client;
  AlbumsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AlbumsModel>> getAlbums(AlbumsRequest request)async{
    final url = Uri.parse(kBaseUrl + request.type);
    final response = await client.get(url);
    if(response.statusCode == 200){
      final albumsList= List<AlbumsModel>.from(json.decode(response.body).map((e) => AlbumsModel.fromJson(e)));
      return albumsList;
    }else{
      throw ServerException();
    }
  }

}