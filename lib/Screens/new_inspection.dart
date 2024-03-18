import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hash_mufattish/LanguageTranslate/app_localizations.dart';
import 'package:hash_mufattish/Providers/checklist_Provider.dart';
import 'package:hash_mufattish/Screens/HomeScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewInspection extends StatefulWidget {
  Map data;
  int id;
  String name;
  String company;
  String branch;
  String email;
  String password;
  String image;
  String contact;

  NewInspection({
    super.key,
    required this.data,
    required this.id,
    required this.name,
    required this.company,
    required this.branch,
    required this.email,
    required this.password,
    required this.image,
    required this.contact,
  });

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
  TextEditingController issueDate = TextEditingController();
  TextEditingController expiryDate = TextEditingController();

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
                      AppLocalizations.of(context)!.translate("Add Picture"),
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
                            : Text(AppLocalizations.of(context)!
                                .translate('No image selected.')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(AppLocalizations.of(context)!
                            .translate("Issue Date: ")),
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.white,
                          child: TextField(
                            controller: issueDate,
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
                        Text(AppLocalizations.of(context)!
                            .translate("Expiry Date: ")),
                        Container(
                          height: 40,
                          width: 100,
                          color: Colors.white,
                          child: TextField(
                            controller: expiryDate,
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
                    AppLocalizations.of(context)!.translate("Submit"),
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

  Future saveCheckList() async {
    if (_certificate!.path.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Certficate Image is required")));
    } else if (_image!.path.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Attach Image is required")));
    } else {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://inspectosafe.bssstageserverforpanels.xyz/api/equipment_inspection'),
      );

      var image1 = await http.MultipartFile.fromPath(
          'certificate_img', _certificate!.path);
      var image2 =
          await http.MultipartFile.fromPath('current_image', _image!.path);
      request.files.add(image1);
      request.files.add(image2);
      request.fields['equipment_id'] = widget.data["equipment_id"];
      request.fields['checklist_id'] = widget.data["checklist_id"];
      request.fields['issuance_date'] = issueDate.text;
      request.fields['expiry_date'] = expiryDate.text;
      request.fields['inspector_name'] = widget.name;

      int index = 1;
      Provider.of<ChecklistProvider>(context, listen: false)
          .items
          .forEach((key, value) {
        request.fields['tag' + index.toString()] = value;

        index += 1;
      });
      var response = await request.send();
      var responseString = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseString);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(jsonResponse["message"])));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              id: widget.id,
              name: widget.name,
              company: widget.company,
              branch: widget.branch,
              email: widget.email,
              password: widget.password,
              image: widget.image,
              contact: widget.contact,
            ),
          ),
          (Route<dynamic> route) => false,
        );
      } else if (jsonResponse["success"] == false) {
        print(jsonResponse);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(jsonResponse.toString())));
      }
    }
  }

  @override
  void initState() {
    if (widget.data["tags"].toString().isNotEmpty) {
      items = widget.data["tags"] as List;
    }
    print(items);
    Provider.of<ChecklistProvider>(context, listen: false).additems(items);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    widget.data["equipment_img"] ??
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
                      AppLocalizations.of(context)!
                          .translate("Add Certificate"),
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
                              AppLocalizations.of(context)!
                                  .translate("Description: "),
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
                              widget.data["description"] ??
                                  AppLocalizations.of(context)!
                                      .translate("No data"),
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
                              AppLocalizations.of(context)!
                                  .translate("Location Description: "),
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
                              AppLocalizations.of(context)!
                                  .translate("No Data"),
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
                              AppLocalizations.of(context)!
                                  .translate("Equipment: "),
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
                              widget.data!["equipment_name"] ??
                                  AppLocalizations.of(context)!
                                      .translate("No data"),
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
                              AppLocalizations.of(context)!
                                  .translate("Equipment Type: "),
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
                              widget.data["equipment_type"] ??
                                  AppLocalizations.of(context)!
                                      .translate("No Data"),
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
                              AppLocalizations.of(context)!
                                  .translate("Equipment Family: "),
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
                              AppLocalizations.of(context)!
                                  .translate("No Data"),
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
                              AppLocalizations.of(context)!
                                  .translate("Last Inspection Date: "),
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
                              AppLocalizations.of(context)!
                                  .translate("Not Available"),
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
              AppLocalizations.of(context)!.translate("Checklist"),
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
                  AppLocalizations.of(context)!.translate("ATTACH IMAGE"),
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
                    : Text(AppLocalizations.of(context)!
                        .translate('No image selected.')),
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
                  AppLocalizations.of(context)!.translate("SAVE"),
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
                  saveCheckList();
                },
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
                  ChecklistProvider.changeValue(
                      title, AppLocalizations.of(context)!.translate("Good"));
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
                      AppLocalizations.of(context)!.translate('Good'),
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
                      AppLocalizations.of(context)!.translate('Bad'),
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
                      AppLocalizations.of(context)!.translate('N/A'),
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
