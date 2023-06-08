import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  //timezone list
  List<WorldTime> locations = [
    WorldTime(location: 'Abidjan/Ivory Coast', flag: 'ivorycoast.jpg', urll: 'Africa/Abidjan'),
    WorldTime(location: 'Algiers/Algeria', flag: 'algeria.jpg', urll: 'Africa/Algiers'),
    WorldTime(location: 'Almaty/Kazakhstan', flag: 'kazakhstan.jpg', urll: 'Asia/Almaty'),
    WorldTime(location: 'Anchorage/Alaska', flag: 'alaska.jpg', urll: 'America/Anchorage'),
    WorldTime(location: 'Asuncion/Paraguay', flag: 'paraguay.jpg', urll: 'America/Asuncion'),
    WorldTime(location: 'Athens/Greece', flag: 'greece.jpg', urll: 'Europe/Athens'),
    WorldTime(location: 'Baghdad/Iraq', flag: 'iraq.jpg', urll: 'Asia/Baghdad'),
    WorldTime(location: 'Baku/Azerbaizan', flag: 'azerbaijan.jpg', urll: 'Asia/Baku'),
    WorldTime(location: 'Berlin/Germany', flag: 'germany.jpg', urll: 'Europe/Berlin'),
    WorldTime(location: 'Bucharest/Romania', flag: 'romania.jpg', urll: 'Europe/Bucharest'),
    WorldTime(location: 'Budapest/Hungary', flag: 'hungary.jpg', urll: 'Europe/Budapest'),
    WorldTime(location: 'Cairo/Egypt', flag: 'egypt.jpg', urll: 'Africa/Cairo'),
    WorldTime(location: 'Caracas/Venezuela', flag: 'venezuela.jpg', urll: 'America/Caracas'),
    WorldTime(location: 'Casablanca/Morocco', flag: 'morocco.jpg', urll: 'Africa/Casablanca'),
    WorldTime(location: 'Costarica', flag: 'costarica.jpg', urll: 'America/Costa_Rica'),
    WorldTime(location: 'Dhaka/Bangladesh', flag: 'bangladesh.jpg', urll: 'Asia/Dhaka'),
    WorldTime(location: 'Denver/United States', flag: 'usa.jpg', urll: 'America/Denver'),
    WorldTime(location: 'Dubai/UAE', flag: 'uae.jpg', urll: 'Asia/Dubai'),
    WorldTime(location: 'El Salvador', flag: 'elsalvador.jpg', urll: 'America/El_Salvador'),
    WorldTime(location: 'Fiji', flag: 'fiji.jpg', urll: 'Pacific/Fiji'),
    WorldTime(location: 'Guayaquil/Ecuador', flag: 'ecuador.jpg', urll: 'America/Guayaquil'),
    WorldTime(location: 'Havana/Cuba', flag: 'cuba.jpg', urll: 'America/Havana'),
    WorldTime(location: 'Helsinki/Finland', flag: 'finland.jpg', urll: 'Europe/Helsinki'),
    WorldTime(location: 'Istanbul/Turkey', flag: 'turkey.jpg', urll: 'Europe/Istanbul'),
    WorldTime(location: 'Jakarta/Indonesia', flag: 'indonesia.jpg', urll: 'Asia/Jakarta'),
    WorldTime(location: 'Jerusalem/Israel', flag: 'israel.jpg', urll: 'Asia/Jerusalem'),
    WorldTime(location: 'Johannesburg/South Africa', flag: 'southafrica.jpg', urll: 'Africa/Johannesburg'),
    WorldTime(location: 'Kabul/Afghanistan', flag: 'afghanistan.jpg', urll: 'Asia/Kabul'),
    WorldTime(location: 'Karachi/Pakistan', flag: 'pakistan.jpg', urll: 'Asia/Karachi'),
    WorldTime(location: 'Kathmandu/Nepal', flag: 'nepal.jpg', urll: 'Asia/Kathmandu'),
    WorldTime(location: 'Kolkata/India', flag: 'india.jpg', urll: 'Asia/Kolkata'),
    WorldTime(location: 'Kyiv/Ukraine', flag: 'ukraine.jpg', urll: 'Europe/Kyiv'),
    WorldTime(location: 'Lagos/Nigeria', flag: 'nigeria.jpg', urll: 'Africa/Lagos'),
    WorldTime(location: 'Lima/Peru', flag: 'peru.jpg', urll: 'America/Lima'),
    WorldTime(location: 'Lisbon/Portugal', flag: 'portugal.jpg', urll: 'Europe/Lisbon'),
    WorldTime(location: 'London/England', flag: 'england.jpg', urll: 'Europe/London'),
    WorldTime(location: 'Madrid/Spain', flag: 'spain.jpg', urll: 'Europe/Madrid'),
    WorldTime(location: 'Mauritius', flag: 'mauritius.jpg', urll: 'Indian/Mauritius'),
    WorldTime(location: 'Mawson', flag: 'australia.jpg', urll: 'Antarctica/Mawson'),
    WorldTime(location: 'Melbourn/Australia', flag: 'australia.jpg', urll: 'Australia/Melbourne'),
    WorldTime(location: 'Monrovia/Liberia', flag: 'liberia.jpg', urll: 'Africa/Monrovia'),
    WorldTime(location: 'Montevideo/Uruguay', flag: 'uruguay.jpg', urll: 'America/Montevideo'),
    WorldTime(location: 'Moscow/Russia', flag: 'russia.jpg', urll: 'Europe/Moscow'),
    WorldTime(location: 'Nairobi/Kenya', flag: 'kenya.jpg', urll: 'Africa/Nairobi'),
    WorldTime(location: 'Palmer', flag: 'usa.jpg', urll: 'Antarctica/Palmer'),
    WorldTime(location: 'Paris/France', flag: 'france.jpg', urll: 'Europe/Paris'),
    WorldTime(location: 'Perth/Australia', flag: 'australia.jpg', urll: 'Australia/Perth'),
    WorldTime(location: 'Port Morsby/Papua New Geunia', flag: 'papua.jpg', urll: 'Pacific/Port_Moresby'),
    WorldTime(location: 'Qatar', flag: 'qatar.jpg', urll: 'Asia/Qatar'),
    WorldTime(location: 'Qostanay/Kazakhstan', flag: 'kazakhstan.jpg', urll: 'Asia/Qostanay'),
    WorldTime(location: 'Rio Gallegos/Argentina', flag: 'argentina.jpg', urll: 'America/Argentina/Rio_Gallegos'),
    WorldTime(location: 'Riyadh/Saudi Arabia', flag: 'saudiarabia.jpg', urll: 'Asia/Riyadh'),
    WorldTime(location: 'Rome/Italy', flag: 'italy.jpg', urll: 'Europe/Rome'),
    WorldTime(location: 'Samarkand/Uzbekistan', flag: 'uzbekistan.jpg', urll: 'Asia/Samarkand'),
    WorldTime(location: 'Santiago/Chile', flag: 'chile.jpg', urll: 'America/Santiago'),
    WorldTime(location: 'Sao Tome', flag: 'saotome.jpg', urll: 'Africa/Sao_Tome'),
    WorldTime(location: 'Seoul/South Korea', flag: 'southkorea.jpg', urll: 'Asia/Seoul'),
    WorldTime(location: 'Shanghai/China', flag: 'china.jpg', urll: 'Asia/Shanghai'),
    WorldTime(location: 'Singapore', flag: 'singapore.jpg', urll: 'Asia/Singapore'),
    WorldTime(location: 'Sydnye/Australia', flag: 'australia.jpg', urll: 'Australia/Sydney'),
    WorldTime(location: 'Thimphu/Bhutan', flag: 'bhutan.jpg', urll: 'Asia/Thimphu'),
    WorldTime(location: 'Tokyo/Japan', flag: 'japan.jpg', urll: 'Asia/Tokyo'),
    WorldTime(location: 'Toronto/Canada', flag: 'canada.jpg', urll: 'America/Toronto'),
    WorldTime(location: 'Tunis/Tunisia', flag: 'tunisia.jpg', urll: 'Africa/Tunis'),
    WorldTime(location: 'Vienna/Austria', flag: 'austria.jpg', urll: 'Europe/Vienna'),
    WorldTime(location: 'Warsaw/Poland', flag: 'poland.jpg', urll: 'Europe/Warsaw'),
    WorldTime(location: 'Zurich/Switzerland', flag: 'switzerland.jpg', urll: 'Europe/Zurich'),
  ];
//------------------------------------------------------------------------------
  List<WorldTime> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = locations;
    super.initState();
  }
  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<WorldTime> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = locations;
    } else {
      results = locations
          .where((user) =>
          user.location.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }
  //----------------------------------------------------------------------------

  void updateTime(index) async {
    WorldTime obj = _foundUsers[index];
    await obj.getTime();
    Navigator.pop(context,{
      'flag' : obj.flag,
      'location' : obj.location,
      'time' : obj.time,
      'daytime' : obj.daytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
            backgroundColor: Colors.blueGrey  [900],
            title: const Text(
              'Select a location',
                style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body:  Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                        hintText: "Search",
                          suffixIcon: const Icon(Icons.search),
              // prefix: Icon(Icons.search),
                          border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                        child: _foundUsers.isNotEmpty
                            ?ListView.builder(
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
                                  child: Card(
                                    child: ListTile(
                                      onTap: (){
                                        updateTime(index);
                                      },
                                      title: Text(_foundUsers[index].location),
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/${_foundUsers[index].flag}'
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            )
                            : const Text(
                              'No results found Please try with different search',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                    ],
              ),
          ),
    );
  }
}
      //------------------------------------------------------------------------
      // body: ListView.builder(
      //   itemCount: locations.length,
      //   itemBuilder: (context, index){
      //     return Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
      //       child: Card(
      //         child: ListTile(
      //           onTap: (){
      //             updateTime(index);
      //           },
      //           title: Text(locations[index].location),
      //           leading: CircleAvatar(
      //             backgroundImage: AssetImage(
      //               'assets/${locations[index].flag}'
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
//     );
//   }
// }
//------------------------------------------------------------------------------
