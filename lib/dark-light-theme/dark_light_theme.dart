import 'package:flutter/material.dart';

class DarkLightTheme extends StatefulWidget {
  const DarkLightTheme({super.key});

  @override
  State<DarkLightTheme> createState() => _DarkLightThemeState();
}

class _DarkLightThemeState extends State<DarkLightTheme> {

  bool flag = true; // only for first run
  late bool isLight;
  ThemeMode _themeMode = ThemeMode.system;

  // bool isLight = ThemeMode.system == ThemeMode.dark; // this is not correct

  // Initialization method to determine the system theme only for the first time
  void initialize(BuildContext context) {
    flag = false;
    isLight = MediaQuery.of(context).platformBrightness == Brightness.light;
  }

  void changeTheme() {
    setState(() {
      isLight = !isLight;
      if(isLight){
        _themeMode = ThemeMode.light;
      }else{
        _themeMode = ThemeMode.dark;
      }
    });
  }

  void changeToLight() {
    setState(() {
      isLight = true;
      _themeMode = ThemeMode.light;
    });
  }

  void changeToDark() {
    setState(() {
      isLight = false;
      _themeMode = ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(flag){
      initialize(context);
    }

    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      // standard dark theme
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Light and Dark mode example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLight ? 'This is Light Mode' : 'This is Dark mode',
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              const Text(
                'Choose your theme:',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Change theme & rebuild to
                  // show it using these buttons
                  ElevatedButton(
                    onPressed: () {
                      changeToLight();
                    },
                    style: ButtonStyle(
                      backgroundColor: isLight
                          ? const MaterialStatePropertyAll<Color>(Colors.green)
                          : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
                    ),
                    child: const Text(
                      'Light theme',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      changeToDark();
                    },
                    style: ButtonStyle(
                      backgroundColor: isLight
                          ? const MaterialStatePropertyAll<Color>(Colors.green)
                          : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
                    ),
                    child: const Text(
                      'Dark theme',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: (){
                  changeTheme();
                },
                style: ButtonStyle(
                  backgroundColor: isLight
                      ? const MaterialStatePropertyAll<Color>(Colors.green)
                      : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
                ),
                child: Icon(
                  isLight
                      ? Icons.nightlight
                      : Icons.sunny,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class DarkLightTheme extends StatefulWidget {
//   const DarkLightTheme({Key? key}) : super(key: key);
//
//   @override
//   _DarkLightThemeState createState() => _DarkLightThemeState();
// }
//
// class _DarkLightThemeState extends State<DarkLightTheme> {
//   late bool isLight;
//   ThemeMode _themeMode = ThemeMode.system;
//
//   void initialize(BuildContext context) {
//     isLight = MediaQuery.of(context).platformBrightness == Brightness.light;
//   }
//
//   void changeTheme() {
//     setState(() {
//       isLight = !isLight;
//       _themeMode = isLight ? ThemeMode.light : ThemeMode.dark;
//     });
//   }
//
//   void changeToMode(ThemeMode mode) {
//     setState(() {
//       isLight = mode == ThemeMode.light;
//       _themeMode = mode;
//     });
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_themeMode == ThemeMode.system) {
//       initialize(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.green),
//       darkTheme: ThemeData.dark(),
//       themeMode: _themeMode,
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Light and Dark mode example'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.78,
//                 color: Colors.red,
//                 child: const Text(
//                     'This is for testing only'
//                 ),
//               ),
//               Text(
//                 isLight ? 'This is Light Mode' : 'This is Dark mode',
//                 style: const TextStyle(
//                   fontSize: 22,
//                 ),
//               ),
//               const Text(
//                 'Choose your theme:',
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () => changeToMode(ThemeMode.light),
//                     style: ButtonStyle(
//                       backgroundColor: isLight
//                           ? const MaterialStatePropertyAll<Color>(Colors.green)
//                           : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
//                     ),
//                     child: const Text('Light theme'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => changeToMode(ThemeMode.dark),
//                     style: ButtonStyle(
//                       backgroundColor: isLight
//                           ? const MaterialStatePropertyAll<Color>(Colors.green)
//                           : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
//                     ),
//                     child: const Text('Dark theme'),
//                   ),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: changeTheme,
//                 style: ButtonStyle(
//                   backgroundColor: isLight
//                       ? const MaterialStatePropertyAll<Color>(Colors.green)
//                       : MaterialStatePropertyAll<Color>(Colors.grey.shade600),
//                 ),
//                 child: Icon(
//                   isLight ? Icons.nightlight : Icons.sunny,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
