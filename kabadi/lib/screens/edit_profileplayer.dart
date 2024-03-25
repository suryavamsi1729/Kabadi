import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditPlayerProfilePage extends StatelessWidget {
  const EditPlayerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: EditProfileForm(),
        ),
      ),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  Uint8List? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFf7f2f0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                pickImage();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFF00c3a2),
                    backgroundImage: _pickedImage != null
                        ? MemoryImage(_pickedImage!)
                        : const AssetImage("images/tamilThalaivas.png")
                            as ImageProvider<Object>?,
                    radius: 50,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      pickImage();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'First Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text('Last Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // const Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text('Email',
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //         ))),
                  // const SizedBox(height: 5),
                  // TextField(
                  //   controller: _emailController,
                  //   decoration: const InputDecoration(
                  //     border: OutlineInputBorder(),
                  //     filled: true,
                  //     fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                  //     contentPadding: EdgeInsets.symmetric(
                  //       vertical: 10,
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _phoneNumberController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text("City",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _cityController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Text("State",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              controller: _stateController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Change Password',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[50]?.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text('New Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            controller: _newPasswordController,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(0, 0, 0, 0.02),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                    ),
                    const Text("Terms and conditions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    constraints: const BoxConstraints(
                        maxWidth:
                            600), // Adjust the maxWidth as per your layout
                    child: const Text(
                      'Welcome to Kabadi App. These Terms and Conditions outline the rules and regulations for the use of Kabadi App\'s services. By accessing this app, we assume you accept these terms and conditions. Do not continue to use Kabadi App if you do not agree to take all of the terms and conditions stated on this page. By using Kabadi App, users acknowledge and agree to the collection and use of their personal information as outlined in the app\'s Privacy Policy. Kabadi App is committed to protecting the privacy of its users and will only use personal information in accordance with applicable laws and regulations.',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  // Add logic to update profile
                  _updateProfile();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 70,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: const Color(0xFFfc5607),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Update Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateProfile() {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && _isChecked) {
      // Prepare the data to update
      Map<String, dynamic> userData = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'phoneNumber': _phoneNumberController.text,
        'city': _cityController.text,
        'state': _stateController.text,
        // Add more fields as needed
      };
      FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid)
          .update({"phoneNumber": _phoneNumberController.text});
      // Update the profile data in Firestore
      FirebaseFirestore.instance
          .collection('Players')
          .doc(user.uid)
          .update(userData)
          .then((_) {
        // Profile updated successfully
        // Show a confirmation dialog or navigate back to the previous screen
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Profile Updated"),
              content: const Text("Profile updated successfully!"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        // Error updating profile
        print("Error updating profile: $error");
        // Handle error accordingly, e.g., show an error dialog
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Profile Updated"),
            content: const Text("Profile updated  Not successfully!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> uploadToStorage(
      Uint8List image, String collection, String id) async {
    var ref = FirebaseStorage.instance.ref().child(collection).child(id);
    final metadata = SettableMetadata(contentType: "image/jpeg");
    UploadTask uploadTask = ref.putData(image, metadata);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> pickImage() async {
    User? user = FirebaseAuth.instance.currentUser;
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // showSnackbar("Image picked", context);
      _pickedImage = await pickedImage.readAsBytes();
      uploadToStorage(_pickedImage!, 'PlayerProfile', user!.uid).then((url) {
        setState(() {
          // You can use the URL to display the image if needed
          print("Image uploaded to: $url");
        });
      }).catchError((error) {
        // Handle upload error
        print("Error uploading image: $error");
      });
    } else {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("Please pick an image")));
      Get.snackbar("Warning", "Please pick an image");
    }
  }

  @override
  void dispose() {
    // Clean up the TextEditingController
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
