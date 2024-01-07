import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todolistgroup/theme/Palette.dart';
import 'package:todolistgroup/widgets/drawerWidget.dart';

class Calendar extends StatelessWidget {
  Calendar({super.key});
  static String routeName = "/calendar";
  var currentDate =
      new DateFormat("MMMM, yyyy").format(DateTime.now()).toString();
  AdvancedDrawerController drawerController = AdvancedDrawerController();
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: drawerController,
      drawer: DrawerWidget(),
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            title: const Text('Calendrier'),
            expandedHeight: 200,
            centerTitle: true,
            pinned: true,
            leading: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () {
                  drawerController.showDrawer();
                },
                child: SvgPicture.asset(
                  "assets/icons/apps.svg",
                  colorFilter:
                      ColorFilter.mode(Colors.grey[400]!, BlendMode.srcIn),
                ),
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(top: 0, right: 8),
                  child: Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.grey[400]!,
                    size: 33,
                  ))
            ],
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: Palette.cardColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month, color: Colors.white),
                        Text(
                          currentDate,
                          style: GoogleFonts.gabriela(fontSize: 18),
                        ),
                      ],
                    ),
                    EasyDateTimeLine(
                      locale: 'fr',
                      initialDate: DateTime.now(),
                      headerProps: EasyHeaderProps(
                        showMonthPicker: false,
                        showHeader: false,
                      ),
                      timeLineProps: EasyTimeLineProps(),
                      dayProps: EasyDayProps(
                          todayHighlightColor: Colors.transparent,
                          borderColor: Colors.transparent,
                          dayStructure: DayStructure.dayStrDayNum,
                          activeDayStyle: DayStyle(
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              dayNumStyle: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                              dayStrStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          inactiveDayStyle: DayStyle(
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              dayNumStyle: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                              dayStrStyle: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey[700]))),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
            ),
          ),
        ]),
      ),
    );
  }
}
