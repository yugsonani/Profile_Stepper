import 'package:flutter/material.dart';
import 'package:profile_stepper/main.dart';
import 'global.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                   color: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      foregroundImage: FileImage(Global.pic!),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      Global.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(Global.email, style: const TextStyle(color: Colors.white))
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(30),
                color: Colors.blue.shade50,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Name"),
                        subtitle: Text(Global.name),
                      ),
                      ListTile(
                        leading: const Icon(Icons.call),
                        title: const Text("Mobile"),
                        subtitle: Text("+91 ${Global.phone}"),
                      ),
                      ListTile(
                        leading: const Icon(Icons.email),
                        title: const Text("Email"),
                        subtitle: Text(Global.email),
                      ),
                      ListTile(
                        leading: const Icon(Icons.cake),
                        title: const Text("DOB"),
                        subtitle: Text(Global.date),
                      ),
                      ListTile(
                        leading: const Icon(Icons.male),
                        title: const Text("Gender"),
                        subtitle: Text(Global.gender),
                      ),
                      ListTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: const Text("Location"),
                        subtitle: Text(Global.address),
                      ),
                      ListTile(
                        leading: const Icon(Icons.flag),
                        title: const Text("Nationality"),
                        subtitle: Text(Global.nationalities),
                      ),
                      ListTile(
                        leading: const Icon(Icons.flag),
                        title: const Text("Religion"),
                        subtitle: Text(Global.religion),
                      ),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text("Language"),
                        subtitle: Text(Global.language),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
