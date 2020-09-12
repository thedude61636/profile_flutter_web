import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nael',
      darkTheme: ThemeData.dark().copyWith(
          backgroundColor: Colors.black, scaffoldBackgroundColor: Colors.black),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: "Tajawal",
      ),
      home: MyNewHomePage(),
    );
  }
}

class MyNewHomePage extends StatefulWidget {
  @override
  _MyNewHomePageState createState() => _MyNewHomePageState();
}

class _MyNewHomePageState extends State<MyNewHomePage> {
  PageController _pageController;
  int _oldPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      var newPage = _pageController.page.toInt();

      if (newPage != _oldPage) {
        print([newPage, _oldPage]);
        setState(() {
          _oldPage = newPage;
        });
      }
    });
  }

  List<Widget> pages = [
    Center(
      child: OneText(
        "Nael.one",
        minFontSize: 34,
      ),
    ),
    Center(
      child: OneText(
        "It's the one and only\nNael",
        minFontSize: 34,
      ),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OneText(
          "I fix problems\n Contact me if you need something fixed",
          minFontSize: 34,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OneButton(
            onPressed: () => openLink("mailto:me@nael.one"),
            child: OneText(
              "me@nael.one",
              minFontSize: 34,
            ),
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OneText(
          "Things I contributed to",
          minFontSize: 34,
        ),
        Wrap(
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            OneButton(
                onPressed: () =>
                    openLink("https://www.facebook.com/CodeLabBootcamp/"),
                child: OneText(
                  "Codelab",
                  minFontSize: 20,
                )),
            OneButton(
                onPressed: () =>
                    openLink("https://www.facebook.com/GDGBaghdad/"),
                child: OneText(
                  "GDG Baghdad",
                  minFontSize: 20,
                )),
            OneButton(
                onPressed: () => openLink("https://www.facebook.com/d3stud/"),
                child: OneText(
                  "d3Studio",
                  minFontSize: 20,
                )),
          ],
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OneText(
          "Latest thing I made",
          minFontSize: 34,
        ),
        OneButton(
          onPressed: () => openLink(
              "https://play.google.com/store/apps/details?id=com.ardunic.app"),
          child: OneText(
            "Ardunic",
            minFontSize: 32,
          ),
        ),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OneText(
          "Made With",
          minFontSize: 32,
        ),
        InkWell(
          child: OneText("🥔",minFontSize: 32,),
          onTap: () {
            openLink("https://www.youtube.com/watch?v=sm1qWQUEvfU");
          },
        ),
        InkWell(
          child: FlutterLogo(
            size: 32,
          ),
          onTap: () {
            openLink("https://flutter.dev");
          },
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            children: pages,
          ),
          if (_oldPage < pages.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: OneText("▼"),
                onPressed: () {
                  _pageController.animateToPage(
                      (_pageController.page + 1).toInt(),
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                },
              ),
            ),
          if (_oldPage == pages.length - 1)
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: OneText("▲"),
                onPressed: () {
                  _pageController.animateToPage((2).toInt(),
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                },
              ),
            )
        ],
      ),
    );
  }

  static Future openLink(String s) async {
    try {
      await launcher.launch(s);
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: "me@nael.one"));
      print(e);
    }
  }
}

class OneText extends StatelessWidget {
  final String text;
  final double minFontSize;

  const OneText(
    this.text, {
    Key key,
    this.minFontSize=32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(fontFamily: "Tajawal"),
      textAlign: TextAlign.center,
      minFontSize: minFontSize,
    );
  }
}

class OneButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const OneButton({Key key, this.onPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      highlightedBorderColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(1)),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 3,
        style: BorderStyle.solid,
      ),
      child: child,
    );
  }
}
