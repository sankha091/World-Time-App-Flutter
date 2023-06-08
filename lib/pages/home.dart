import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url1 = Uri.parse('https://github.com/sankha091');
final Uri _url2 = Uri.parse('https://www.linkedin.com/in/sankha-subhra-aich-a78b7b155/');
final Uri _url3 = Uri.parse('mailto:sankha091@gmail.com?');

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty? data : ModalRoute.of(context)?.settings?.arguments as Map; //The ? is used for null safety
    print(data);

    //set background image and color and text color
    String bgImage = data['daytime'] ? 'day.jpg' : 'night.jpg' ;
    Color bgColor = data['daytime'] ? Color.fromRGBO(224, 197, 250, 1.0) : Color.fromRGBO(1, 29, 74, 1.0);
    Color txtColor = data['daytime'] ? Color.fromRGBO(31, 31, 41, 1.0) : Color.fromRGBO(225, 225, 229, 1.0);
    Color footerColor = data['daytime'] ? Color.fromRGBO(224, 197, 250, 0.19) : Color.fromRGBO(1, 29, 74, 0.19);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage( //decoration image allows us to apply background image to the whole container.
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: FooterView(
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: ()async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data  = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'flag' : result['flag'],
                        'daytime' : result['daytime'],
                      };
                    });
                  },
                  icon: Icon(Icons.search),
                  label: Text(
                    'Select location',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(txtColor)
                  ),
                ),
                const SizedBox(height: 60.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 1.5,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('assets/${data['flag']}'),
                      height: 80.0,
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 66.0, //66
                        letterSpacing: 1.5,
                        color: txtColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
            footer: Footer(
              // child: Text('I am a Customizable footer!!'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        splashColor: Color.fromRGBO(0, 0, 0, 1),
                        onTap:_launchUrl1,
                        child: Image.asset(
                          'assets/github2.jpg',
                          height: 45.0,
                          width: 45.0,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: Color.fromRGBO(0, 0, 0, 1),
                        onTap:_launchUrl2,
                        child: Image.asset(
                          'assets/LinkedIn2.jpg',
                          height: 45.0,
                          width: 45.0,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(15.0),
                        splashColor: Color.fromRGBO(0, 0, 0, 1),
                        onTap:_launchUrl3,
                        child: Image.asset(
                          'assets/gmail.jpg',
                          height: 45.0,
                          width: 45.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  Text(
                    'Developed by sankha091',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
              //padding: EdgeInsets.all(10.0),
              backgroundColor: footerColor,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl1() async {
  if (!await launchUrl(_url1)) {
    throw Exception('Could not launch $_url1');
  }
}

Future<void> _launchUrl2() async {
  if (!await launchUrl(_url2)) {
    throw Exception('Could not launch $_url2');
  }
}

Future<void> _launchUrl3() async {
  if (!await launchUrl(_url3)) {
    throw Exception('Could not launch $_url3');
  }
}