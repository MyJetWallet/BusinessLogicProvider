library business_logic_provider;

import 'package:business_logic_provider/signal_r/model/models.dart';
import 'package:business_logic_provider/signal_r/signal_r_data_provider.dart';

class BusinessLogicProvider {
  SignalRDataProvider _signalRDataProvider;
  Stream<BalanceListModel> get walletBalancesStream =>
      _signalRDataProvider.getWalletBalancesStream;

  Future<void> init(String token) async {
    _signalRDataProvider = SignalRDataProvider(token: token);
    await _signalRDataProvider.initSignalR();
  }
}
