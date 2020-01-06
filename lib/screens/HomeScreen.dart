import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: ProfileHeader(),
            pinned: true,

          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Instructor",
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[200]),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                          borderRadius: BorderRadius.all(Radius.circular(4))
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                ),

                SizedBox(height: 16,),

                //Container for heading
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Catogaries", style: GoogleFonts.roboto(fontSize: 28, textStyle: TextStyle(color: Colors.grey[800]),
                      fontWeight: FontWeight.w700,),),
                ),

                //Container for sub heading
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Select catorgary to find fitness trainer", style: GoogleFonts.roboto(fontSize: 15, textStyle: TextStyle(color: Colors.grey[500]),
                    fontWeight: FontWeight.w400,),),
                ),

                //Container for catorgaries
                Container(
                  height: 300,
                  padding: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                      itemBuilder: (context, index){
                        return Container(
                          width: MediaQuery.of(context).size.width - 32,
                            margin: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 0.4, spreadRadius: 0.3)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                                child: SvgPicture.asset("assets/images/type${index+1}.svg", fit: BoxFit.cover,),
                              ),

                              SizedBox(height: 16,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Text("Yoga", style: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w700, textStyle: TextStyle(color: Colors.grey[900])),),
                                  ),

                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    child: Icon(Icons.favorite, color: Colors.red,)
                                  )
                                ],
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text("Select catoary to find fitness trainer", style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15, textStyle: TextStyle(color: Colors.grey)),),

                              ),
                              SizedBox(height: 16,)
                            ],
                          ),
                        );
                      },
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    shrinkWrap: true,
                  ),
                ),


                SizedBox(height: 16,),
                //Container for new feed heading
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("News Feed", style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey[800],), fontSize: 28, fontWeight: FontWeight.w700),),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Tops Instructor Teasers", style: GoogleFonts.roboto(textStyle: TextStyle(color: Colors.grey,), fontSize: 16, fontWeight: FontWeight.w400),),
                ),

                //Container for List of teasers
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    child: ListView.builder(itemBuilder:
                        (context, index){
                          return Container(
                            child: ListTile(
                              title: Text("Saad Aftab", style: GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 18, textStyle: TextStyle(color: Colors.grey[800])),),

                              subtitle: Text("Hi, I am certified Gym Instructor available", style: GoogleFonts.roboto(fontWeight: FontWeight.w400,
                                  fontSize: 15, textStyle: TextStyle(color: Colors.grey)),),

                              trailing: Text("YOGA", style: GoogleFonts.roboto(fontWeight: FontWeight.w400,
                                  fontSize: 15, textStyle: TextStyle(color: Colors.lightBlue)),),
                              leading: CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset("assets/images/profile.jpg", fit: BoxFit.contain,),
                                ),
                                radius: 30,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            ),
                            margin: EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15)),
                              boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 0.6, blurRadius: 0.7)]

                            ),
                          );
                        },
                      shrinkWrap: true,
                      itemCount: 6,
                      controller: ScrollController(keepScrollOffset: false),

                    ),
                  ),
                )

              ]
            ),
          )
        ],
      ),
    );
  }
}

class ProfileHeader extends SliverPersistentHeaderDelegate{
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[200], spreadRadius: 0.3, blurRadius: 0.4)]
      ),
      padding: EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Hi, Welcome", style: GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w400, textStyle: TextStyle(color: Colors.grey[500])),),
                Text("Maaz Aftab", style: GoogleFonts.roboto(fontSize: 28, fontWeight: FontWeight.w700, textStyle: TextStyle(color: Colors.grey[900])),)
              ],
            ),
          ),
          
          CircleAvatar(
            radius: 30,
            child: ClipOval(child: Image.asset("assets/images/profile.jpg", fit: BoxFit.contain,),),
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 100;

  @override
  // TODO: implement minExtent
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }

}
