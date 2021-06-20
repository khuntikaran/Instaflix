import 'package:flutter/material.dart';
import 'package:instaflix/widgets/chart.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: Container(
        // alignment: Alignment.bottomCenter,
        height: height * 1,
        width: width * 1,
        color: Colors.black.withOpacity(0.85),

        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.orange.shade800,
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 5,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.orange.shade800,
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 140,
              child: Container(
                height: height * 0.3,
                width: width * 0.3,
                // color: Colors.white,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.orange.shade800,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 220,
              left: 100,
              child: Container(
                alignment: Alignment.center,
                height: height * 0.05,
                width: width * 0.5,
                child: Text(
                  'UserName',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 23 * scaleFactor,
                  ),
                ),
              ),
            ),
            //Bottom Container -------------------------->>>>>>>>>>>>>>>>>>>>>>>
            Positioned(
              bottom: 0,
              child: Container(
                // alignment: Alignment.bottomCenter,
                height: height * 0.55,
                width: width * 1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      left: 75,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.8,
                        child: Row(
                          children: [
                            Text(
                              'Streaming Hours:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  fontSize: 20 * scaleFactor),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Text(
                              '35.6h',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  fontSize: 20 * scaleFactor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      left: 38,
                      child: Container(
                        height: height * 0.13,
                        width: width * 0.8,
                        //color: Colors.amber,
                        child: Chart(),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: height * 0.2,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.orange.shade800,
                          ),
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Favourite',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: height * 0.12,
                              width: width * 0.3,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp3891770.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 13,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp8118255.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 25,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp8663949.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 23,
                                    right: 37,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://images3.alphacoders.com/107/thumbbig-1072835.webp'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 210,
                      right: 10,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: height * 0.2,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.orange.shade800,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Downloaded',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              height: height * 0.12,
                              width: width * 0.3,
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://images3.alphacoders.com/107/thumbbig-1072835.webp'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    right: 13,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp7959863.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 25,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp6903166.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 23,
                                    right: 37,
                                    child: Container(
                                      height: height * 0.08,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'https://wallpapercave.com/wp/wp6577371.jpg'),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          width: 2,
                                          color: Colors.orange.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
