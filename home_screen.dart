import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/core/text_styles.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_calls_page/home_calls_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_chats_page/home_chats_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_groups_page/home_groups_page.dart';
import 'package:whatsapp/screens/home_screen/home_pages/home_status_page/home_status_page.dart';

import '../../core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
        appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("WhatsApp"),
        actions: [
        InkWell(
        onTap: ()
    {
            showDialog(
                context: context,
                builder: (ctx) {
                  return Dialog(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.yellow,
                    ),
                  );
                });
            },
          child: Container(width: 40, child: Icon(Icons.access_alarm)))
    ,
    InkWell(
    onTap: () {
    showModalBottomSheet(
    context: context,
    builder: (ctx) {
    return Container(
    height: 400,
    width: double.infinity,
    color: Colors.yellow,
    );
    });
    },
    child: Container(width: 40, child: Icon(Icons.camera_alt))),
    InkWell(
    onTap: () async {
    DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(Duration(days: 30)));
    if (selectedDate != null) {
    TimeOfDay? selectedTime = await showTimePicker(
    context: context, initialTime: TimeOfDay.now());
    if (selectedTime != null) {
    DateTime fullDateAndTime = DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    selectedTime.hour,
    selectedTime.minute);
    print(fullDateAndTime.toString());
    }
    } else {
    print("please select date");
    }
    },
    child: Container(width: 40, child: Icon(Icons.search))),
    InkWell(
    onTap: () async {
    String? option = await showMenu(
    context: context,
    position: RelativeRect.fromDirectional(
    textDirection: TextDirection.ltr,
    start: 1,
    end: 0,
    top: 0,
    bottom: 0),
    items: [
    PopupMenuItem<String>(
    value: "One",
    child: Text('New group'),
    ),
    PopupMenuItem(
    value: "Two",
    child: Text('New broadcast'),
    ),
    PopupMenuItem(
    value: "Three",
    child: Text('Linked devices'),
    ),
    ]);
    if (option != null) {
    switch (option) {
    case "One":
    Navigator.of(context).pushNamed("/");
    break;
    case "Two":
    print("Here is Two");
    break;
    case "Three":
    print("Here is Three");
    break;
    default:
    print("Here is default");
    }
    } else {
    print("No Action");
    }
    },
    child:
    Container(width: 40, child: Icon(Icons.more_vert_rounded))),
    ],
    bottom: TabBar(
    tabs: [
    Container(
    height: 40,
    width: screenSize.width * .07,
    child: Icon(Icons.groups)),
    Container(
    height: 40,
    width: screenSize.width * .20,
    alignment: Alignment.center,
    child: Text("Chats".toUpperCase())),
    Container(
    height: 40,
    width: screenSize.width * .20,
    alignment: Alignment.center,
    child: Text("Status".toUpperCase())),
    Container(
    height: 40,
    width: screenSize.width * .20,
    alignment: Alignment.center,
    child: Text("Calls".toUpperCase())),
    ],
    indicatorWeight: 3,
    isScrollable: true,
    indicatorColor: Colors.white,
    ),
    ),
    body: TabBarView(children: [
    HomeGroupsPage(),
    HomeChatsPage(),
    HomeStatusPage(),
    HomeCallsPage(),
    ]),
    )
    ,
    );
  }
  }
