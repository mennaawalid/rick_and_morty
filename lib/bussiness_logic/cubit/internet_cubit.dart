import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit(this.connectivity) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connection) {
      if (connection == ConnectivityResult.wifi ||
          connection == ConnectivityResult.mobile) {
        emitInternetConnected();
      } else if (connection == ConnectivityResult.none) {
        emitInternetDisonnected();
      } else {
        emit(
          InternetLoading(),
        );
      }
    });
  }

  void emitInternetConnected() {
    emit(
      InternetConnected(),
    );
  }

  void emitInternetDisonnected() {
    emit(
      InternetDisconnected(),
    );
  }

  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
