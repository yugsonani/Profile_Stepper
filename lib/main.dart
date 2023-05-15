import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profile_stepper/profile.dart';


import 'global.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const MyApp(),
      'profile': (context) => const Profile()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int val = 0;

  final ImagePicker picker = ImagePicker();
  XFile? image;
  File? photo;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController indianController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  GlobalKey<FormState> pageKey = GlobalKey();

  dynamic radioVal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Profile"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: Colors.black
),
        ),
      ),
      body: Form(
        key: pageKey,
        child: Stepper(
          currentStep: val,
          controlsBuilder: (context, _) {
            return Row(
              children: [
                (val == 9)
                    ? ElevatedButton(
                        onPressed: () {
                          if (pageKey.currentState!.validate()) {
                            pageKey.currentState!.save();
                            Navigator.of(context).pushNamed('profile');
                          }
                        },
                        child: const Text(
                          "Add",
                          style: TextStyle(fontSize: 10),
                        ))
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (val < 9) {
                              if (pageKey.currentState!.validate()) {
                                val++;
                              }
                            }
                          });
                        },
                        child: (val == 9)
                            ? const Text("Add")
                            : const Text("Continue")),
                const SizedBox(
                  width: 20,
                ),
                (val != 0)
                    ? OutlinedButton(
                        onPressed: () {
                          setState(() {
                            if (val > 0) {
                              val--;
                            }
                          });
                        },
                        child: const Text("Cancel"))
                    : Container()
              ],
            );
          },
          steps: [
            Step(
                isActive: (val == 0) ? true : false,
                state: (val == 0)
                    ? StepState.editing
                    : (val > 0)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Profile Picture"),
                content: Stack(alignment: Alignment.bottomRight, children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueGrey.shade300,
                    foregroundImage: photo != null ? FileImage(photo!) : null,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: const Text("Pick Image"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      image = await picker.pickImage(
                                          source: ImageSource.camera);

                                      setState(() {
                                        photo = File(image!.path);
                                      });
                                      Global.pic = photo;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(Icons.camera_alt)),
                                ElevatedButton(
                                    onPressed: () async {
                                      image = await picker.pickImage(
                                          source: ImageSource.gallery);

                                      setState(() {
                                        photo = File(image!.path);
                                      });
                                      Global.pic = photo;
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(Icons.photo))
                              ],
                            );
                          });
                      //Navigator.of(context).pop();
                    },
                    mini: true,
                    child: const Icon(Icons.add),
                  )
                ])),
            Step(
                isActive: (val == 1) ? true : false,
                state: (val == 1)
                    ? StepState.editing
                    : (val > 1)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Name"),
                content: TextFormField(
                  controller: nameController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter name ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.name = val!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'yug sonani',
                      prefixIcon: Icon(Icons.person_outline)),
                )),
            Step(
                isActive: (val == 2) ? true : false,
                state: (val == 2)
                    ? StepState.editing
                    : (val > 2)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Phone"),
                content: TextFormField(
                  controller: phoneController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter mobile number ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.phone = val!;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: '8160311173',
                      prefixIcon: Icon(Icons.call_outlined),
                      prefixText: '+91'),
                )),
            Step(
                isActive: (val == 3) ? true : false,
                state: (val == 3)
                    ? StepState.editing
                    : (val > 3)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Email"),
                content: TextFormField(
                  controller: emailController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter email ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.email = val!;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'dharanayani@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                )),
            Step(
                isActive: (val == 4) ? true : false,
                state: (val == 4)
                    ? StepState.editing
                    : (val > 4)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("DOB"),
                content: TextFormField(
                  controller: dateController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter birth date ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.date = val!;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: '10.03.2007',
                      prefixIcon: Icon(Icons.cake_outlined)),
                )),
            Step(
                isActive: (val == 5) ? true : false,
                state: (val == 5)
                    ? StepState.editing
                    : (val > 5)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Gender"),
                content: Column(
                  children: [
                    RadioListTile(
                      title: const Text("Male"),
                      value: 'male',
                      groupValue: radioVal,
                      onChanged: (val) {
                        setState(() {
                          radioVal = val;
                          Global.gender = 'male';
                        });
                      },
                    ),
                    RadioListTile(
                        title: const Text("Female"),
                        value: 'female',
                        groupValue: radioVal,
                        onChanged: (val) {
                          setState(() {
                            radioVal = val;
                            Global.gender = 'female';
                          });
                        }),
                  ],
                )),
            Step(
                isActive: (val == 6) ? true : false,
                state: (val == 6)
                    ? StepState.editing
                    : (val > 6)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Current Location"),
                content: TextFormField(
                  controller: addressController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter address ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.address = val!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'city',
                      prefixIcon: Icon(Icons.location_on_outlined)),
                )),
            Step(
                isActive: (val == 7) ? true : false,
                state: (val == 7)
                    ? StepState.editing
                    : (val > 7)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Nationalities"),
                content: TextFormField(
                  controller: indianController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter nationality ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.nationalities = val!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Indian,Dutch,German',
                      prefixIcon: Icon(Icons.flag_outlined)),
                )),
            Step(
                isActive: (val == 8) ? true : false,
                state: (val == 8)
                    ? StepState.editing
                    : (val > 8)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Religion"),
                content: TextFormField(
                  controller: religionController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter religion ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.religion = val!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Hindu', prefixIcon: Icon(Icons.flag_outlined)),
                )),
            Step(
                isActive: (val == 9) ? true : false,
                state: (val == 9)
                    ? StepState.editing
                    : (val > 9)
                        ? StepState.complete
                        : StepState.indexed,
                title: const Text("Language(s)"),
                content: TextFormField(
                  controller: languageController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "enter languages ";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      Global.language = val!;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Hindi,English',
                      prefixIcon: Icon(Icons.language)),
                )),
          ],
        ),
      ),
    );
  }
}
