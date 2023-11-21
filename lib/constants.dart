import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: '',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
);

const kCampaignListTitleStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Color(0xff846A47),
  letterSpacing: 0.8,
);

const kCampaignListButtonStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.6,
);
