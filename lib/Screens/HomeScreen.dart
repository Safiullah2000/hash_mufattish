import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hash_mufattish/LanguageTranslate/app_localizations.dart';
import 'package:hash_mufattish/Screens/Profile.dart';
import 'package:hash_mufattish/Screens/equipment_info.dart';
import 'package:hash_mufattish/Screens/login.dart';
import 'package:hash_mufattish/Screens/new_inspection.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';

class HomeScreen extends StatefulWidget {
  String name;
  String company;
  String branch;
  String email;
  String password;
  String image;
  String contact;
  HomeScreen({
    super.key,
    required this.name,
    required this.company,
    required this.branch,
    required this.email,
    required this.password,
    required this.image,
    required this.contact,
  });

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
                // _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                //     context: context,
                //     onCode: (code) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => NewInspection(
                //             data: json.decode(code!),
                //           ),
                //         ),
                //       );
                //     });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => NewInspection(
                              data: {
                                "equipment_category": "ABC",
                                "equipment_sub_category": "Testing Murtaza",
                                "equipment_type": "123",
                                "checklist": "Application",
                                "equipment_name": "Safiullah App",
                                "description": "flutter",
                                "equipment_img":
                                    "https:\/\/inspectosafe.bssstageserverforpanels.xyz\/public\/uploads\/1cdc3a590b07bd3f750d836ad37ff3481709717790.jpg",
                                "tags": [
                                  "Speed, Color, Type, Intensity, Movement, Ahmed, Ali, Moon, watch"
                                ]
                              },
                            ))));
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
              onTap: (startLoading, stopLoading, btnState) {
                // _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                //     context: context,
                //     onCode: (code) {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => EquipementInfo(
                //             data: json.decode(code!),
                //           ),
                //         ),
                //       );
                //       // setState(() {
                //       //   this.code = code;
                //       //   print(code);
                //       // });
                //     });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EquipementInfo(
                      data: {
                        "equipment_category": "ABC",
                        "equipment_sub_category": "Testing Murtaza",
                        "equipment_type": "123",
                        "checklist": "Application",
                        "equipment_name": "Safiullah App",
                        "description": "flutter",
                        "equipment_img":
                            "https:\/\/inspectosafe.bssstageserverforpanels.xyz\/public\/uploads\/1cdc3a590b07bd3f750d836ad37ff3481709717790.jpg",
                        "tags": [
                          "Speed, Color, Type, Intensity, Movement, Ahmed, Ali, Moon, watch"
                        ]
                      },
                    ),
                  ),
                );
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: widget.name,
                              company: widget.company,
                              branch: widget.branch,
                              email: widget.email,
                              password: widget.password,
                              image: widget.image,
                              contact: widget.contact,
                            )));
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
