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
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ArgonButton(
                width: 180,
                height: 50,
                borderRadius: 8.0,
                elevation: 10,
                color: Colors.green[600],
                child: Text(
                  "View Certificate",
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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Equipment\nName: ${widget.data["equipment_name"] ?? ""}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Location\nDescription: ",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Equipment\nCategory: ${widget.data["equipment_category"] ?? ""}",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Equipment\nSubCategory: ${widget.data["equipment_sub_category"] ?? ""}",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Equipment\nType: ${widget.data["equipment_type"] ?? ""}",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text(
                          "Last Inspection\nDate: ",
                          style: TextStyle(fontSize: 18),
                        )
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
