import 'package:business_logic_provider/signal_r/signal_r_data_provider.dart';

class AssetListModel {
  List<Asset> assets;
  int now;

  AssetListModel({this.assets, this.now});

  factory AssetListModel.fromJson(Map<String, dynamic> json) {
    List<Asset> assets = [];
    json['assets'].forEach((e) => assets.add(Asset.fromJson(e)));

    return AssetListModel(
      assets: assets,
      now: json['now'],
    );
  }
}

class Asset {
  String symbol;
  String description;
  num accuracy;

  Asset({this.symbol, this.description, this.accuracy});

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      symbol: json['symbol'],
      description: json['description'],
      accuracy: json['accuracy'],
    );
  }
}

class Balance {
  String assetId;
  num balance;
  num reserve;
  String lastUpdate;
  num sequenceId;

  Balance({
    this.assetId,
    this.balance,
    this.reserve,
    this.lastUpdate,
    this.sequenceId,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      assetId: json['assetId'],
      balance: json['balance'],
      reserve: json['reserve'],
      lastUpdate: json['lastUpdate'],
      sequenceId: json['sequenceId'],
    );
  }
}

class BalanceListModel {
  List<Balance> balances;

  BalanceListModel({this.balances});

  factory BalanceListModel.fromJson(Map<String, dynamic> json) {
    List<Balance> balances = [];
    json['balances'].forEach((e) => balances.add(Balance.fromJson(e)));

    return BalanceListModel(
      balances: balances,
    );
  }
}
