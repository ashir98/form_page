// ignore_for_file: prefer_const_constructors

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Form Page',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),

                      // FIRST NAME
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "First Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: firstName,
                        ),
                      ),

                      //LAST NAME
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: lastName,
                        ),
                      ),

                      //EMAIL
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          cursorHeight: 22,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_rounded),
                            hintText: "Enter Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: email,
                        ),
                      ),

                      // DOB
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Enter DOB",
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: dateController,
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (pickedDate != null) {
                              String formatedDate =
                                  DateFormat("yyyy-MM-dd").format(pickedDate);

                              setState(() {
                                dateController.text = formatedDate.toString();
                              });
                            } else {}
                          },
                        ),
                      ),
                     
                      // GENDER RADIO BUTTONS
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Row(
                          children: [
                            Text(
                              'Gender:',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Male',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              ),
                            ),
                            Radio(
                                value: 1,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value as int;
                                  });
                                }),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                'Female',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              ),
                            ),
                            Radio(
                                value: 2,
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value as int;
                                  });
                                })
                          ],
                        ),
                      ),
                    
                      
                      // SUBMIT BUTTON
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(100, 50),
                          maximumSize: Size(150, 75),
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),

                          side: BorderSide(
                            width: 500
                          )

                        ),
                        onPressed: (){}, 
                        child: Text('SUBMIT'))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
