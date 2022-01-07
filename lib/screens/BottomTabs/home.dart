import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/screens/Details/details.dart';
import 'package:flutter_app/screens/Drawer/side_menu.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({this.title = ''});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imagesVisible = true;

  var cardContent = [];

  @override
  void initState() {
    var ran = Random();

    for (var i = 0; i < 5; i++) {
      var heading = '\$${(ran.nextInt(20) + 15).toString()}00 per month';
      var subheading =
          '${(ran.nextInt(3) + 1).toString()} bed, ${(ran.nextInt(2) + 1).toString()} bath, ${(ran.nextInt(10) + 7).toString()}00 sqft';
      var cardImage = NetworkImage(
          'https://source.unsplash.com/random/800x600?house&' +
              ran.nextInt(100).toString());
      var supportingText =
          'Beautiful home, recently refurbished with modern appliances...';
      var cardData = {
        'heading': heading,
        'subheading': subheading,
        'cardImage': cardImage,
        'supportingText': supportingText,
      };
      cardContent.add(cardData);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        appBar: _buildAppBar(),
        drawer: const SideMenu(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(widget.title == "" ? "Home" : widget.title),
        elevation: 0,
        actions: [
          Switch(
            value: imagesVisible,
            activeColor: Colors.white,
            onChanged: (bool switchState) {
              setState(() {
                imagesVisible = switchState;
              });
            },
          ),
        ]);
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:
            cardContent.map((cardData) => _buildCard(cardData)).toList(),
          )),
    );
  }

  Card _buildCard(Map<String, dynamic> cardData) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(cardData['heading']!),
              subtitle: Text(cardData['subheading']!),
              trailing: const Icon(Icons.favorite_outline),
            ),
            Visibility(
              visible: imagesVisible,
              child: SizedBox(
                height: 200.0,
                child: Ink.image(
                  image: cardData['cardImage']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(cardData['supportingText']!),
            ),
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('CONTACT AGENT'),
                  onPressed: () {/* ... */},
                ),
                TextButton(
                  child: const Text('LEARN MORE'),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailsPage(),
                        )
                    );
                  },
                )
              ],
            )
          ],
        ));
  }
}
