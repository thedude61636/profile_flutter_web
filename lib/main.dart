import 'package:flutter_web/material.dart';
import 'package:profile/auto_size_text/auto_size_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          fontFamily: "Tajawal"),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 600,
            flexibleSpace: Stack(
              alignment: Alignment(0, 0),
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  "https://i.imgur.com/nQ53sF4.png",
                  fit: BoxFit.cover,
                  color: Colors.deepOrange,
                ),
                OverflowBox(
                  minHeight: 200,
                  maxHeight: 600,
                  alignment: Alignment.center,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText("Nael Al Abbasi",
                            maxLines: 1,
                            minFontSize: 34,
                            style: Theme.of(context).textTheme.display4),
                        AutoSizeText(
                          "Software Developer",
                          maxLines: 1,
                          minFontSize: 20,
                          style: Theme.of(context).textTheme.display1,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              <Widget>[
                Container(
                  height: 400,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          "https://i.imgur.com/9eW69Yx.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                AutoSizeText.rich(
                                  TextSpan(children: [
                                    TextSpan(text: "An "),
                                    TextSpan(
                                        text: "Awesome ",
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            inherit: true)),
                                    TextSpan(text: "Software Developer")
                                  ]),
                                  style: Theme.of(context).textTheme.display1,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                Container(
                                  width: 500,
                                  child: AutoSizeText(
                                    "I'm the kind of person you'd call if have a problem. I have experience with android, ios, web, desktop and flutter. I've organized several events that have to do with technology and software development and I made this website in one day using flutter web..",
                                    textAlign: TextAlign.justify,
                                    maxLines: 11,
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: <Widget>[
                      ContentCard(
                        title: "Mobile Apps",
                        icon: Icons.phone_android,
                        description:
                            "I make apps, I used to make android apps using java then I moved on to kotlin of course using mvvm and jetpack, more reacently I've switched to flutter and bloc",
                      ),
                      ContentCard(
                        title: "Event Organizing",
                        icon: Icons.event,
                        description:
                            "I'm one of the cofounders of codelab.camp, and GDGBaghdad, We've organized hundreds of events covering wide ranges of the software development field",
                      ),
                      ContentCard(
                        title: "Deskop Apps",
                        icon: Icons.desktop_windows,
                        description:
                            "I'm currently making dekstop apps using WPF deskop applications on windows Using C#",
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      CountCard(
                        icon: Icons.event_available,
                        count: "200+",
                        description: "Events organized",
                      ),
                      CountCard(
                        icon: Icons.computer,
                        count: "100+",
                        description: "Projects completed",
                      ),
                      CountCard(
                        icon: Icons.stars,
                        count: "39",
                        description: "Stars on github",
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  final String description;

  final IconData icon;

  final String title;

  const ContentCard(
      {Key key,
      @required this.description,
      @required this.icon,
      @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      height: 350,
      width: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 60,
                color: Colors.deepOrangeAccent,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.deepOrangeAccent),
              ),
              Expanded(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CountCard extends StatelessWidget {
  final String description;

  final IconData icon;

  final String count;

  const CountCard(
      {Key key,
      @required this.description,
      @required this.icon,
      @required this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 60,
                      color: Colors.yellow,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        count,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    )
                  ],
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.title,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
