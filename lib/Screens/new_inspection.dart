import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hash_mufattish/Providers/checklist_Provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:provider/provider.dart';

class NewInspection extends StatefulWidget {
  Map data;
  NewInspection({super.key, required this.data});

  @override
  State<NewInspection> createState() => _NewInspectionState();
}

class _NewInspectionState extends State<NewInspection> {
  String? selectedValue = "";
  List items = [];
  File? _image;
  bool isVisible = false;
  File? _certificate;
  bool isShow = false;

  Future pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        isVisible = true;
      });
    }
  }

  Future pickCertificate() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _certificate = File(pickedFile.path);
        isShow = true;
      });
      Navigator.of(context).pop(); // Close the current dialog
      _showImageDialog();
    }
  }

  void _showImageDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Use StatefulBuilder to update content in the dialog dynamically if needed
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min, // Use min to fit content size
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
                    onTap: (startLoading, stopLoading, btnState) {
                      pickCertificate();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: isShow,
                      child: Container(
                        height: 60,
                        child: _certificate != null
                            ? Image.file(_certificate!)
                            : Text('No image selected.'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Issue Date: "),
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Expiry Date: "),
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.white,
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none),
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
                  onTap: (startLoading, stopLoading, btnState) {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
    if (widget.data["tags"][0] != "") {
      items = widget.data["tags"][0].toString().split(",");
    }

    Provider.of<ChecklistProvider>(context, listen: false).additems(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
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
                      _showImageDialog();
                    },
                  ),
                ],
              ),
            ),
            Container(
              // color: Colors.blue,
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 2.7,
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
            SizedBox(
              height: 10,
            ),
            Text(
              "Checklist",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            items.isEmpty
                ? Container(
                    alignment: Alignment.center,
                    height: 170,
                    child: Text("No Data"),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          height: 85,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 9, right: 20),
                          child: _buildRadioButton(items[index]));
                    },
                  ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ArgonButton(
                width: MediaQuery.of(context).size.width,
                height: 50,
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
                onTap: (startLoading, stopLoading, btnState) {
                  pickImage();
                },
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Container(
                height: MediaQuery.of(context).size.height / 5,
                child: _image != null
                    ? Image.file(_image!)
                    : Text('No image selected.'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ArgonButton(
                width: MediaQuery.of(context).size.width,
                height: 50,
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 17),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<ChecklistProvider>(
              builder: (context, ChecklistProvider, child) {
                return GestureDetector(
                  onTap: () {
                    ChecklistProvider.changeValue(title, "Good");
                  },
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateProperty.all(Colors.green),
                        activeColor: Colors.green,
                        value: "Good",
                        groupValue: ChecklistProvider.items[title],
                        onChanged: (value) {
                          ChecklistProvider.changeValue(title, "Good");
                        },
                      ),
                      Text(
                        'Good',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                );
              },
            ),
            Consumer<ChecklistProvider>(
              builder: (context, ChecklistProvider, child) {
                return GestureDetector(
                  onTap: () {
                    ChecklistProvider.changeValue(title, "Bad");
                  },
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateProperty.all(Colors.red),
                        activeColor: Colors.red,
                        value: "Bad",
                        groupValue: ChecklistProvider.items[title],
                        onChanged: (value) {
                          ChecklistProvider.changeValue(title, "Bad");
                        },
                      ),
                      Text(
                        'Bad',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                );
              },
            ),
            Consumer<ChecklistProvider>(
              builder: (context, ChecklistProvider, child) {
                return GestureDetector(
                  onTap: () {
                    ChecklistProvider.changeValue(title, "N/A");
                  },
                  child: Row(
                    children: [
                      Radio(
                        fillColor: MaterialStateProperty.all(Colors.grey[800]),
                        activeColor: Colors.grey[800],
                        value: "N/A",
                        groupValue: ChecklistProvider.items[title],
                        onChanged: (value) {
                          ChecklistProvider.changeValue(title, "N/A");
                        },
                      ),
                      Text(
                        'N/A',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ],
    );
  }
}
