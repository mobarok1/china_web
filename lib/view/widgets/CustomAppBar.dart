import 'package:china_web/Model/dataClass/MenuTopModel.dart';
import 'package:china_web/config/ThemeData.dart';
import 'package:china_web/view/widgets/ScaffoldCustom.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final OnMenuHover onMenuHover;
  const CustomAppBar({Key? key,required this.onMenuHover}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late MenuTopModel selected;
  late MenuTopModel hoverItem;

  List<String> dropdownImages = [
    "https://758301.com/static/FYGJ/AG/31/3a8e1909912db0dd9a4eb9ae0b5487.png",
    "https://758301.com/static/FYGJ/BG/3/8f7e7a4b9bb6eea47251a160f23d1a.png",
    "https://758301.com/static/FYGJ/YB/22/bf78187df305387c0ca15df543e9b4.png",
    "https://758301.com/static/FYGJ/JDB/7/e131656b2a543d74627614d77eae4e.png",
  ];
  List<MenuTopModel> topMenu = [
    MenuTopModel(id: 0, name: "Front Page", icon: "https://758301.com/localStatic/img/header_icon_home_select.2d4031c.png",
      images: [
        "https://758301.com/static/FYGJ/BG/3/8f7e7a4b9bb6eea47251a160f23d1a.png",
        "https://758301.com/static/FYGJ/YB/22/bf78187df305387c0ca15df543e9b4.png",
        "https://758301.com/static/FYGJ/JDB/7/e131656b2a543d74627614d77eae4e.png",
      ],
    ),
    MenuTopModel(id: 1, name: "Physical Education", icon: "https://758301.com/localStatic/img/header_icon_sport_default.7c744f2.png",
      images: []
    ),
    MenuTopModel(id: 2, name: "Lottery", icon: "https://image.flaticon.com/icons/png/512/469/469686.png",
      images: [
      "https://758301.com/static/FYGJ/YB/22/bf78187df305387c0ca15df543e9b4.png",
      "https://758301.com/static/FYGJ/JDB/7/e131656b2a543d74627614d77eae4e.png",
      ],
    ),
    MenuTopModel(id: 3, name: "Electronic", icon: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Noun_Electronics_Icon_2108644.svg/1024px-Noun_Electronics_Icon_2108644.svg.png",
      images: [

      ]
    ),
    MenuTopModel(id: 4, name: "Chess", icon: "https://cdn-icons-png.flaticon.com/512/32/32386.png",
    images: [
      "https://758301.com/static/FYGJ/JDB/7/e131656b2a543d74627614d77eae4e.png",

    ]
    ),
    MenuTopModel(id: 5, name: "Gaming", icon: "https://icons-for-free.com/iconfiles/png/512/controller+game+gaming+icon-1320195548533902003.png",
    images: [
      "https://758301.com/static/FYGJ/AG/31/3a8e1909912db0dd9a4eb9ae0b5487.png",
      "https://758301.com/static/FYGJ/BG/3/8f7e7a4b9bb6eea47251a160f23d1a.png",
      "https://758301.com/static/FYGJ/YB/22/bf78187df305387c0ca15df543e9b4.png",
    ]
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = topMenu.first;
    hoverItem = topMenu.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.red,
      child: Card(
        elevation: .05,
        margin: EdgeInsets.only(left: 0,right: 0),
        shape: RoundedRectangleBorder(),
        child: Row(
          children: [
            SizedBox(
                width: 180,
                child: Image.network("https://758301.com/static/FYGJ/admin/20210615/be3ee882d80687ada8fb4db689eae3.png")
            ),
            Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: topMenu.map((e) {
                    bool active = (e.id == selected.id);
                    bool hover = (e.id == hoverItem.id);
                    return InkWell(
                        onHover: (bool val){
                          if(val){
                            hoverItem = e;
                          }else{
                            hoverItem = selected;
                          }
                          widget.onMenuHover(e);
                          setState(() {

                          });
                        },
                        onTap: (){
                          selected = e;
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 15,right: 10),
                          width: 130,
                          decoration: BoxDecoration(
                            border:active?Border(
                              bottom: BorderSide(
                                color: mainColor,
                                width: 3
                              )
                            ):null
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.network(
                                  e.icon,
                                  width: 30,
                                  height: 30,
                                  color:active?mainColor:Colors.black54,
                                ),
                              ),
                              Expanded(child: Text(e.name, style: TextStyle(color: active || hover?mainColor:Colors.black54),))
                            ],
                          ),
                        )
                    );
                  }).toList(),
                )
            ),
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmYK8OiqBT-mnQ9zA2o9705CXdJYuN0Nl2rA&usqp=CAU",
                      height: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("VIP CENTER")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("https://cdn-icons-png.flaticon.com/512/1077/1077221.png",
                      height: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Promotions")
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network("https://www.qr-code-generator.com/wp-content/themes/qr/new_structure/markets/core_market_full/generator/dist/generator/assets/images/websiteQRCode_noFrame.png",
                      height: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("App download")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


