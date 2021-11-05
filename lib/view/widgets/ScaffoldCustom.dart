import 'package:carousel_slider/carousel_slider.dart';
import 'package:china_web/Model/dataClass/MenuTopModel.dart';
import 'package:china_web/config/ThemeData.dart';
import 'package:china_web/view/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key}) : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  MenuTopModel? hoberItem;

  List<String> slideTop = [
    "https://758301.com/static/FYGJ/admin/20210609/e269e436d264d766f583b677069288.png",
    "https://758301.com/static/FYGJ/admin/20210608/c240844a304e1debe329b3f2c5ab04.png",
    "https://758301.com/static/FYGJ/admin/20210608/4ab8a5f4f0fb94c8682f1e6d7c1cc4.png",
    "https://758301.com/static/FYGJ/admin/20210705/b9ca34305810299fcfd49a918e8f51.png"
  ];
  final CarouselController _controller = CarouselController();
  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 75),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16/9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index,reason){
                        setState(() {
                          currentIndex = index;
                        });
                      }
                    ),
                    items: slideTop.map((e){
                      return Container(
                        width: size.width,
                        child: Image.network(e,fit: BoxFit.fill,),
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: slideTop.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : mainColor)
                                  .withOpacity(currentIndex == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.add),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                CustomAppBar(
                  onMenuHover: (MenuTopModel? menuTop){
                     hoberItem = menuTop;
                     setState(() {

                     });
                  },
                ),
                hoberItem!=null? hoberItem!.images.isEmpty? Container():
                Container(
                  height: 245,
                  width: size.width,
                  color: Colors.white,
                  padding: EdgeInsets.only(bottom: 10,top: 10),
                  child: InkWell(
                    hoverColor: Colors.amber,
                    onHover: (bool val){
                      if(!val){
                        setState(() {
                          hoberItem = null;
                        });
                      }
                    },
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        "https://758301.com/static/FYGJ/AG/31/3a8e1909912db0dd9a4eb9ae0b5487.png",
                        "https://758301.com/static/FYGJ/BG/3/8f7e7a4b9bb6eea47251a160f23d1a.png",
                        "https://758301.com/static/FYGJ/YB/22/bf78187df305387c0ca15df543e9b4.png",
                      ].map((e) =>
                        Container(
                          margin: EdgeInsets.only(left: 5,right: 5),
                          child: Image.network(e,),
                        )
                      ).toList(),
                    ),
                  ),
                ):Container()
              ],
            ),

          ],
        )
      ),
    );
  }
}

typedef OnMenuHover(MenuTopModel menuTopModel);