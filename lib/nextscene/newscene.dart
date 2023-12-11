import 'package:flutter/material.dart';
import 'package:project2/storage/ds.dart';

// Storage for images that will be used to flip them once a user clicks on the icon
final Map<String, String> imageMap = {
  'Shedd Acquarium': 'images/jelly.gif',
  'Chicago Bulls': 'images/bennybull.gif',
  'Chicago Bears': 'images/chibears.gif',
  'Chicago Blackhawks': 'images/bh.jpg',
  'Chicago Fire': 'images/chifire.jpeg',
  'White Sox': 'images/whitesox.gif',
  'Verse: Art of the Future': 'images/chiverse.png',
  '360 Chicago': 'images/chi360.jpg',
  'Field Museum': 'images/museum.gif',
  'Magnificent Mile': 'images/magmile.jpg',
  'Gibsons Italian': 'images/steak.jpg',
  'Sushi San': 'images/san.jpg',
  'Bellevue': 'images/bv.png',
  'Hugo Frog Bar': 'images/frog.jpg',
  'Maple & Ash': 'images/maple.jpg',
};

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key});

  @override
  State<NextScreen> createState() => _ScreenState();
}

class _ScreenState extends State<NextScreen> {
  static const routeName = '/nextScreenTransition';
  bool _clicked = false;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;

    // Retrieve the image from the list of items
    String image = imageMap[args.title] ?? 'images/jelly.gif';

    // Flip the image once the user clicks on the icon
    void _flip() {
      setState(() {
        _clicked = !_clicked;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[75],
      appBar: AppBar(
        title: Text(
          args.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 5.0,
                color: Colors.black,
              ),
            ],
          ),
        ),
        toolbarHeight: 170,
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(0)),
            image: DecorationImage(
              image: AssetImage('images/chinight.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: args.title,
              child: Container(
                width: 380,
                height: 380,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    //If the action was not done yet, the image will be selected from the top storage that maps the title to the image
                    image: !_clicked ? AssetImage(image) : AssetImage(args.photo),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(3.0, 1.0),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            Text(
              args.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black,
                fontFamily: 'Roboto',
              ),
            ),
            const Padding(padding: EdgeInsets.all(7.0)),
            Icon(
              Icons.location_on,
            ),
            const Padding(padding: EdgeInsets.all(7.0)),
            Text(
              args.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.all(30.0)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _flip,
        backgroundColor: Colors.black54,
        child: const Icon(Icons.info),
      ),
    );
  }
}
