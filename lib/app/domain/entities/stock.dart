/// Represents a Stock scrapped data
class Stock {
  final String name;
  final String price;
  final String changePoint;
  final String changePercentage;
  final String totalVol;
  final String dayRangeLower;
  final String dayRangeHigher;
  final String week52RangeLower;
  final String week52RangeHigher;

  Stock(
      this.name,
      this.price,
      this.changePoint,
      this.changePercentage,
      this.totalVol,
      this.dayRangeLower,
      this.dayRangeHigher,
      this.week52RangeLower,
      this.week52RangeHigher);

  Stock.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        changePoint = json['changePoint'],
        changePercentage = json['changePercentage'],
        totalVol = json['totalVol'],
        dayRangeHigher = json['dayRangeHigher'],
        dayRangeLower = json['dayRangeLower'],
        week52RangeHigher = json['week52RangeHigher'],
        week52RangeLower = json['week52RangeLower'];
}
