// @dart=2.9
import 'package:flitterx_mobile/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegForm extends StatefulWidget {
  const RegForm({Key key}) : super(key: key);

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  @override
  Widget build(BuildContext context) {
    Color accent = const Color.fromRGBO(0, 0, 75, 1);
    Size size = MediaQuery.of(context).size;
    Color bgColor = const Color.fromRGBO(0, 0, 20, 1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: accent,
          title: const Text("Register"),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: bgColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 9,
                ),
                const CustomTextField(
                  hint: " Full Name",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                const CustomTextField(
                  hint: " Discord Id",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                const CustomTextField(
                  hint: " Institute",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                const CustomTextField(
                  hint: " Game Id",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                const CustomTextField(
                  hint: " WhatsApp Number",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const RegForm()),
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    overlayColor: MaterialStateProperty.all(Colors.white54),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width / 1.5,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Proceed to Payment",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 12,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
