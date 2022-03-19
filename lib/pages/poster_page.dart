import 'package:flutter/material.dart';
import 'package:orilla_fresca/helpers/constants.dart';
import 'package:orilla_fresca/helpers/utils.dart';
import 'package:orilla_fresca/models/poster_content.dart';
import 'package:orilla_fresca/widgets/icon_font_widget.dart';
import 'package:orilla_fresca/widgets/login_button_widget.dart';
import 'package:orilla_fresca/widgets/main_app_bar_widget.dart';

import 'categories_page.dart';

class PosterPage extends StatefulWidget {

  @override
  State<PosterPage> createState() => _PosterPageState();
}

class _PosterPageState extends State<PosterPage> {

  List<PosterContent> posterContent = Utils.getPosterContent();

  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    pageIndex = page;
                  });
                },
                children: List.generate(
                  posterContent.length,
                  (index) =>
                  Container(
                    padding: EdgeInsets.all(40.0),
                    margin: EdgeInsets.only(left: 40.0, right: 40.0, top: 30, bottom: 20.0,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.GREEN.withOpacity(0.3),
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconFont(
                                iconName: IconFontHelper.LOGO,
                                color: AppColors.GREEN,
                                size: 40.0,
                              ),
                            ),
                            Image.asset('assets/images/${posterContent[index].image}.png'),
                            SizedBox(height: 40.0),
                            Text(
                              posterContent[index].message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.GREEN,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: index == posterContent.length - 1,
                          child: LoginButton(
                            name: 'To know more',
                            nameColor: Colors.white,
                            backgroundColor: AppColors.DARK_GREEN,
                            border: BorderSide(
                              color: AppColors.DARK_GREEN,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => CategoriesPage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                posterContent.length,
                (index) => GestureDetector(
                  onTap: () {
                    pageController.animateTo(
                      MediaQuery.of(context).size.width * index,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: AppColors.GREEN,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 6,
                          color: pageIndex == index
                              ? Color(0xFFC1E09E)
                              : Theme.of(context).canvasColor),
                    ),
                  ),
                ),
              ),
            ),
            LoginButton(
              name: 'Go to the store',
              nameColor: Colors.white,
              backgroundColor: AppColors.GREEN,
              border: BorderSide(
                color: AppColors.GREEN,
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CategoriesPage()));
              },
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
