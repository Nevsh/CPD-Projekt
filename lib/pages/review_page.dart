import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      // appBar: AppBar(
      //   title: const Text(
      //     'Review',
      //     style: TextStyle(
      //       fontSize: 32,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.yellow[600],
      // ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        leading: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 24),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 32,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }
}
