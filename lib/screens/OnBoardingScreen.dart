import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:todolistgroup/screens/LoginScreen.dart';
import 'package:todolistgroup/screens/SignUpScreen.dart';
import 'package:todolistgroup/screens/WelcomeScreen.dart';
import 'package:todolistgroup/theme/Palette.dart';

class OnBoardingScreenPage extends StatefulWidget {
  const OnBoardingScreenPage({super.key});

  static String routeName = "/onboarding";

  @override
  State<OnBoardingScreenPage> createState() => _OnBoardingScreenPageState();
}

class _OnBoardingScreenPageState extends State<OnBoardingScreenPage> {

  late PageController _pageController;

  final _elements = [
    (
    'Manage your tasks',
    "You can easily manage all of your daily tasks in UpToDo ",
    Colors.deepPurple,
    'taskManagement.png'
    ),
    (
    'Create daily routine',
    "In Uptodo  you can create your personalized routine to stay productive",
    Colors.blueAccent,
    'dailyRoutine.png'
    ),
    (
    'Organize your tasks',
    "You can organize your daily tasks by adding your tasks into separate categories",
    Colors.indigo,
    'taskOrganization.png'
    ),
  ];

  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    _pageController.addListener((){
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: /*SafeArea(
        child: Column(
          children: [
            Expanded(
                child: PageView(
                  controller: _pageController,
                  children: List.generate(_elements.length, (index) {
                    var (title, description, color, image) = _elements[index];
                    return Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 300,
                              child: Image.asset("assets/images/$image") ,
                            ),

                            Text(
                              title,
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),

                          ],

                        ),
                      ),
                    );
                  }),
                )
            ),
            PageIndicators(currentPage: _currentPage, totalPages: _elements.length),
            Center(
              child: Container(
                height: 150,
                child:
                _currentPage == 3 ?
                  Row(
                  children: [

                      Text(
                      'Swip to left',
                      style: GoogleFonts.lobster(
                        fontSize: 26,
                      ),

                    ),

                      Icon(
                        Icons.double_arrow,
                        color: Colors.grey,
                      )


                  ],
                ) : 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.orangeColor,
                              foregroundColor: Palette.titleColor
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, LoginScreenPage.routeName);
                          },
                          child: Text("Login")
                      ),
                      SizedBox(width: 25,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.orangeColor,
                            foregroundColor: Palette.titleColor
                          ),
                          onPressed: (){
                            Navigator.pushNamed(context, SignUpScreen.routeName);
                          },
                          child: Text("Register")
                      ),
                    ],
                
                )
              ),
            )
          ],
        ) ,
      ) */
      IntroductionScreen(
        pages: List.generate(_elements.length, (index) {
          var (title, description, color, image) = _elements[index];

          return PageViewModel(
            titleWidget: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ) ,
            ),
            body: description,
            image: Image.asset(
                "assets/images/$image",

            ),
            decoration: PageDecoration(
              pageMargin: const EdgeInsets.symmetric(vertical: 50),
              imageFlex: 2,
              bodyTextStyle: GoogleFonts.dmSerifDisplay(
                color: Colors.grey[400],
                fontSize: 20,
                fontStyle: FontStyle.italic
              )
            )

          );
        }),
        showSkipButton: false,
        showDoneButton: true,
        showBackButton: true,
        next: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Next',),
            Icon(Icons.navigate_next)
          ],
        ),
        done: const Text("Get Started"),
        back: const Text("Back"),
        onDone: (){
          Navigator.pushNamed(context, WelcomeScreen.routeName);
        },
        doneStyle: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Palette.buttonColor),
          foregroundColor: MaterialStatePropertyAll(Colors.white)
        ),

      ),

    );
  }
}

