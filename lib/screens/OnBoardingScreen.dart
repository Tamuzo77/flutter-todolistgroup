import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolistgroup/screens/LoginScreen.dart';
import 'package:todolistgroup/screens/SignUpScreen.dart';
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
    'Explore endless Possibilities',
    "Experience a seamless shopping journey with Yazida. Discover a wide range of products and enjoy personalized recommendations",
    Colors.deepPurple,
    'loginEmote.png'
    ),
    (
    'Uncover Unique Treasures',
    "Dive into our diverse collection of fashion, electronics, home decor, and more",
    Colors.blueAccent,
    'todo-1.png'
    ),
    (
    'Easy Ordering and Checkout',
    "Simplify your shopping experience with secure checkout and hassie-free payment for swift delivery",
    Colors.indigo,
    'todoprogress.png'
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
      body: SafeArea(
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
      ) ,

    );
  }
}

class PageIndicators extends StatelessWidget {
  final int totalPages;

  final int currentPage;

  PageIndicators({
    super.key,
    required this.currentPage,
    required this.totalPages
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int i = 0; i <totalPages; i++)
            Container(
              width: i == this.currentPage ? 30 : 10,
              height: 10,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: i == this.currentPage ? Colors.deepOrange : Colors.grey
              ),
              //child: Text(i.toString()),
            )
        ],
      ),
    );
  }
}
