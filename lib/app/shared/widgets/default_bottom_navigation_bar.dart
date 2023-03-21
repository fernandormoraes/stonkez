import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/shared/enums/bottom_page_enum.dart';

class DefaultBottomNavigationBar extends StatelessWidget {
  final AppStore appStore = Modular.get<AppStore>();

  DefaultBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return BottomNavigationBar(
        currentIndex: appStore.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
        onTap: (int index) {
          appStore.currentIndex = index;

          switch (BottomPage.values[index]) {
            case BottomPage.home:
              Modular.to.navigate('/');
              break;
            case BottomPage.favorites:
              Modular.to.navigate('/favorites/');
              break;
          }
        },
      );
    });
  }
}
