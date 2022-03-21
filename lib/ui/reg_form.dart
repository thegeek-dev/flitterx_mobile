// @dart=2.9
import 'package:flitterx_mobile/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegForm extends StatefulWidget {
  const RegForm({Key key}) : super(key: key);

  @override
  State<RegForm> createState() => _RegFormState();
}

class _RegFormState extends State<RegForm> {
  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        backgroundColor: Colors.white,
        textColor: Colors.black,
        msg: "SUCCESS: " + response.paymentId,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        toastLength: Toast.LENGTH_SHORT);
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_uG45wjGqdwarFo',
      'amount': 9900,
      'currency': 'INR',
      'name': 'Neeraj Patel',
      'description': 'MANIT',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '918770741112', 'email': 'njp2804@gmail.com'},
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

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
                    openCheckout();
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
