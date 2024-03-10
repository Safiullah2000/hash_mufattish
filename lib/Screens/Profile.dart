import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hash_mufattish/LanguageTranslate/app_localizations.dart';
import 'package:hash_mufattish/Providers/editProfileProvider.dart';
import 'package:hash_mufattish/Screens/HomeScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  int id;
  String name;
  String company;
  String branch;
  String email;
  String password;
  String image;
  String contact;
  Profile({
    super.key,
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
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  File? _imageFile;
  final picker = ImagePicker();
  bool imageChanged = false;
  bool isLoading = false;

  @override
  void initState() {
    print(widget.image);
    downloadImageFromURL(widget.image);
    name.text = widget.name;
    company.text = widget.company;
    branch.text = widget.branch;
    contact.text = widget.contact;
    email.text = widget.email;
    password.text = widget.password;
    super.initState();
  }

  Future<void> downloadImageFromURL(String imageUrl) async {
    try {
      var response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        // Create a temporary file to store the downloaded image
        var tempDir = await Directory.systemTemp;
        var tempImagePath = '${tempDir.path}/temp_image.jpg';
        var file = File(tempImagePath);

        // Write the downloaded image data to the temporary file
        await file.writeAsBytes(response.bodyBytes);

        Provider.of<EditProfileProvider>(context, listen: false)
            .changePath(file.path);
        // Return the downloaded image file
      } else {
        print('Failed to download image');
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        widget.image = _imageFile!.path;
        imageChanged = true;
      });
    }
  }

  Future<void> login() async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://inspectosafe.bssstageserverforpanels.xyz/api/login'),
          body: {
            "email": email.text,
            "password": password.text,
          });
      Map<dynamic, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (jsonResponse["success"] == true) {
        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text(jsonResponse["message"])));
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              id: jsonResponse["user"]["id"],
              name: jsonResponse["user"]["fullname"],
              company: "",
              branch: "",
              email: jsonResponse["user"]["email"],
              password: password.text,
              image: jsonResponse["user"]["profile_img"],
              contact: jsonResponse["user"]["contact_number"],
            ),
          ),
          (Route<dynamic> route) => false,
        );
      } else if (jsonResponse["success"] == false) {
        if (jsonResponse["message"] is String) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(jsonResponse["message"])));
        } else if (jsonResponse["message"]["email"] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(jsonResponse["message"]["email"][0])));
        } else if (jsonResponse["message"]["password"] != null) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(jsonResponse["message"]["password"][0])));
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> profileUpdate() async {
    try {
      if (name.text == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Name Field is required")));
      } else if (contact.text == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email Field is required")));
      } else if (email.text == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Email Field is required")));
      } else if (password.text == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password Field is required")));
      } else {
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'https://inspectosafe.bssstageserverforpanels.xyz/api/profile_update'),
        );

        var image = await http.MultipartFile.fromPath(
            'profile_img',
            imageChanged != true
                ? Provider.of<EditProfileProvider>(context, listen: false).path
                : widget.image);
        request.files.add(image);
        request.fields['id'] = widget.id.toString();
        request.fields['fullname'] = name.text;
        request.fields['email'] = email.text;
        request.fields['contact_number'] = contact.text;
        request.fields['password'] = password.text;
        request.fields['confirm_password'] = password.text;

        var response = await request.send();
        var responseString = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseString);
        if (response.statusCode == 200) {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(jsonResponse["message"])));
          login();
        } else if (jsonResponse["success"] == false) {
          print(jsonResponse);
          if (jsonResponse["message"] is String) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(jsonResponse["message"])));
          } else if (jsonResponse["message"]["email"] != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(jsonResponse["message"]["email"][0])));
          } else if (jsonResponse["message"]["password"] != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(jsonResponse["message"]["password"][0])));
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.translate('USER ACCOUNT'),
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => pickImage(),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    backgroundImage: imageChanged != true
                        ? NetworkImage(widget.image)
                        : FileImage(File(_imageFile!.path)) as ImageProvider,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Name'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Company'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: company,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Branch'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: branch,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Contact No'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: contact,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Email'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(3.0, 0, 0, 3),
                child: Text(
                  AppLocalizations.of(context)!.translate('Password'),
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: ArgonButton(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  borderRadius: 10.0,
                  elevation: 10,
                  color: Colors.black,
                  borderSide: BorderSide(color: Colors.blue),
                  child: Text(
                    AppLocalizations.of(context)!.translate('SAVE'),
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
                  onTap: (startLoading, stopLoading, btnState) async {
                    startLoading();
                    await profileUpdate();
                    stopLoading();
                    // Navigator.pushReplacement(context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
