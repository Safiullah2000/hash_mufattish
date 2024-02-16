import 'package:flutter/material.dart';
import 'package:hash_mufattish/app_localizations.dart';
import 'package:loading_icon_button/loading_icon_button.dart';

class Profile extends StatefulWidget {
  String name;
  String company;
  String branch;
  String email;
  String password;
  String image;
  String contact;
  Profile({
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
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController name = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    name.text = widget.name;
    company.text = widget.company;
    branch.text = widget.branch;
    contact.text = widget.contact;
    email.text = widget.email;
    password.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.black,
                backgroundImage: NetworkImage(widget.image),
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
            ArgonButton(
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
              onTap: (startLoading, stopLoading, btnState) {
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
