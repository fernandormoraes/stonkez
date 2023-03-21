import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/modules/favorites/favorites_store.dart';
import 'package:flutter/material.dart';
import 'package:stonkez/app/shared/widgets/default_bottom_navigation_bar.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key? key, this.title = 'FavoritesPage'})
      : super(key: key);
  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  final FavoritesStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      bottomNavigationBar: DefaultBottomNavigationBar(),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
