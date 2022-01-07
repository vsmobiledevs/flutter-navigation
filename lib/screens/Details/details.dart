import 'package:flutter/material.dart';
import 'package:flutter_app/colors.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  List<String> imagePath = ["assets/images/shoe_blue.png", "assets/images/shoe_green.png", "assets/images/shoe_yellow.png", "assets/images/shoe_pink.png"];
  var selectedColor = Colors.blue;
  var isFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              header(),
              hero(),
              Expanded(child: section()),
              bottomButton()
            ],
          ),
        ));
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
        iconSize: 32,
        color: Colors.black,
        splashColor: Colors.white,
        onPressed: (){
          Navigator.of(context).pop();
      }
    ),
          Column(
            children: const [
              Text("MEN'S ORIGINAL",
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16)),
              Text("Smith Shoes",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24))
            ],
          ),
          Image.asset(
            "assets/images/bag_button.png",
            height: 34,
            width: 34,
          ),
        ],
      ),
    );
  }

  Widget hero() {
    return Stack(
      children: [
        Expanded(
          child: Container(
            height: 220,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Image.asset(selectedColor == Colors.blue ? "assets/images/shoe_blue.png" : selectedColor == Colors.green ? "assets/images/shoe_green.png" : selectedColor == Colors.yellow ? "assets/images/shoe_yellow.png" : "assets/images/shoe_pink.png",fit: BoxFit.fitWidth,)),
        ),
        Positioned(
            top: 10,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: (){
                setState(() {
                  isFavourite = !isFavourite;
                });
              },
              child: Image.asset(
                isFavourite ? "assets/images/heart_icon.png" : "assets/images/heart_icon_disabled.png",
                height: 34,
                width: 34,
              ),
            ))
      ],
    );
  }

  Widget section() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In "
                "rutrum at ex non eleifend. Aenean sed eros a purus "
                "gravida scelerisque id in orci. Mauris elementum id "
                "nibh et dapibus. Maecenas lacinia volutpat magna",
            textAlign: TextAlign.justify,
            style:
            TextStyle(color: AppColor.bodyColor, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 20),
          property()
        ],
      ),
    );
  }

  Widget property() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Color",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              children: List.generate(
                  4,
                      (index) => GestureDetector(
                    onTap: (){
                      print("index $index clicked");
                      setState(() {
                        selectedColor = index == 0 ? Colors.blue : index == 1 ? Colors.green : index == 2 ? Colors.yellow : Colors.pink;
                      });
                    },
                    child: Container(
                      padding:EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 10),
                      height: 34,
                      width: 34,
                      child: selectedColor == colors[index]? Image.asset("assets/images/checker.png") : SizedBox(),
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(17)),
                    ),
                  )),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Size",
                style: TextStyle(
                    color: AppColor.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
            const SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                color: AppColor.bodyColor.withOpacity(0.10),
                child: const Text(
                  "10.2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        )
      ],
    );
  }

  Widget bottomButton() {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlatButton(
              onPressed: () {},
              child: const Text(
                "Add to Bag +",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              )),
          const Text(r"$95", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 28))
        ],
      ),
    );
  }
}
