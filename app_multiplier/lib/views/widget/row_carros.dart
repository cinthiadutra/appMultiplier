import 'package:flutter/material.dart';

class RowCarros extends StatelessWidget {
  const RowCarros({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/mercedes.jpg'),
        Column(
          children: [
            const Text(
              '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Text(
              'data',
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'ver mais..,',
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
