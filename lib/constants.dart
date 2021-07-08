import 'package:flutter/material.dart';

const TextStyle webooktextStyle = TextStyle(
  letterSpacing: -0.2,
  fontWeight: FontWeight.bold,
);
const Color purpleColor = Color(0xFF433876);
const Color blackColor = Color(0xFF1e1e1e);
const Color greenColor = Color(0xFF40a940);
const Color orangeColor = Color(0xFFf15f23);

var productInfo = [
  {
    "ProductID": "1",
    "ProductName": "Nike Shoes",
    "ProductPrice": 10500,
    "ProductUnit": "Whole",
    "Image": "shoes.png"
  },
  {
    "ProductID": "2",
    "ProductName": "Whole peanuts",
    "ProductPrice": 200,
    "ProductUnit": "Whole",
    "Image": "peanut.png"
  },
  {
    "ProductID": "3",
    "ProductName": "Apple",
    "ProductPrice": 60,
    "ProductUnit": "KG",
    "Image": "apple.png"
  },
  {
    "ProductID": "4",
    "ProductName": "Purse",
    "ProductPrice": 5000,
    "ProductUnit": "Whole",
    "Image": "purse.png"
  },
  {
    "ProductID": "5",
    "ProductName": "Pineapple",
    "ProductPrice": 230,
    "ProductUnit": "KG",
    "Image": "pineapple.png"
  },
  {
    "ProductID": "6",
    "ProductName": "Orange",
    "ProductPrice": 140,
    "ProductUnit": "Dozen",
    "Image": "orange.png"
  },
  {
    "ProductID": "7",
    "ProductName": "Whey Protein",
    "ProductPrice": 2400,
    "ProductUnit": "Whole",
    "Image": "whey.png"
  },
  {
    "ProductID": "8",
    "ProductName": "T-Shirt",
    "ProductPrice": 1300,
    "ProductUnit": "Whole",
    "Image": "tshirt.png"
  },
];

var transactions = [
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 05,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Nike Shoes",
    "ProductPrice": 10500,
    "ProductUnit": "Whole",
    "Image": "shoes.png"
  },
  {
    "TransactionId": "k48j8dk4vd",
    "Year": 2021,
    "Month": 12,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Whole peanuts",
    "ProductPrice": 200,
    "ProductUnit": "Whole",
    "Image": "peanut.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 02,
    "Day": 01,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Apple",
    "ProductPrice": 60,
    "ProductUnit": "KG",
    "Image": "apple.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 01,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Purse",
    "ProductPrice": 5000,
    "ProductUnit": "Whole",
    "Image": "purse.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 03,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Pineapple",
    "ProductPrice": 230,
    "ProductUnit": "KG",
    "Image": "pineapple.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2020,
    "Month": 02,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Orange",
    "ProductPrice": 140,
    "ProductUnit": "Dozen",
    "Image": "orange.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 02,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "Whey Protein",
    "ProductPrice": 2400,
    "ProductUnit": "Whole",
    "Image": "whey.png"
  },
  {
    "TransactionId": "h47j8dk4vd",
    "Year": 2021,
    "Month": 02,
    "Day": 04,
    "Hour": 22,
    "Minute": 12,
    "Second": 14,
    "ProductName": "T-Shirt",
    "ProductPrice": 1300,
    "ProductUnit": "Whole",
    "Image": "tshirt.png"
  },
];

var differentListInfo = [
  {"ListName": "Eid Shopping", "ListDate": "07/19/2021"},
  {"ListName": "14 august", "ListDate": "08/14/2021"},
  {"ListName": "Wife Shopping", "ListDate": "07/10/2021"},
];

var individualListInfo = [
  {
    "ListName": "Eid Shopping",
    "ProductID": ["1", "2", "3"],
  },
  {
    "ListName": "Wife Shopping",
    "ProductID": ["3", "5", "7"],
  }
];
