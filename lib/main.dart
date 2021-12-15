// Packages
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:bitsdojo_window/bitsdojo_window.dart";

// Providers
import "./provider/maingate_provider.dart";

// Components
import "./component/login_component.dart";
import "./component/registration_component.dart";

/*
  -- add to "windows/runner/main.cpp"
  #include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
  auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);
*/

// Main
void main() {
  const Map mainDict = {
    "appName": "appName",
    "appDesc": "appDesc"
  };
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainGate()
        )
      ],
      child: const Root(
        mainDict: mainDict,
      )
    )
  );
  doWhenWindowReady(() {
    appWindow.alignment = Alignment.center;
    appWindow.title = mainDict["appName"];
    const size = Size(1600, 900);
    appWindow.minSize = size;
    appWindow.size = size;
    appWindow.show();
  });
}

// Classes
class Root extends StatelessWidget {
  const Root({
    Key? key,
    required this.mainDict
  }) : super(key: key);

  final Map mainDict;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainDict["appName"],
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: "Square"
      ),
      home: Scaffold(
        body: WindowBorder(
          color: Colors.black,
          child: Column(
            children: [
              Header(
                mainDict: mainDict
              ),
              StatefulBuilder(
                builder: (ctx, _) {
                  if (context.watch<MainGate>().mainGateState == "registration") {
                    return Registration();
                  } else {
                    return Login();
                  }
                },
              )
            ],
          )
        )
      )
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.mainDict
  }) : super(key: key);

  final Map mainDict;

  @override
  Widget build(BuildContext context) {
    const double height = 40;
    const double btnSize = 20;
    final mainColor = Colors.blueGrey.shade100;
    const btnColor = Colors.black;

    void checkExit(BuildContext ctxMaster) {
      showDialog(
        context: ctxMaster,
        builder: (BuildContext ctxSlave) => AlertDialog(
          content: const Text(
            "어플리케이션을 종료할까요?",
            style: TextStyle(
              fontFamily: "Air"
            )
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(ctxSlave);
              },
            ),
            TextButton(
              child: const Text("Confirm"),
              onPressed: () {
                appWindow.close();
              }
            )
          ],
        )
      );
    }

    return SizedBox(
      height: height,
      child: Container(
        color: mainColor,
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16
                    ),
                    child: Text(
                      mainDict["appName"],
                      style: const TextStyle(
                        color: btnColor,
                        letterSpacing: 0,
                        fontFamily: "Roboto",
                        fontSize: btnSize * 0.75,
                        fontWeight: FontWeight.normal
                      )
                    )
                  ),
                  GestureDetector(
                    onPanStart: (_) {
                      appWindow.startDragging();
                    }
                  )
                ]
              )
            ),
            SizedBox(
              height: height,
              child: Row(
                children: [
                  MaterialButton(
                    child: const Icon(
                      Icons.remove,
                      size: btnSize,
                      color: btnColor,
                    ),
                    minWidth: 0,
                    shape: const CircleBorder(),
                    hoverColor: mainColor,
                    onPressed: () {
                      appWindow.minimize();
                    }
                  ),
                  MaterialButton(
                    child: const Icon(
                      Icons.settings_overscan,
                      size: btnSize,
                      color: btnColor,
                    ),
                    minWidth: 0,
                    shape: const CircleBorder(),
                    hoverColor: mainColor,
                    onPressed: () {
                      appWindow.maximizeOrRestore();
                    }
                  ),
                  MaterialButton(
                    child: const Icon(
                      Icons.close,
                      size: btnSize,
                      color: btnColor
                    ),
                    minWidth: 0,
                    shape: const CircleBorder(),
                    hoverColor: mainColor,
                    onPressed: () {
                      checkExit(context);
                    }
                  ),
                  const SizedBox(
                    width: 8
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}