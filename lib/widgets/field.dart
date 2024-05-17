import 'package:flutter/material.dart';
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
            fillColor: Color.fromARGB(69, 212, 210, 210),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    ],
  );
}

Column AttachPDFField(BuildContext context, String label, String hintText) {
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
            contentPadding: EdgeInsets.all(30),
            //  hintText: hintText,
            //  hintStyle: subheading2(),
            fillColor: Color.fromARGB(69, 212, 210, 210),
            filled: true,
            prefixIcon: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    Icons.upload_file,
                  ),
                  Text(
                    hintText,
                    style: subheading2(),
                  )
                ],
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    ],
  );
}
