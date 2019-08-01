import 'package:flutter/material.dart';
import 'savedshoes.dart';

class Jordan5FilghtClub extends StatefulWidget {
  Jordan5FilghtClub({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Jordan5FilghtClubState createState() => _Jordan5FilghtClubState();
}

class _Jordan5FilghtClubState extends State<Jordan5FilghtClub> {
   bool _isSaved = false;
  void _toggleSaved() {
  setState(() {
    if (_isSaved) {
      _isSaved = true;
    } else {
      _isSaved = false;
    }
  });
}
   void _jordan5FlightClub() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('These are the Jordan 5 Flight Club. The are very comfortable and have lots of padding'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SavedShoesPage()))
                  },
            ),
              IconButton(
            icon: (_isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border)),
            onPressed: _toggleSaved,
            )
            ]
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {new GestureDetector(
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
  );
  }
}

class Jordan5Fear extends StatefulWidget {
  Jordan5Fear({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Jordan5FearState createState() => _Jordan5FearState();
}

class _Jordan5FearState extends State<Jordan5Fear> {
   bool _isSaved = false;
  void _toggleSaved() {
  setState(() {
    if (_isSaved) {
      _isSaved = true;
    } else {
      _isSaved = false;
    }
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SavedShoesPage()))
                  },
            ),
              IconButton(
            icon: (_isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border)),
            onPressed: _toggleSaved,
            )
            ]
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {new GestureDetector(
  onTap: () { return _jordan5Fear();
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
  );
  }
}

class Jordan1RoyalBlue extends StatefulWidget {
  Jordan1RoyalBlue({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Jordan1RoyalBlueState createState() => _Jordan1RoyalBlueState();
}

class _Jordan1RoyalBlueState extends State<Jordan1RoyalBlue> {
   bool _isSaved = false;
  void _toggleSaved() {
  setState(() {
    if (_isSaved) {
      _isSaved = true;
    } else {
      _isSaved = false;
    }
  });
}
void jordan1RoyalBlue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('These are the Jordan 1 royal blues. They are made mainly out of leather but they are still comfortable.'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SavedShoesPage()))
                  },
            ),
              IconButton(
            icon: (_isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border)),
            onPressed: _toggleSaved,
            )
            ]
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {new GestureDetector(
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
);
  }
}

class Jordan4Bred extends StatefulWidget {
  Jordan4Bred({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Jordan4BredState createState() => _Jordan4BredState();
}

class _Jordan4BredState extends State<Jordan4Bred> {
   bool _isSaved = false;
  void _toggleSaved() {
  setState(() {
    if (_isSaved) {
      _isSaved = true;
    } else {
      _isSaved = false;
    }
  });
}
void _jordan4Bred() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('These are the Jordan 5 fears'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.link),
              onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SavedShoesPage()))
                  },
            ),
              IconButton(
            icon: (_isSaved ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border)),
            onPressed: _toggleSaved,
            )
            ]
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {new GestureDetector(
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
);
}
}
