import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class NewInspection extends StatefulWidget {
  Map data;
  NewInspection({super.key, required this.data});

  @override
  State<NewInspection> createState() => _NewInspectionState();
}

class _NewInspectionState extends State<NewInspection> {
  int? selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            // color: Colors.blue[100],
            height: MediaQuery.of(context).size.height / 5,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "https://hashbaqala.bssstageserverforpanels.xyz/upload/profileImage/user.png",
                  scale: 5,
                ),
                ArgonButton(
                  width: 180,
                  height: 50,
                  borderRadius: 8.0,
                  elevation: 10,
                  color: Colors.green[600],
                  child: Text(
                    "Add Certificate",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  // loader: Container(
                  //   padding: EdgeInsets.all(10),
                  //   child: SpinKitRotatingCircle(
                  //     color: tWhite,
                  //     // size: loaderWidth ,
                  //   ),
                  // ),
                  onTap: (startLoading, stopLoading, btnState) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // Use StatefulBuilder to update content in the dialog dynamically if needed
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize
                                    .min, // Use min to fit content size
                                children: <Widget>[
                                  ArgonButton(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    borderRadius: 8.0,
                                    elevation: 10,
                                    color: Colors.blue,
                                    child: Text(
                                      "Add Picture",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // loader: Container(
                                    //   padding: EdgeInsets.all(10),
                                    //   child: SpinKitRotatingCircle(
                                    //     color: tWhite,
                                    //     // size: loaderWidth ,
                                    //   ),
                                    // ),
                                    onTap: (startLoading, stopLoading,
                                        btnState) {},
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Issue Date: "),
                                        Container(
                                          height: 40,
                                          width: 100,
                                          color: Colors.white,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder:
                                                    InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Expiry Date: "),
                                        Container(
                                          height: 40,
                                          width: 100,
                                          color: Colors.white,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder:
                                                    InputBorder.none),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                ArgonButton(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  borderRadius: 8.0,
                                  elevation: 10,
                                  color: Colors.green[600],
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  // loader: Container(
                                  //   padding: EdgeInsets.all(10),
                                  //   child: SpinKitRotatingCircle(
                                  //     color: tWhite,
                                  //     // size: loaderWidth ,
                                  //   ),
                                  // ),
                                  onTap:
                                      (startLoading, stopLoading, btnState) {},
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height / 3,
            // color: Colors.green[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Description: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Fire Estinguisher",
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
                  height: 25,
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
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "IT Room",
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
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Equipment: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Fire Equipment",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Equipment Type: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Fire Safety",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Equipment Family: ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "Fire Equipment",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 25,
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
                          padding: EdgeInsets.only(left: 15),
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
          Container(
            padding: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 3.4,
            // color: Colors.blue[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Checklist",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Speed",
                        style: TextStyle(fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 1;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                    activeColor: Colors.green,
                                    value: 1,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'Good',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 2;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.red),
                                    activeColor: Colors.red,
                                    value: 2,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'Bad',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 3;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateProperty.all(
                                        Colors.grey[800]),
                                    activeColor: Colors.grey[800],
                                    value: 3,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'N/A',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Temperature",
                        style: TextStyle(fontSize: 17),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 1;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.green),
                                    activeColor: Colors.green,
                                    value: 1,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'Good',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 2;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor:
                                        MaterialStateProperty.all(Colors.red),
                                    activeColor: Colors.red,
                                    value: 2,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'Bad',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedValue = 3;
                              });
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Radio(
                                    fillColor: MaterialStateProperty.all(
                                        Colors.grey[800]),
                                    activeColor: Colors.grey[800],
                                    value: 3,
                                    groupValue: selectedValue,
                                    onChanged: (int? value) {},
                                  ),
                                  Text(
                                    'N/A',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 90,
                //   alignment: Alignment.centerLeft,
                //   padding: EdgeInsets.only(right: 15),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Temperature",
                //         style: TextStyle(fontSize: 17),
                //       ),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 selectedValue = 1;
                //               });
                //             },
                //             child: Container(
                //               child: Row(
                //                 children: [
                //                   Radio(
                //                     fillColor:
                //                         MaterialStateProperty.all(Colors.green),
                //                     activeColor: Colors.green,
                //                     value: 1,
                //                     groupValue: selectedValue,
                //                     onChanged: (int? value) {},
                //                   ),
                //                   Text(
                //                     'Good',
                //                     style: TextStyle(fontSize: 17),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 selectedValue = 2;
                //               });
                //             },
                //             child: Container(
                //               child: Row(
                //                 children: [
                //                   Radio(
                //                     fillColor:
                //                         MaterialStateProperty.all(Colors.red),
                //                     activeColor: Colors.red,
                //                     value: 2,
                //                     groupValue: selectedValue,
                //                     onChanged: (int? value) {},
                //                   ),
                //                   Text(
                //                     'Bad',
                //                     style: TextStyle(fontSize: 17),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 selectedValue = 3;
                //               });
                //             },
                //             child: Container(
                //               child: Row(
                //                 children: [
                //                   Radio(
                //                     fillColor: MaterialStateProperty.all(
                //                         Colors.grey[800]),
                //                     activeColor: Colors.grey[800],
                //                     value: 3,
                //                     groupValue: selectedValue,
                //                     onChanged: (int? value) {},
                //                   ),
                //                   Text(
                //                     'N/A',
                //                     style: TextStyle(fontSize: 17),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 17,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.red[800],
              child: Text(
                "ATTACH IMAGE",
                style: TextStyle(color: Colors.white),
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
            padding: const EdgeInsets.all(5.0),
            child: ArgonButton(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 17,
              borderRadius: 8.0,
              elevation: 10,
              color: Colors.green[600],
              child: Text(
                "SAVE",
                style: TextStyle(color: Colors.white),
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
        ],
      ),
    );
  }
}
