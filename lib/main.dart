import 'package:flutter/material.dart';
import 'package:movies_app/viewmodels.dart';
import 'package:movies_app/webservice.dart';
import 'package:provider/provider.dart';

import 'movielistpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => MoviesListViewModel(),
        child: MovieListPage(),
      ),
    );
  }
}

