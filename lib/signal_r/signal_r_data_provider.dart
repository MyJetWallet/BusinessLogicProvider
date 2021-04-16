import 'dart:async';

import 'package:business_logic_provider/constants.dart';
import 'package:business_logic_provider/signal_r/model/models.dart';
import 'package:signalr_core/signalr_core.dart';

class SignalRDataProvider {
  HubConnection signalRConnection;
  StreamController<BalanceListModel> _walletBalancesStreamController =
      StreamController<BalanceListModel>();
  Stream<BalanceListModel> get getWalletBalancesStream => _walletBalancesStreamController.stream;
  AssetListModel assetsModel;
  String token;

  SignalRDataProvider({this.token});

  Future<void> initSignalR() async {
    signalRConnection = HubConnectionBuilder().withUrl(signalRUrl).build();
    signalRConnection.onclose(
        (error) => print('HubConnection: Connection closed with $error'));
    await signalRConnection.start();
    signalRConnection.invoke(initCommand, args: [token]);
    signalRConnection.on(assetListCommand, (data) {
      assetsModel = AssetListModel.fromJson(data.first);
    });
    signalRConnection.on(walletBalancesCommand, (data) {
      _walletBalancesStreamController
          .add(BalanceListModel.fromJson(data.first));
    });
  }
}
