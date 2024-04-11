import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherExample extends StatelessWidget {
  const UrlLauncherExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Url Launcher Example'
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.blue,
              onPressed: () {
                _launchURL(
                    'fb://facewebmodal/f?href=https://www.facebook.com/google',
                    'https://www.facebook.com/google'
                );
              },
              icon: const Icon(
                Icons.facebook,
                size: 32,
              ),
            ),
            IconButton(
              color: Colors.blue,
              onPressed: () {
                _launchURL(
                    'https://www.instagram.com/google',
                    'https://www.instagram.com/google/'
                );
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 32,
              ),
            ),
            IconButton(
              color: Colors.blue,
              onPressed: () {
                _launchURL(
                    'https://google.in',
                    'https://google.in'
                );
              },
              icon: const Icon(
                Icons.mail_rounded,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String url, String fallbackUrl) async {

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    await launchUrl(Uri.parse(fallbackUrl));
  }
}