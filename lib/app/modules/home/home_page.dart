import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stonkez/app/app_store.dart';
import 'package:stonkez/app/modules/home/home_presenter.dart';
import 'package:stonkez/app/modules/home/widgets/stock_values_card.dart';
import 'package:stonkez/app/modules/home/widgets/values_range.dart';
import 'package:stonkez/app/shared/widgets/default_bottom_navigation_bar.dart';
import 'home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final HomeStore store = Modular.get<HomeStore>();
  final HomePresenter presenter = Modular.get<HomePresenter>();
  final AppStore appStore = Modular.get<AppStore>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      bottomNavigationBar: DefaultBottomNavigationBar(),
      body: Observer(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
              child: TextFormField(
                maxLength: 7,
                controller: store.queryController,
                onFieldSubmitted: (value) => presenter.getStockByQuery(value),
                onChanged: (value) =>
                    value.isEmpty ? store.searchedStock = null : null,
                decoration: InputDecoration(
                    counterText: '',
                    counterStyle: const TextStyle(height: 0),
                    suffixIcon: InkWell(
                        onTap: () {
                          presenter.getStockByQuery(store.queryController.text);
                          FocusScope.of(context).unfocus();
                        },
                        child: const Icon(Icons.search)),
                    contentPadding: const EdgeInsets.all(8),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ),
            store.searchedStock != null
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
                                    store.searchedStock!.name,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Observer(builder: (context) {
                                  return InkWell(
                                      onTap: () => presenter.addNewFavorite(),
                                      child: store.isFavorite
                                          ? const Icon(
                                              Icons.favorite,
                                              color: Colors.blue,
                                            )
                                          : const Icon(Icons.favorite_border));
                                })
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$${store.searchedStock!.price}',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey.shade800),
                                ),
                                store.searchedStock!.changeIsNegative
                                    ? const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.red)
                                    : const Icon(
                                        Icons.keyboard_arrow_up_rounded,
                                        color: Colors.green),
                                Text(
                                  '${store.searchedStock!.changePercentage.replaceAll('-', '')}%',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          store.searchedStock!.changeIsNegative
                                              ? Colors.red
                                              : Colors.green),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  store.searchedStock!.changePoint
                                      .replaceAll('-', ''),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          store.searchedStock!.changeIsNegative
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            store.searchedStock!.dayRangeLower,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800),
                                          ),
                                          const Spacer(),
                                          Text(
                                            store.searchedStock!.dayRangeHigher,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ValuesRange(
                                        firstValue: double.parse(
                                            store.searchedStock!.dayRangeLower),
                                        middleValue: double.parse(
                                            store.searchedStock!.price),
                                        lastValue: double.parse(store
                                            .searchedStock!.dayRangeHigher))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 24.0, bottom: 24),
                              child: StockValuesCard(
                                height: 160,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            store.searchedStock!
                                                .week52RangeLower,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800),
                                          ),
                                          const Spacer(),
                                          Text(
                                            store.searchedStock!
                                                .week52RangeHigher,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey.shade800),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ValuesRange(
                                        firstValue: double.parse(store
                                            .searchedStock!.week52RangeLower),
                                        middleValue: double.parse(
                                            store.searchedStock!.price),
                                        lastValue: double.parse(store
                                            .searchedStock!.week52RangeHigher))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : store.isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            store.exceptionMessage != null
                                ? const Icon(
                                    Icons.broken_image,
                                    size: 48,
                                  )
                                : Container(),
                            Text(store.exceptionMessage ?? ''),
                          ],
                        ),
                      )
          ],
        );
      }),
    );
  }
}
