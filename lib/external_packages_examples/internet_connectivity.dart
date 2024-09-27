import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivityWidget extends StatefulWidget {
  const InternetConnectivityWidget({Key? key}) : super(key: key);

  @override
  _InternetConnectivityWidgetState createState() => _InternetConnectivityWidgetState();
}

class _InternetConnectivityWidgetState extends State<InternetConnectivityWidget> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    // Subscribe to the onConnectivityChanged stream
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
      });
    });
    // Perform initial connectivity check
    _checkInternetConnectivity();
  }

  Future<void> _checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  @override
  void dispose() {
    // Cancel the subscription to avoid memory leaks
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connectivity Example'),
      ),
      body: Center(
        child: _isConnected
            ? const Text('Connected to the internet')
            : const Text('No internet connection'),
      ),
    );
  }
}
