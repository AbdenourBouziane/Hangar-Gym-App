import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:hangar_gym/pages/controllers/ProfileController.dart';
//import 'package:hangar_gym/data/user_info.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:flag/flag.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, // Set the color of the back arrow icon
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Add navigation logic as needed
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildTextField(_fullnameController, 'Full Name'),
                          const SizedBox(height: 13.0),
                          _buildTextField(_nicknameController, 'Nickname'),
                          const SizedBox(height: 13.0),
                          _buildTextField(_emailController, 'Email'),
                          const SizedBox(height: 13.0),
                          _buildPhoneNumberInput(),
                          const SizedBox(height: 13.0),
                          Row(
                            children: [
                              Expanded(
                                child: _buildTextField(
                                    _heightController, 'Height'),
                              ),
                              const SizedBox(
                                  width: 13.0), // Add some space between fields
                              Expanded(
                                child: _buildTextField(
                                    _weightController, 'Weight'),
                              ),
                              const SizedBox(
                                  width: 13.0), // Add some space between fields
                              Expanded(
                                child: _buildTextField(
                                    _genderController, 'Gender'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13.0),
                          _buildTextField(_addressController, 'Address',
                              maxLines: 2),
                          const SizedBox(height: 13.0 ),
                          _buildGradientButton(_submitForm),
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
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12.0),
        ),
        maxLines: maxLines,
      ),
    );
  }
   Widget _buildPhoneNumberInput() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        // Handle changes in phone number input
        print(number.phoneNumber);
      },
      selectorConfig: SelectorConfig(
        selectorType: PhoneInputSelectorType.DIALOG,
      ),
      textFieldController: _phoneController,
      inputDecoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  Widget _buildGradientButton(Function onPressed) {
    return GradienBackground(
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Save Changes',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Implement logic to save changes to the user's profile
    String fullname = _fullnameController.text;
    String nickname = _nicknameController.text;
    String email = _emailController.text;

    // Add your logic to update the user's profile information

    // For demonstration purposes
    print('Fullname: $fullname');
    print('Nickname: $nickname');
    print('Email: $email');
  }
}