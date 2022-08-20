import 'package:flutter/material.dart';

class AddRecordItem extends StatefulWidget {
  const AddRecordItem({Key? key}) : super(key: key);

  @override
  State<AddRecordItem> createState() => _AddRecordItemState();
}

class _AddRecordItemState extends State<AddRecordItem> {
  String? recordCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Add Record',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            Text(
              'Select product image',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Select image source'),
                          content:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            ListTile(
                              title: Text('Select from Camera'),
                            ),
                            Divider(),
                            ListTile(
                              title: Text('Select from Gallery'),
                            )
                          ]),
                        );
                      });
                },
                child: Image.asset('assets/placeholder_image.png')),
            TextFormField(
                decoration: InputDecoration(
              labelText: 'Name',
            )),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Date',
              ),
            ),
            DropdownButtonFormField(
              hint: Text('Select a category'),
              value: recordCategory,
              items: [
                DropdownMenuItem(
                  child: Text('Harvest'),
                  value: 'Harvest',
                ),
                DropdownMenuItem(
                  child: Text('Activity'),
                  value: 'Activity',
                ),
              ],
              onChanged: (value) {
                value = recordCategory;
              },
            ),
            SizedBox(
              height: 80,
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Color(0xff144916)),
              onPressed: () {},
              child: Text(
                'Add Record',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
