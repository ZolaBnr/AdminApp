import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../popups/loaders.dart';



class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus); //_updatersGroupIds
  }
  ///Update the connection status based on changes is connectivity and show a relevant popup for no internet connection
  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    if (result.isNotEmpty) {
      _connectionStatus.value = result.first;
      if (result.first == ConnectivityResult.none) {
        TLoaders.warningSnackBar(title: 'No Internet Connection');
      }
    }
  }

  /// Check the internet connection status
  /// Returns 'true' if connected, 'false' otherwise
  Future<bool> isConnected() async {
    try {
      if (_connectionStatus.value == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}