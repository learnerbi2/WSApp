import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:womensafetyapp/HomePage.dart';
import 'package:womensafetyapp/TextEdit.dart';
// import 'package:loginpage/homepage.dart';
// import 'package:loginpage/textfield.dart';
// import 'package:insta_clone/Widgets/text_input_field.dart';
// import 'package:insta_clone/utils/colors.dart';

const primaryColor = Colors.white;

class VolleyballRegistrationForm extends StatefulWidget {
  const VolleyballRegistrationForm({Key? key}) : super(key: key);

  @override
  State<VolleyballRegistrationForm> createState() =>
      _VolleyballRegistrationFormState();
}

class _VolleyballRegistrationFormState
    extends State<VolleyballRegistrationForm> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _schoolDistrictController =
      TextEditingController();
  final TextEditingController _parentFirstNameController =
      TextEditingController();
  final TextEditingController _parentLastNameController =
      TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();

  String? _selectedGrade;
  String? _selectedShirtSize;

  final List<String> _grades = ['Student', 'Job', 'Home Maker', 'Others'];
  final List<String> _shirtSizes = ['Male', 'Female', 'Others'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _schoolDistrictController.dispose();
    _parentFirstNameController.dispose();
    _parentLastNameController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty) {
      _showSnackbar("Please enter the participant's full name.");
      return false;
    }
    if (_ageController.text.isEmpty ||
        int.tryParse(_ageController.text) == null) {
      _showSnackbar("Please enter a valid address.");
      return false;
    }
    if (_selectedGrade == null) {
      _showSnackbar("Please select a grade.");
      return false;
    }
    if (_schoolDistrictController.text.isEmpty) {
      _showSnackbar("Please enter the school district.");
      return false;
    }
    if (_selectedShirtSize == null) {
      _showSnackbar("Please select a shirt size.");
      return false;
    }
    if (_parentFirstNameController.text.isEmpty ||
        _parentLastNameController.text.isEmpty) {
      _showSnackbar("Please enter the parent's full name.");
      return false;
    }
    if (_emergencyContactController.text.isEmpty) {
      _showSnackbar("Please enter an emergency contact.");
      return false;
    }
    return true;
  }

  void _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _submitForm() {
    if (_validateFields()) {
      // Perform the form submission logic here
      _showSnackbar("Form submitted successfully!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Form",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("User Name"),
              Row(
                children: [
                  //main details
                  Expanded(
                    child: TextInputField(
                      textEditingController: _firstNameController,
                      hintText: 'First',
                      textInputType: TextInputType.text,
                      isPass: false,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextInputField(
                      textEditingController: _lastNameController,
                      hintText: 'Last',
                      textInputType: TextInputType.text,
                      isPass: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Address",
                style: TextStyle(color: primaryColor),
              ),
              TextInputField(
                textEditingController: _ageController,
                hintText: 'Enter Address',
                textInputType: TextInputType.number,
                isPass: true,
              ),
              const SizedBox(height: 16),
              const Text(
                "Contact",
                style: TextStyle(color: primaryColor),
              ),
              TextInputField(
                textEditingController: _emergencyContactController,
                hintText: 'Enter phone Number',
                textInputType: TextInputType.phone,
                isPass: false,
              ),
              const SizedBox(height: 16),

              const Text(
                "",
                style: TextStyle(
                    color: primaryColor, backgroundColor: Colors.white),
              ),
              DropdownButtonFormField<String>(
                value: _selectedGrade,
                items: _grades.map((String grade) {
                  return DropdownMenuItem<String>(
                    value: grade,
                    child: Text(
                      grade,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedGrade = newValue;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Work',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "District",
                style: TextStyle(color: primaryColor),
              ),
              TextInputField(
                textEditingController: _schoolDistrictController,
                hintText: 'Enter district',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 16),
              const Text(
                "Gender",
                style: TextStyle(color: primaryColor),
              ),
              DropdownButtonFormField<String>(
                value: _selectedShirtSize,
                items: _shirtSizes.map((String size) {
                  return DropdownMenuItem<String>(
                    value: size,
                    child: Text(size),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedShirtSize = newValue;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Gender',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "State",
                style: TextStyle(color: primaryColor),
              ),
              Row(
                children: [
                  Expanded(
                    child:CSCPicker(
                      showStates: true,
                      showCities:true,
                      layout: Layout.vertical,
                      onCountryChanged: (Country){},
                      onStateChanged: (state){},
                      onCityChanged: (city){},
                      stateDropdownLabel: "state",
                      cityDropdownLabel: "district",
                      
                    )
                  ),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style:ButtonStyle(backgroundColor:  WidgetStatePropertyAll(Colors.blue),),
                onPressed: () {
                  _submitForm();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainUI()));
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(
                      color: primaryColor,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}