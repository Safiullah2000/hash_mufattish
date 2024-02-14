import 'package:flutter/material.dart';
import 'package:hash_mufattish/HomeScreen.dart';
import 'package:hash_mufattish/app_localizations.dart';
import 'package:hash_mufattish/local_Provider.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          Text(
            AppLocalizations.of(context)!.translate('Sign In'),
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: AppLocalizations.of(context)!.translate('Email')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 56,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        AppLocalizations.of(context)!.translate('Password')),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              borderRadius: 10.0,
              elevation: 10,
              color: Colors.black,
              borderSide: BorderSide(color: Colors.blue),
              child: Text(
                AppLocalizations.of(context)!.translate('SIGN IN'),
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
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(const Locale('en'));
                },
                child: Text(
                  "English",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<LocaleProvider>(context, listen: false);
                  provider.setLocale(const Locale('ar'));
                },
                child: Text(
                  "عربی",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
