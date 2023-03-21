import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/modules/favorites/favorites_presenter.dart';
import 'package:stonkez/app/modules/favorites/favorites_store.dart';
import 'package:flutter/material.dart';
import 'package:stonkez/app/modules/favorites/widgets/favorite_card.dart';
import 'package:stonkez/app/shared/widgets/default_bottom_navigation_bar.dart';

class FavoritesPage extends StatefulWidget {
  final String title;
  const FavoritesPage({Key? key, this.title = 'FavoritesPage'})
      : super(key: key);
  @override
  FavoritesPageState createState() => FavoritesPageState();
}

class FavoritesPageState extends State<FavoritesPage> {
  final FavoritesStore store = Modular.get<FavoritesStore>();
  final FavoritesPresenter presenter = Modular.get<FavoritesPresenter>();
  final AppStore appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      bottomNavigationBar: DefaultBottomNavigationBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: appStore.favoriteStocks.length,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => presenter.getStock(index),
                        child: FavoriteCard(
                            stockNameFavorite: appStore.favoriteStocks[index]),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
