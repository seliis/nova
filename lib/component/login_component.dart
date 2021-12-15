// Libraries
import "dart:ui";

// Packages
import "package:flutter/material.dart";
import "package:provider/provider.dart";

// Providers
import "../provider/maingate_provider.dart";

// Classes
class Login extends StatelessWidget {
  Login({
    Key? key
  }) : super(key: key);

  final TextEditingController contId = TextEditingController();
  final TextEditingController contPw = TextEditingController();

  TextFormField getTextFormField(String hintText, TextEditingController textEditingController, bool obscureText) {
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
    );

    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      cursorWidth: 6,
      cursorColor: Colors.black,
      cursorRadius: const Radius.circular(3),
      style: const TextStyle(
        fontSize: 28,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700,
        fontFeatures: [FontFeature.enable("dlig")]
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        border: borderStyle,
        fillColor: Colors.white,
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        hintStyle: const TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.normal,
          fontSize: 28
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Container(
          height: 600,
          width: 750,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.blueGrey.shade100
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 48
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Greetings, Nutritionist!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                    fontSize: 32
                  )
                ),
                const SizedBox(
                  height: 16
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Registration",
                      style: TextStyle(
                        color: Colors.pink.shade900,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                        fontSize: 16
                      ),
                    ),
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent
                      )
                    ),
                    onPressed: () {
                      context.read<MainGate>().setMainGateToRegistration();
                    }
                  )
                ),
                const SizedBox(
                  height: 16
                ),
                getTextFormField("Identification", contId, false),
                const SizedBox(
                  height: 16
                ),
                getTextFormField("Password", contPw, true),
                const SizedBox(
                  height: 16
                ),
                ElevatedButton(
                  child: const Text(
                    "Authorize",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w100,
                      fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink.shade900,
                    minimumSize: const Size(
                      double.infinity, 74
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                    )
                  ),
                  onPressed: () {
                    // Work-in-Progress
                  },
                )
              ],
            ),
          )
        )
      )
    );
  }
}