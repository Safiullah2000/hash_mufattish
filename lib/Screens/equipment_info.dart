import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class EquipementInfo extends StatefulWidget {
  Map data;
  EquipementInfo({super.key, required this.data});

  @override
  State<EquipementInfo> createState() => _EquipementInfoState();
}

class _EquipementInfoState extends State<EquipementInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            // color: Colors.blue[100],
            height: MediaQuery.of(context).size.height / 5,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  widget.data!["equipment_img"] ??
                      "https://hashbaqala.bssstageserverforpanels.xyz/upload/profileImage/user.png",
                  scale: 7,
                ),
                ArgonButton(
                  width: 180,
                  height: 50,
                  borderRadius: 8.0,
                  elevation: 10,
                  color: Colors.green[600],
                  child: Text(
                    "View Certificate",
                    style: TextStyle(color: Colors.white, fontSize: 15),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 1.7,
              // color: Colors.green[100],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Equipment\nName: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              widget.data!["description"] ?? "No data",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Location Description: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "No Data",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Equipment\nCategory: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              widget.data!["equipment_name"] ?? "No data",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Equipment\nType: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              widget.data!["equipment_type"] ?? "Fire Safety",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Equipment\nFamily: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "No Data",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Last Inspection Date: ",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Not Available",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
