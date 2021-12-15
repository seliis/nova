// Packages
import "package:flutter/material.dart";
import "package:provider/provider.dart";

// Providers
import "../provider/maingate_provider.dart";

// Classes
class Registration extends StatelessWidget {
  Registration({
    Key? key
  }) : super(key: key);

  final TextEditingController contMail      = TextEditingController();
  final TextEditingController contForename  = TextEditingController();
  final TextEditingController contSurname   = TextEditingController();
  final TextEditingController contId        = TextEditingController();
  final TextEditingController contPw        = TextEditingController();
  final TextEditingController contConfirmPw = TextEditingController();

  Column getTextFormField(String headText, String hintText, TextEditingController textEditingController, bool obscureText) {
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.transparent
      ),
    );

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4
            ),
            child: Text(
              headText,
              style: TextStyle(
                color: Colors.pink.shade900,
                fontWeight: FontWeight.w400,
                fontFamily: "Square",
                fontSize: 14
              )
            )
          )
        ), 
        TextFormField(
          controller: textEditingController,
          obscureText: obscureText,
          cursorWidth: 2,
          cursorColor: Colors.black,
          cursorRadius: const Radius.circular(3),
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Square",
            fontWeight: FontWeight.w400
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
              fontFamily: "Square",
              fontWeight: FontWeight.w400,
              fontSize: 12
            )
          )
        )
      ]
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8
                    ),
                    child: Text(
                      "Registration",
                      style: TextStyle(
                        color: Colors.pink.shade900,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Roboto",
                        fontSize: 24
                      )
                    )
                  ) 
                ),
                const SizedBox(
                  height: 24
                ),
                getTextFormField("E-Mail", "username@domain.com", contMail, false),
                const SizedBox(
                  height: 6
                ),
                Row(
                  children: [
                    Flexible(
                      child: getTextFormField("Forename", "Ada", contForename, false)
                    ),
                    const SizedBox(
                      width: 16
                    ),
                    Flexible(
                      child: getTextFormField("Surname", "Lovelace", contSurname, false)
                    )
                  ],
                ),
                const SizedBox(
                  height: 6
                ),
                getTextFormField("Identification", "Identification", contId, false),
                const SizedBox(
                  height: 6
                ),
                getTextFormField("Password", "Password", contPw, true),
                const SizedBox(
                  height: 6
                ),
                getTextFormField("Confirm Password", "Confirm Password", contConfirmPw, true),
                const SizedBox(
                  height: 24
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: ElevatedButton(
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            fontWeight: FontWeight.w100
                          ),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(135, 45)
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blueGrey.shade300
                          )
                        ),
                        onPressed: () {
                          context.read<MainGate>().setMainGateToLogin();
                        }
                      ),
                    ),
                    const SizedBox(
                      width: 8
                    ),
                    Flexible(
                      child: ElevatedButton(
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontWeight: FontWeight.w100
                          ),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            const Size(135, 45)
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.pink.shade900
                          )
                        ),
                        onPressed: () {}
                      ),
                    )
                  ],
                )
              ],
            )
          )
        )
      )
    );
  }
}