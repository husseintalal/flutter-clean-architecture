import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/core/params/albums_request.dart';
import '../blocs/albums_bloc.dart';
import '../widgets/albums_fetch_or_error.dart';
import '../widgets/albums_indicator.dart';
import '../widgets/albums_items.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  BlocBuilder<AlbumsBloc, AlbumsState> buildBody() {
    return BlocBuilder<AlbumsBloc,AlbumsState>(
      builder: (_,state){
        if(state is AlbumsLoading){
          return const AlbumsIndicator();
        }else if(state is AlbumsLoaded){
          return AlbumsItems(albums: state.albumsData,);
        }else if(state is AlbumsError){
          return AlbumsFetchOrError(isError: true,errorMessage: state.errorMessage,);
        }else{
          return const AlbumsFetchOrError();
        }
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Albums'),
    );
  }

  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        BlocProvider.of<AlbumsBloc>(context).add(const GetAlbums(AlbumsRequest(type: 'albums')));
      },
      child: const Icon(Icons.refresh),
    );
  }

}

