import 'package:flutter/material.dart';
import 'package:flutter_exam/src/features/data/model/person_model.dart';
import 'package:intl/intl.dart';

class PersonCompleteData extends StatelessWidget {
  final PersonModel person;

  const PersonCompleteData({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    String formattedBirthday =
        DateFormat('MMMM dd, yyyy').format(person.birthday!);

    return Scaffold(
      appBar: AppBar(
        title: Text("${person.firstname} ${person.lastname}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/image_placeholder.jpg",
                  image: person.image!,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset("assets/images/error.png");
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Icon(Icons.info),
                  Text('Name: ${person.firstname} ${person.lastname}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  Text('Email: ${person.email}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Phone: ${person.phone}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Birthday: $formattedBirthday',
                      style: const TextStyle(fontSize: 16)),
                  Text('Gender: ${person.gender}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Website: ${person.website}',
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16.0),
                  const Icon(Icons.home),
                  Text('Street: ${person.address!.street}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Street Name: ${person.address!.streetName}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Building #: ${person.address!.buildingNumber}',
                      style: const TextStyle(fontSize: 16)),
                  Text('City: ${person.address!.city}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Zip Code: ${person.address!.zipcode}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Country: ${person.address!.country}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Country Code: ${person.address!.countyCode}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Latitude: ${person.address!.latitude}',
                      style: const TextStyle(fontSize: 16)),
                  Text('Longitude: ${person.address!.longitude}',
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
