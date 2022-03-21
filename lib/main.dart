import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'src/config/routes/app_routes.dart';
import 'src/config/themes/app_themes.dart';
import 'src/core/utils/constants.dart';
import 'src/features/albums/presentation/blocs/albums_bloc.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.initialize(); //initialize the dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumsBloc>(
      create:(_) => di.sl<AlbumsBloc>(),
      child: MaterialApp(
        title: kMaterialAppTitle,
        theme: AppThemes.myTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: AppRoutes.routeGenerator,
      ),
    );
  }
}
