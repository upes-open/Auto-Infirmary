import 'package:flutter/material.dart';
import 'package:infirmaryweb/widget/card_tile.dart';

class right_part extends StatefulWidget {
  
double width;
double text_size;
right_part(this.width,this.text_size);
  
  @override
  _right_partState createState() => _right_partState();
}

class _right_partState extends State<right_part> {
    
  @override
  Widget build(BuildContext context) {
 
    return Container(
  //  width: widget.width,
    
          child: SingleChildScrollView(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50)
                    
                  ),
                    
                    margin: EdgeInsets.all(20),
                
                    width: widget.width,
                    child: Column(
                      children: [
                              CardTile(
                                iconBgColor: Colors.green[400],
                                icon: Icons.forward,
                                cardTitle: "Live Cases",
                                mainText: "Live Cases",
                                subText: "Currently",
                                n: 1


                              ),
                              SizedBox(
                          height: 30
                        ),
                               CardTile(
                                iconBgColor: Colors.yellow[300],
                                icon: Icons.pause,
                                cardTitle: "Hold Cases",
                                mainText: "Hold Cases",
                                subText: "Currently",
                                n: 0


                              ),
                              SizedBox(
                          height: 30
                        ),
                              CardTile(
                                iconBgColor: Colors.green[400],
                                icon: Icons.check,
                                cardTitle: "Resolved Cases",
                                mainText: "Resolved Cases",
                                subText: "Currently",
                                n: 6

                              ),
                              SizedBox(
                          height: 30
                        ),

                              CardTile(
                                iconBgColor: Colors.blue[400],
                                icon: Icons.forward,
                                cardTitle: "Live Traffic",
                                mainText: "Live Traffic",
                                subText: "Currently",
                                n: 100


                              ),
                            
                       

                            ]
                          )
                        )
                      ],
                    ),
                  ),   
        );
  }
}