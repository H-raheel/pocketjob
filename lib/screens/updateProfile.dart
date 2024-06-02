import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/users.dart';
import 'package:pocketjob/providers/userProvider.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/done.dart';
import 'package:pocketjob/widgets/field.dart';

class Editprofile extends ConsumerStatefulWidget {
  const Editprofile({super.key});

  @override
  ConsumerState<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends ConsumerState<Editprofile> {
  final _formKey = GlobalKey<FormState>();

  String? error;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  //TextEditingController _genderController = TextEditingController();
  String? _selectedGender = "";
  String? _selectedEducation = "";
  // TextEditingController _lastHighestEducationController =
  //     TextEditingController();
  TextEditingController _instituteController = TextEditingController();
  TextEditingController _graduationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    UserModel? user = ref.read(CurrentUserProvider);
    _nameController.text = user!.name;
    _emailController.text = user.email;
    _phoneController.text = user.phone ?? "";
    _selectedGender = user.gender ?? "";
    _selectedEducation = user.lastHighestEducation ?? "";
    // _lastHighestEducationController.text = user.lastHighestEducation ?? "";
    _instituteController.text = user.instituteAttended ?? "";
    _graduationController.text = user.yearOfGraduation == null
        ? "2025"
        : user.yearOfGraduation.toString();
  }

  final _genderList = ["Male", "Female"];
  final _educationList = [
    "O-level",
    "Metric",
    "Intermediate",
    "A-level",
    "Bachelors",
  ];

  void onFileSelected(PlatformFile file) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("Personal Information", style: heading()),
        leading: Back(
          context: context,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: formPadding,
              child: Column(
                children: [
                  Field(
                      controller: _nameController,
                      label: "Name",
                      hintText: "Ayesha",
                      validator: (value) => validateString(value)),
                  SizedBox(height: 20),
                  Field(
                      defaultVal: false,
                      controller: _emailController,
                      label: "Email",
                      hintText: "",
                      validator: (value) => validateEmail(value)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    SizedBox(width: 2),
                    Expanded(
                      child: Field(
                          controller: _phoneController,
                          label: "Phone Number",
                          hintText: "+92-XXXX-XXXXXX",
                          validator: (value) =>
                              validatePhoneNumberSyntax(value)),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: SizedBox(
                        width: 20,
                        child: CustomDropDownField(
                          list: _genderList,
                          label: "Gender",
                          current: _selectedGender,
                          icon: Icons.person,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(height: 20),
                  CustomDropDownField(
                    list: _educationList,
                    label: "Highest Education Level",
                    current: _selectedEducation,
                    icon: Icons.school_rounded,
                    onChanged: (value) {
                      setState(() {
                        _selectedEducation = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Field(
                      controller: _instituteController,
                      label: "Institute Attended",
                      hintText: "",
                      validator: (value) => noValidation(value)),
                  SizedBox(
                    height: 20,
                  ),
                  Field(
                    controller: _graduationController,
                    label: "Year of Graduation",
                    hintText: "",
                    validator: (value) => validateYear(value),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: primaryButton("Done", () {
                        if (_formKey.currentState!.validate()) {
                          print(ref
                              .read(CurrentUserProvider.notifier)
                              .state
                              ?.email);
                          print(_nameController.text);
                          ref.watch(CurrentUserProvider.notifier).updateState(
                                _nameController.text,
                                _phoneController.text,
                                _selectedEducation,
                                _instituteController.text,
                                int.parse(_graduationController.text.trim()),
                                _selectedGender,
                              );
                          print(ref
                              .read(CurrentUserProvider.notifier)
                              .state
                              ?.name);
                          showDialog(
                              context: context,
                              builder: (context) => Done(
                                  message: "Profile Updated Successfully"));
                        }
                      }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
