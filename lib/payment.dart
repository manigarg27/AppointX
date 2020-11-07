import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Payment extends StatefulWidget {
  String fees = '';

  Payment(String fees) {
    this.fees = fees;
  }
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_BoH0fsMnn5hkhw",
      "amount": num.parse(widget.fees) * 100,
      "name": "Sample App",
      "description": "Payment for the some random product",
      "prefill": {"contact": "2323232323", "email": "shdjsdh@gmail.com"},
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Pament success");
    Toast.show("Pament success", context);
  }

  void handlerErrorFailure() {
    print("Pament error");
    Toast.show("Pament error", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: Color(0xFF7380F2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.0,
                ),
                Text(
                  'You have to pay Rs. ',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
                ),
                Text(widget.fees,
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0)),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            RaisedButton(
              color: Color(0xFF7380F2),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 20.0),
                ),
              ),
              onPressed: () {
                openCheckout();
              },
            )
          ],
        ),
      ),
    );
  }
}
