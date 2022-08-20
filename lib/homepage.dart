import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myproject/addrecorditem.dart';
import 'package:myproject/recorditem.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  // Color buttonColor = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title:
            const Text('FarmKeep', style: TextStyle(color: Color(0xff056608))),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddRecordItem(),
              ));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff056608),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(
                      text: 'Record Book for ',
                      style: TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                      text: 'Farm 1',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ])),
              TextButton(
                onPressed: (() {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: ((context) {
                        return Dialog(
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: QrImage(
                                      padding: EdgeInsets.all(8.0),
                                      data: 'This is a simple QR code',
                                      version: QrVersions.auto,
                                      size: 320,
                                      gapless: false,
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        'Scan QR Code to download record book',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        )),
                                  ),
                                  SizedBox(height: 8),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'close',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        );
                      }));
                }),
                style: TextButton.styleFrom(),
                child: Row(
                  children: [
                    Text(
                      'GENERATE QR CODE',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline),
                    ),
                    Icon(Icons.qr_code, color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          OrientationBuilder(builder: ((context, orientation) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return InkWell(
                  child: RecordItem(),
                );
              },
              itemCount: 10,
            );
          })),
        ],
      ),
    );
  }
}
