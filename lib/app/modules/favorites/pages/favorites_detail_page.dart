import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:slidy/slidy.dart';
import 'package:stonkez/app/modules/favorites/favorites_store.dart';
import 'package:stonkez/app/modules/home/widgets/stock_values_card.dart';
import 'package:stonkez/app/modules/home/widgets/values_range.dart';
import 'package:stonkez/app/shared/widgets/default_bottom_navigation_bar.dart';

class FavoritesDetailPage extends StatelessWidget {
  final String stockName;

  final FavoritesStore favoritesStore = Modular.get<FavoritesStore>();

  FavoritesDetailPage({super.key, required this.stockName});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        favoritesStore.stock = null;
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(stockName)),
        bottomNavigationBar: DefaultBottomNavigationBar(),
        body: Observer(builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              favoritesStore.stock != null
                  ? Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      favoritesStore.stock!.name,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          fontSize: 28,
                                          color: Colors.grey.shade900,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${favoritesStore.stock!.price}',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey.shade800),
                                  ),
                                  favoritesStore.stock!.changeIsNegative
                                      ? const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.red)
                                      : const Icon(
                                          Icons.keyboard_arrow_up_rounded,
                                          color: Colors.green),
                                  Text(
                                    '${favoritesStore.stock!.changePercentage.replaceAll('-', '')}%',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: favoritesStore
                                                .stock!.changeIsNegative
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    favoritesStore.stock!.changePoint
                                        .replaceAll('-', ''),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: favoritesStore
                                                .stock!.changeIsNegative
                                            ? Colors.red
                                            : Colors.green),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: StockValuesCard(
                                  height: 160,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          'Day Range',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Lower',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'Highest',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              favoritesStore
                                                  .stock!.dayRangeLower,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade800),
                                            ),
                                            const Spacer(),
                                            Text(
                                              favoritesStore
                                                  .stock!.dayRangeHigher,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ValuesRange(
                                          firstValue: double.parse(
                                              favoritesStore
                                                  .stock!.dayRangeLower),
                                          middleValue: double.parse(
                                              favoritesStore.stock!.price),
                                          lastValue: double.parse(favoritesStore
                                              .stock!.dayRangeHigher))
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 24.0, bottom: 24),
                                child: StockValuesCard(
                                  height: 160,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Text(
                                          'Week-52 Range',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey.shade800,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Lower',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'Highest',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              favoritesStore
                                                  .stock!.week52RangeLower,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade800),
                                            ),
                                            const Spacer(),
                                            Text(
                                              favoritesStore
                                                  .stock!.week52RangeHigher,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade800),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ValuesRange(
                                          firstValue: double.parse(
                                              favoritesStore
                                                  .stock!.week52RangeLower),
                                          middleValue: double.parse(
                                              favoritesStore.stock!.price),
                                          lastValue: double.parse(favoritesStore
                                              .stock!.week52RangeHigher))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      heightFactor: 12,
                      child: CircularProgressIndicator(),
                    )
            ],
          );
        }),
      ),
    );
  }
}
