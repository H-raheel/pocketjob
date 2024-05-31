import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketjob/models/applications.dart';
import 'package:pocketjob/providers/controllers/sendApplication.dart';
import 'package:pocketjob/screens/error.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';
import 'package:pocketjob/utils/validators.dart';
import 'package:pocketjob/widgets/back.dart';
import 'package:pocketjob/widgets/buttons.dart';
import 'package:pocketjob/widgets/field.dart';
import 'package:pocketjob/widgets/progressLoader.dart';

class Apply extends StatefulWidget {
  final String jobId;
  const Apply({super.key, required this.jobId});

  // final String jobId;
  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  final _formKey = GlobalKey<FormState>();

  String? error;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  PlatformFile? pickedFile;
  void onFileSelected(PlatformFile file) {
    print("printiingg from hereee");
    print('Selected file: ${file}');
    pickedFile = file;
  }

  @override
  String _selectedOption = "No";
  @override
  Widget build(BuildContext context) {
    //final AsyncValue<void> state = ref.watch(applyForJobProvider);
    return Consumer(builder: (context, ref, child) {
      ref.listen<AsyncValue<void>>(
        applyForJobProvider,
        (_, state) => state.whenOrNull(
          error: (error, stackTrace) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ErrorScreen()));
          },
        ),
      );
      final AsyncValue<void> state = ref.watch(applyForJobProvider);

     // print("heeeeeraeeaeeeeloaading");
    //  print(state.isLoading);
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: Back(),
          centerTitle: true,
          title: Text(
            "Apply for Job",
            style: heading(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: state.isLoading
                ? const WaitingForProgressLoader()
                : Form(
                    key: _formKey,
                    child: Padding(
                      padding: formPadding,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Field(
                                controller: nameController,
                                label: "Full Name",
                                hintText: "",
                                validator: (value) => validateString(value)),
                            SizedBox(
                              height: 20,
                            ),
                            Field(
                                controller: emailController,
                                label: "Email",
                                hintText: "",
                                validator: (value) => validateEmail(value)),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(height: 22),
                            Field(
                              controller: phoneController,
                              label: "Phone Number",
                              hintText: "",
                              validator: (value) => validatePhoneNumber(value),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Currently Employed?",
                              style: heading2(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Yes"),
                                Radio<String>(
                                    value: "Yes",
                                    groupValue: _selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    }),
                                Spacer(),
                                Text("No"),
                                Radio<String>(
                                    value: "No",
                                    groupValue: _selectedOption ?? "No",
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    }),
                              ],
                            ),

                            // Field(context, "Currently Employed", ""),
                            SizedBox(
                              height: 20,
                            ),

                            _selectedOption == "Yes"
                                ? Column(
                                    children: [
                                      Field(
                                          controller: companyController,
                                          label: "Current Company",
                                          hintText: "",
                                          validator: (value) =>
                                              validateString(value)),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Field(
                                          controller: positionController,
                                          label: "Position",
                                          hintText: "",
                                          validator: (value) {
                                            return validateNonEmptyField(value);
                                          }

                                          // validateNonEmpty(value)

                                          )
                                    ],
                                  )
                                : Container(),
                            SizedBox(
                              height: 20,
                            ),
                            AttachPDFField(
                                validator: (value) => validateNonEmpty(value),
                                label: "Upload CV/Resume",
                                // hintText: "Browse file",
                                onFileSelected: onFileSelected),
                            error != null
                                ? Text(
                                    error!,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.red),
                                  )
                                : Container(),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                child: primaryButton("Submit", () async {
                                  // await ApplicationsServ()
                                  //     .uploadFile(pickedFile!);

                                  if (_formKey.currentState!.validate()) {
                                    print("validatedd");

                                    final application = ApplicationModel(
                                      userId: "vGJ9LenHvggttunadLiYTXTwnxv2",
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      currentlyEmployed: _selectedOption,
                                      currentCompany: _selectedOption == "Yes"
                                          ? companyController.text
                                          : null,
                                      position: _selectedOption == "Yes"
                                          ? positionController.text
                                          : null,
                                      jobId: widget.jobId,
                                    );

                                    print(
                                        ref.read(applyForJobProvider.notifier));

                                    ref
                                        .read(applyForJobProvider.notifier)
                                        .sendApplication(
                                            application, pickedFile!, context);

                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Success()));
                                  }
                                })),
                          ]),
                    ),
                  ),
          ),
        ),
      );
    });
  }
}

List<String> options = ["Yes", "No"];
