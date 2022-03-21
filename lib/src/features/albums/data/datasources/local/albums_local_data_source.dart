import 'package:flutter_clean_architecture/src/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants.dart';
import 'package:flutter_clean_architecture/src/features/albums/data/models/albums_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


abstract class AlbumsLocalDataSource{
  ///Save the data that fetch from internet in [CACHE]
  Future<void>cacheData(List<AlbumsModel> data);

  ///GET THE [CACHED] data from local
  ///throws [CacheException] if no data found
  Future<List<AlbumsModel>>getDataFromLocal();
}

class AlbumsLocalDataSourceImpl extends AlbumsLocalDataSource{
  final SharedPreferences sharedPreferences;
  AlbumsLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheData(List<AlbumsModel> data)async{
    final encodedData= json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
    await sharedPreferences.setString(cachedAlbumsList,encodedData);
  }

  @override
  Future<List<AlbumsModel>> getDataFromLocal() {
    final encodedData = sharedPreferences.getString(cachedAlbumsList);
    if(encodedData == null){
      throw CacheException();
    }else{
      final albumsData = List<AlbumsModel>.from(json.decode(encodedData).map((e) => AlbumsModel.fromJson(e)));
      return Future.value(albumsData);
    }
  }

}