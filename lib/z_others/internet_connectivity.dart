import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class InternetConnectivityWidget extends StatelessWidget {
  const InternetConnectivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet Connectivity Example'),
      ),
      body: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            // No connectivity
            return const Center(
              child: Text('No internet connection'),
            );
          } else if (snapshot.data == ConnectivityResult.none) {
            // No internet connection
            return const Center(
              child: Text('No internet connection'),
            );
          } else {
            // Connected to the internet, you can return your UI here
            return const Center(
              child: Text('Connected to the internet'),
            );
          }
        },
      ),
    );
  }
}
