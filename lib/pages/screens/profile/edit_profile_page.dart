import 'package:flutter/material.dart';
import 'package:hangar_gym/pages/widgets/background/background_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
                          const SizedBox(height: 13.0),
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
        print(number.phoneNumber);
      },
      selectorConfig: const SelectorConfig(
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
          child: const Center(
            child: Padding(
              padding: EdgeInsets.all(12.0),
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
    String fullname = _fullnameController.text;
    String nickname = _nicknameController.text;
    String email = _emailController.text;

    print('Fullname: $fullname');
    print('Nickname: $nickname');
    print('Email: $email');
  }
}
