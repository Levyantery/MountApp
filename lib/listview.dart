import 'package:flutter/material.dart';
import 'package:mountapp/main.dart';

class AppMountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mountItems.length,
        itemBuilder: (context, index) {
          MountModel currentMount = mountItems[index];

          return GestureDetector(
            onTap: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailsPage(currentMount))
  );
},
            child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            width: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(currentMount.path),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentMount.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currentMount.location,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ),
          );
        },
      ),
    );
  }
}


class MountModel {
  String path;
  String name;
  String location;
  String description;
  MountModel({
    this.path = '',
    this.name = '',
    this.location = '',
    this.description = '',
  });
}

final List<MountModel> mountItems = [
  MountModel(
    path: 'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg',
    name: 'Gunung Merbabu',
    description: 'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian island of Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanese combined words; Meru means mountain and awu or abu means ash.',
    location: 'Central Java',
  ),
  MountModel(
    path: 'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg',
    name: 'Gunung Vesuvius',
    description: 'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes which form the Campanian volcanic arc.',
    location: 'Italy',
  ),
  MountModel(
    path: 'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg',
    name: 'Gunung Popocatépetl',
    description: 'Popocatépetl is an active stratovolcano located in the states of Puebla, Morelos, and Mexico in central Mexico. It lies in the eastern half of the Trans-Mexican volcanic belt. At 5,426 m it is the second highest peak in Mexico, after Citlaltépetl at 5,636 m.',
    location: 'Mexico',
  ),
  MountModel(
      path:'https://asset.kompas.com/crops/ZZi-nwYiU3i_FIg71F-4WzofLaw=/0x0:0x0/750x500/data/photo/2020/03/05/5e60962161422.jpg',
      name: 'Gunung Semeru',
      description:
          'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
      location: 'East Java'
  ),
   MountModel(
      path: 'https://tse4.mm.bing.net/th?id=OIP.BSMRyCfBotwuB9_IzcY8jAHaE4&pid=Api&P=0&h=180',
      name: 'Mauna Loa',
      description:
          'Mauna Loa is one of five volcanoes that form the Island of Hawaii in the U.S. state of Hawai in the Pacific Ocean. The largest subaerial volcano in both mass and volume, Mauna Loa has historically been considered the largest volcano on Earth, dwarfed only by Tamu Massif.',
      location: 'Hawaii'
  ),
  MountModel(
      path: 'https://2.bp.blogspot.com/-j7Jo-KoUzFQ/VoKqgmFryOI/AAAAAAAAAsU/MjSUqwCBozQ/s1600/gununglawu.jpg',
      name: 'Gunung Lawu',
      description:
          'Puncak Lawu is said to be the resting place of Prabu Brawijaya V (1468-1478), the last king of Majapahit. Brawijaya V was the father of Raden Patah (1475-1518) who later built the first Islamic kingdom in Java, the Demak Sultanate, as well as completing the history of Majapahit.',
      location: 'Magetan'
  ),

];
