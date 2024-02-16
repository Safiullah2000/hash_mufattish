import 'package:flutter/material.dart';
import 'package:hash_mufattish/Profile.dart';
import 'package:hash_mufattish/app_localizations.dart';
import 'package:hash_mufattish/login.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/HASH MUFATTISH.png",
            scale: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('NEW INSPECTION'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // loader: Container(
              //   padding: EdgeInsets.all(10),
              //   child: SpinKitRotatingCircle(
              //     color: tWhite,
              //     // size: loaderWidth ,
              //   ),
              // ),
              onTap: (startLoading, stopLoading, btnState) {
                _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                    context: context,
                    onCode: (code) {
                      setState(() {
                        this.code = code;
                        print(code);
                      });
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('EQUIPMENT INFO'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // loader: Container(
              //   padding: EdgeInsets.all(10),
              //   child: SpinKitRotatingCircle(
              //     color: tWhite,
              //     // size: loaderWidth ,
              //   ),
              // ),
              onTap: (startLoading, stopLoading, btnState) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('MY RECORD'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // loader: Container(
              //   padding: EdgeInsets.all(10),
              //   child: SpinKitRotatingCircle(
              //     color: tWhite,
              //     // size: loaderWidth ,
              //   ),
              // ),
              onTap: (startLoading, stopLoading, btnState) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('MY ACCOUNT'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // loader: Container(
              //   padding: EdgeInsets.all(10),
              //   child: SpinKitRotatingCircle(
              //     color: tWhite,
              //     // size: loaderWidth ,
              //   ),
              // ),
              onTap: (startLoading, stopLoading, btnState) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('LOGOUT'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              // loader: Container(
              //   padding: EdgeInsets.all(10),
              //   child: SpinKitRotatingCircle(
              //     color: tWhite,
              //     // size: loaderWidth ,
              //   ),
              // ),
              onTap: (startLoading, stopLoading, btnState) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            code ?? "No data",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
