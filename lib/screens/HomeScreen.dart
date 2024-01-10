import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolistgroup/models/authenticated_user.dart';
import 'package:todolistgroup/screens/Calendar.dart';
import 'package:todolistgroup/services/ToDoService.dart';
import 'package:todolistgroup/theme/Palette.dart';
import 'package:todolistgroup/widgets/ListWidget.dart';
import 'package:todolistgroup/widgets/drawerWidget.dart';
import 'package:todolistgroup/widgets/searchField.dart';
import 'package:todolistgroup/widgets/taskState.dart';
import 'package:todolistgroup/widgets/task_progress_card.dart';

class HomeScreenPage extends StatefulWidget {
  static String routeName = "/home";
  HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {

  List<String> userData = [];
  User user = User();

  List todos = [];
  void loadDataUser() async {
    SharedPreferences prefs =  await SharedPreferences.getInstance();

    userData = prefs.getStringList("authUser")!;
    print(userData);
    setState(() {
      user.fullname = userData[0];
      user.email = userData[1];
    });

  }
  @override
  void initState() {
    super.initState();
    loadDataUser();
    ToDoService.getAllTodos().then((value) {
      setState(() {
        print(value);
        todos = value;
      });
    });
  }

  AdvancedDrawerController drawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {

    return AdvancedDrawer(
      //openRatio: 0.5,
      controller: drawerController,
      backdropColor: Colors.deepPurpleAccent.shade700,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: (){
                  drawerController.showDrawer();
                },
                child: SvgPicture.asset(
                    "assets/icons/apps.svg",
                  colorFilter: ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn) ,
                ),
              ),
            ),
          actions: [
            Padding(
                padding: EdgeInsets.only(top: 0, right: 8),
            child: Icon(Icons.notifications_none_rounded, color: Colors.grey[400]! ,size:33 ,))
          ]
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  RichText(
                      text: TextSpan(
                          text: "Hi, ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[500]
                        ),
                        children: [
                          TextSpan(
                            text: user.fullname,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[300]
                            )
                          )
                        ]
      
                      )
                  ),
                  Text(
                      'Be productive today',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      )
                  ),
                  SearchField(),
                  TaskProgressCard(),
                  TaskState(),
                  SizedBox(height: 10,),
                  Text(
                    "Tasks",
                    style: GoogleFonts.gabriela(
                        fontSize: 17,
                        fontWeight: FontWeight.bold),),
                  ListWidget(trailing: '1 day left', title: 'Something likr that', subtitle: 'Un peu de blablabla !',),
                  ListWidget(trailing: '3 day left', title: 'Other thing', subtitle: 'Boff hein !!!!!!',),
                  ListWidget(trailing: '4 day left', title: 'TO-DO', subtitle: 'Beaucoup de blablablabla')

                ],
              ),
            )
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
