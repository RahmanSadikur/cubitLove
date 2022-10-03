import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState {
  init,
  lost,
  gained,
}

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubcription;
  InternetCubit() : super(InternetState.init) {
    connectivitySubcription =
        connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        emit(InternetState.gained);
      } else {
        emit(InternetState.lost);
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubcription?.cancel();
    return super.close();
  }
}
