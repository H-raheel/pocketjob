import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/utils/colors.dart';
import 'package:pocketjob/utils/texts.dart';

Column Field(BuildContext context, String label, String hintText) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: heading2(),
      ),
      SizedBox(
        height: 12,
      ),
      TextFormField(
        decoration: InputDecoration(
            focusColor: Theme.of(context).colorScheme.primary,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor, width: 2),
                borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(16),
            hintText: hintText,
            hintStyle: subheading2(),
            fillColor: fieldColor,
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    ],
  );
}

void _pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowedExtensions: ['pdf'],
  );
  if (result != null && result.files.single.path != null) {
    PlatformFile file = result.files.first;
    print(file.name);
  }
}

class AttachPDFField extends StatefulWidget {
  final String label;
  final String hintText;

  AttachPDFField({required this.label, required this.hintText});

  @override
  _AttachPDFFieldState createState() => _AttachPDFFieldState();
}

class _AttachPDFFieldState extends State<AttachPDFField> {
  File? selectedFile;
  @override
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
          color: mainColor,
          radius: Radius.circular(10),
          borderType: BorderType.RRect,
          strokeWidth: 4,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
                color: fieldColor, borderRadius: BorderRadius.circular(10)),
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
                              File file = File(result.files.single.path!);
                              setState(() {
                                selectedFile = file;
                              });
                              print(file.path);
                            } else {
                              // User canceled the picker
                            }
                          },
                          icon: const Icon(
                            Icons.upload_file_rounded,
                            size: 40,
                            color: mainColor,
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
          ),
        )
      ],
    );
  }
}
