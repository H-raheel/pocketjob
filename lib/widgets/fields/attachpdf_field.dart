

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class AttachPDFField extends StatefulWidget {
  final String label;
  final String? Function(File?)? validator;
  final Function(PlatformFile)? onFileSelected; // New parameter

  AttachPDFField({required this.label, this.validator, this.onFileSelected});

  _AttachPDFFieldState createState() => _AttachPDFFieldState();
}

class _AttachPDFFieldState extends State<AttachPDFField> {
  File? selectedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: heading2(),
        ),
        const SizedBox(
          height: 12,
        ),
        DottedBorder(
          color: Theme.of(context).colorScheme.primary,
          radius: Radius.circular(10),
          borderType: BorderType.Rect,
          strokeWidth: 4,
          child: FormField<File>(
            validator: (value) {
              return widget.validator!(selectedFile);
            },
            builder: (formFieldState) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(
                    color: Color.fromARGB(69, 212, 210, 210),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: selectedFile == null
                      ? [
                          IconButton(
                              onPressed: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                  ],
                                  allowMultiple: false,
                                );

                                if (result != null) {
                                  PlatformFile sendVal = result.files.first;
                                  File file = File(result.files.single.path!);
                                  setState(() {
                                    selectedFile = file;
                                  });

                                  if (widget.onFileSelected != null) {
                                    widget.onFileSelected!(sendVal);
                                  }
                                }
                              },
                              icon: Icon(
                                Icons.upload_file_rounded,
                                size: 40,
                                color: Theme.of(context).colorScheme.primary,
                              )),
                          Text(
                            "Choose File",
                            style: subheading(),
                          ),
                        ]
                      : [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/pdf_logo.png',
                                width: 70,
                                height: 70,
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedFile = null;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                    size: 20,
                                  ))
                            ],
                          ),
                          Text('${selectedFile!.path.split('/').last}'),
                        ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
