import 'package:flutter/material.dart';
import '../../core/utils/constants.dart';
import '../../features/albums/presentation/screens/albums_screen.dart';

///! This file contains all [Routes]
///! That will be used in our [main.dart]


class AppRoutes{

  static Route<dynamic>routeGenerator(RouteSettings settings){
    switch(settings.name){
      case albumsScreen: return _materialPageRoute(const AlbumsScreen(),settings);
      default: return _materialPageRoute(
         const Scaffold(
           body: Center(
             child: Text('Error, Route Not Found!'),
           ),
        ),settings
      );
    }
  }

  static MaterialPageRoute _materialPageRoute(Widget widget,RouteSettings settings) => MaterialPageRoute(
    builder: (_) => widget,
    settings: settings
  );

}