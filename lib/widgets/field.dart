import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pocketjob/utils/texts.dart';

class Field extends StatelessWidget {
  final String label;
  final String hintText;
  bool defaultVal = true;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  Field(
      {Key? key,
      this.defaultVal = true,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: heading2(),
        ),
        const SizedBox(
          height: 12,
        ),
        TextFormField(
          enabled: defaultVal,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusColor: Theme.of(context).colorScheme.primary,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: subheading2(),
              fillColor: Color.fromARGB(69, 212, 210, 210),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const PasswordField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hintText,
      required this.validator})
      : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisible = false;
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: heading2(),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: _passwordVisible,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              focusColor: Theme.of(context).colorScheme.primary,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(10)),
              contentPadding: const EdgeInsets.all(10),
              hintText: widget.hintText,
              hintStyle: subheading2(),
              fillColor: Color.fromARGB(69, 212, 210, 210),
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
  }
}

class CustomDropDownField extends StatefulWidget {
  final List<String> list;
  final String label;
  String? current;
  final IconData icon;
  final ValueChanged<String?>? onChanged; // Add a callback parameter

  CustomDropDownField({
    super.key,
    required this.list,
    required this.label,
    required this.icon,
    required this.current,
    this.onChanged, // Initialize the callback parameter
  });

  @override
  State<CustomDropDownField> createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  void initState() {
    super.initState();
    if (widget.current != null && !widget.list.contains(widget.current)) {
      widget.current = null; // Reset current if it's not a valid value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: heading2(),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 60,
          child: DropdownButtonFormField<String>(
            value: widget.current != "" ? widget.current : null,
            itemHeight: 55,
            items: widget.list
                .map((g) => DropdownMenuItem(child: Text(g), value: g))
                .toList(),
            onChanged: (value) {
              setState(() {
                widget.current = value;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value); // Trigger the callback
              }
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).primaryColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(69, 212, 210, 210),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(
                widget.icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AttachPDFField extends StatefulWidget {
  final String label;
  final String? Function(File?)? validator;
  final Function(PlatformFile)? onFileSelected; // New parameter

  AttachPDFField({required this.label, this.validator, this.onFileSelected});

  @override
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
