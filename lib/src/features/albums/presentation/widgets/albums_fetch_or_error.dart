import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/params/albums_request.dart';
import '../blocs/albums_bloc.dart';

class AlbumsFetchOrError extends StatelessWidget {
  const AlbumsFetchOrError({Key? key,this.isError = false, this.errorMessage = ''}) : super(key: key);
  final bool isError;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isError) Text(errorMessage),
          OutlinedButton(
            onPressed: (){
              BlocProvider.of<AlbumsBloc>(context).add(const GetAlbums(AlbumsRequest(type: 'albums')));
            },
            child: const Text('Get Albums'),
          )
        ],
      ),
    );
  }
}
