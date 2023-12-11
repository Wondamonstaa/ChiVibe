import 'package:flutter/material.dart';
import 'package:project2/storage/ds.dart';

class Restaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RectangularBox(
              tag: 'Gibsons Italian',
              image: 'images/gibsons.jpg',
              name: 'Gibsons Italian',
              address: '91028 N Rush St, Chicago, IL 60611',
              boxWidth: 400.0,
              boxHeight: 100.0,
            ),
            SizedBox(height: 20.0),
            RectangularBox(
              tag: 'Sushi San',
              image: 'images/sushisan.avif',
              name: 'Sushi San',
              address: '63 W Grand Ave, Chicago, IL 60654',
              boxWidth: 400.0,
              boxHeight: 100.0,
            ),
            SizedBox(height: 20.0),
            RectangularBox(
              tag: 'Bellevue',
              image: 'images/bellevue.avif',
              name: 'Bellevue',
              address: '1031 N Rush St, Chicago, IL 60611',
              boxWidth: 400.0,
              boxHeight: 100.0,
            ),
            SizedBox(height: 20.0),
            RectangularBox(
              tag: 'Hugo Frog Bar',
              image: 'images/hugofrog.png',
              name: 'Hugo Frog Bar',
              address: '1024 N Rush St, Chicago, IL 60611',
              boxWidth: 400.0,
              boxHeight: 100.0,
            ),
            SizedBox(height: 20.0),
            RectangularBox(
              tag: 'Maple & Ash',
              image: 'images/maple.png',
              name: 'Maple & Ash',
              address: '8 W Maple St, Chicago, IL 60610',
              boxWidth: 400.0,
              boxHeight: 100.0,
            ),
            SizedBox(height: 100.0),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.0), // Add margin to move the FloatingActionButton lower
        child: FloatingActionButton(
          onPressed: () {
            final snackBar = SnackBar(
              content: Text('You are viewing the Dining tab.'),
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  // Some action
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Icon(Icons.info),
        ),
      ),
    );
  }
}

class RectangularBox extends StatefulWidget {
  final String tag;
  final String image;
  final String name;
  final String address;
  final double boxWidth;
  final double boxHeight;

  RectangularBox({
    required this.tag,
    required this.image,
    required this.name,
    required this.address,
    required this.boxHeight,
    required this.boxWidth,
  });

  @override
  _RectangularBoxState createState() => _RectangularBoxState();
}

class _RectangularBoxState extends State<RectangularBox> {
  int likeCount = 0;
  int dislikeCount = 0;

  void handleLikeButtonPress() {
    setState(() {
      likeCount++;
    });
  }

  void handleDislikeButtonPress() {
    setState(() {
      dislikeCount++;
    });
  }

  Future<void> showBoxClickedMessage() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Yay!"),
          content: Text("You clicked on ${widget.name}"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showBoxClickedMessage();
        Navigator.pushNamed(
          context,
          '/nextScreenTransition',
          arguments: Data(widget.name, widget.image, '', widget.address),
        );
      },
      child: Hero(
        tag: widget.tag,
        child: Stack(
          children: <Widget>[
            Container(
              width: widget.boxWidth,
              height: widget.boxHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(5.0, 1.0),
                    blurRadius: 7.0,
                    spreadRadius: 3.0,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: widget.boxHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(1.0),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            widget.address,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 10.0,
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: handleLikeButtonPress,
                    enableFeedback: true,
                  ),
                  Text('$likeCount'),
                  IconButton(
                    icon: Icon(Icons.thumb_down),
                    onPressed: handleDislikeButtonPress,
                    enableFeedback: true,
                  ),
                  Text('$dislikeCount'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

