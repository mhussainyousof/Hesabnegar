import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'book_list.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,

            //
            //
            //! HEADER PART
            body: BookList()));
  }
}

class Book {
  final String title;
  final String image;
  final String subtite;
  Book({
    required this.title,
    required this.image,
    required this.subtite,
  });
}

final List<Book> books = [
  Book(
    title: 'پدر پول دار، پدر بی پول',
    image: 'assets/images/father.jpg',
    subtite: 'رابرت کیوساکی و شارون لیچر',
  ),
  Book(
      title: 'روان شناسی پول',
      image: 'assets/images/money.jpg',
      subtite: 'مورگان هاوسل'),
  Book(
      title: 'رسیدن به استقلال مالی',
      image: 'assets/images/reach.jpg',
      subtite: 'برایان تریسی'),
  Book(
      title: 'اسرار ذهن ثروت مند',
      image: 'assets/images/secret.jpg',
      subtite: 'تی. هارواکر'),
  Book(
      title: 'مدیریت مالی موفق',
      image: 'assets/images/success.jpg',
      subtite: 'رابرت کیوساکی'),
  Book(
      title: 'سیستم های مدیریت هزینه',
      image: 'assets/images/system.jpg',
      subtite: 'سید مهدی سید مطهری'),
];

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  const FullScreenImage(this.imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

