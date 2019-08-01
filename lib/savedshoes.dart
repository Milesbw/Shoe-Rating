import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:url_launcher/url_launcher.dart';

String dropdownValue = '';

class BookmarkStatus {
  static bool _jordan5FlightClubIsSaved = false;
  static bool _jordan5FearsIsSaved = false;
  static bool _jordan4Bred = false;
  static bool _jordan1RoyalBlue = false;
}

class SavedShoesPage extends StatefulWidget {
  SavedShoesPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _SavedShoesPageState();
}

class _SavedShoesPageState extends State<SavedShoesPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    _checkEmailVerification();
  }

  void _checkEmailVerification() async {
    _isEmailVerified = await widget.auth.isEmailVerified();
    if (!_isEmailVerified) {
      _showVerifyEmailDialog();
    }
  }

  void _resentVerifyEmail() {
    widget.auth.sendEmailVerification();
    _showVerifyEmailSentDialog();
  }

  void _showVerifyEmailDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Please verify account in the link sent to email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Resent link"),
              onPressed: () {
                Navigator.of(context).pop();
                _resentVerifyEmail();
              },
            ),
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Verify your account"),
          content:
              new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (BookmarkStatus._jordan5FlightClubIsSaved == true) {
      return new Scaffold(
          appBar: new AppBar(
            automaticallyImplyLeading: false,
            title: new Text('Saved Shoes'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExplorePage()))
                    },
              ),
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(fontSize: 17.0, color: Colors.red)),
                  onPressed: _signOut)
            ],
          ),
          body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: <Widget>[
              new Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset('assets/jordan5flightclub.jpg'),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Jordan 5'),
                          SizedBox(height: 8.0),
                          Text('Flight Club'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    } else {
      return new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: new Text('Saved Shoes'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ExplorePage()))
                  },
            ),
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.red)),
                onPressed: _signOut)
          ],
        ),
      );
    }
  }
}

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  void _toggleJordan5FlightClubSaved() {
    setState(() {
      if (BookmarkStatus._jordan5FlightClubIsSaved == false) {
        BookmarkStatus._jordan5FlightClubIsSaved = true;
        print('true');
      } else {
        BookmarkStatus._jordan5FlightClubIsSaved = false;
        print('false');
      }
    });
  }

  void _toggleJordan5FearSaved() {
    setState(() {
      if (BookmarkStatus._jordan5FearsIsSaved == false) {
        BookmarkStatus._jordan5FearsIsSaved = true;
        print('True');
      } else {
        BookmarkStatus._jordan5FearsIsSaved = false;
        print('false');
      }
    });
  }

  bool _jordan1RoyalBlueIsSaved = false;
  void _toggleJordan1RoyalBlueSaved() {
    setState(() {
      if (BookmarkStatus._jordan1RoyalBlue == false) {
        BookmarkStatus._jordan1RoyalBlue = true;
        print('True');
      } else {
        BookmarkStatus._jordan1RoyalBlue = false;
        print('false');
      }
    });
  }

  bool _jordan4BredIsSaved = false;
  void _toggleJordan4BredSaved() {
    setState(() {
      if (BookmarkStatus._jordan4Bred == false) {
        BookmarkStatus._jordan4Bred = true;
        print('True');
      } else {
        BookmarkStatus._jordan4Bred = false;
        print('false');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Explore Shoes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.folder_special),
            onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SavedShoesPage()))
                },
          ),
          PopupMenuButton<String>(
              icon: Icon(Icons.search),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              })
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              return _jordan5FlightClub();
            },
            child: new Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/jordan5flightclub.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Jordan 5'),
                        SizedBox(height: 8.0),
                        Text('Flight Club'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              return _jordan5Fear();
            },
            child: new Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/jordan5fear.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Jordan 5'),
                        SizedBox(height: 8.0),
                        Text('Fears'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              return _jordan4Bred();
            },
            child: new Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/jordan4bred.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Jordan 4'),
                        SizedBox(height: 8.0),
                        Text('Bred'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          new GestureDetector(
            onTap: () {
              return jordan1RoyalBlue();
            },
            child: new Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/jordan1royalblue.jpg'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Jordan 1'),
                        SizedBox(height: 8.0),
                        Text('Royal Blue'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _jordan5FlightClub() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text(
                  'These are the Jordan 5 Flight Club. The are very comfortable and have lots of padding'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () async {
                    if (await canLaunch(
                        "https://www.goat.com/sneakers/air-jordan-5-retro-red-suede-136027-602")) {
                      await launch(
                          "https://www.goat.com/sneakers/air-jordan-5-retro-red-suede-136027-602");
                    }
                  },
                ),
                IconButton(
                  icon: (BookmarkStatus._jordan5FlightClubIsSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
                  onPressed: _toggleJordan5FlightClubSaved,
                )
              ]);
        });
  }

  void _jordan5Fear() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('These are the Jordan 5 fears'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedShoesPage()))
                      },
                ),
                IconButton(
                  icon: (BookmarkStatus._jordan5FearsIsSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
                  onPressed: _toggleJordan5FearSaved,
                )
              ]);
        });
  }

  void jordan1RoyalBlue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text(
                  'These are the Jordan 1 royal blues. They are made mainly out of leather but they are still comfortable.'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedShoesPage()))
                      },
                ),
                IconButton(
                  icon: (_jordan1RoyalBlueIsSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
                  onPressed: _toggleJordan1RoyalBlueSaved,
                )
              ]);
        });
  }

  void _jordan4Bred() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('These are the Jordan 4 breds'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.link),
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SavedShoesPage()))
                      },
                ),
                IconButton(
                  icon: (_jordan4BredIsSaved
                      ? Icon(Icons.bookmark)
                      : Icon(Icons.bookmark_border)),
                  onPressed: _toggleJordan4BredSaved,
                )
              ]);
        });
  }
}

class Constants {
  static const String FirstItem = 'Basketball';
  static const String SecondItem = 'Football';
  static const String ThirdItem = 'Baseball';
  static const String FourthItem = 'Soccer';
  static const String FithItem = 'Running';
  static const String SixthItem = 'Casual';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
    FourthItem,
    FithItem,
    SixthItem,
  ];
}

void choiceAction(String choice) {
  if (choice == Constants.FirstItem) {
    print('I First Item');
  } else if (choice == Constants.SecondItem) {
    print('I Second Item');
  } else if (choice == Constants.ThirdItem) {
    print('I Third Item');
  } else if (choice == Constants.FourthItem) {
    print('I Third Item');
  } else if (choice == Constants.FithItem) {
    print('I Third Item');
  } else if (choice == Constants.SixthItem) {
    print('I Third Item');
  }
}
