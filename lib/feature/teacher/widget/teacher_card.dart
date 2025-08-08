import 'package:flutter/material.dart';

import '../../../core/utils/assets.dart';

class TeacherCard extends StatelessWidget {
  const TeacherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 400,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.asset(
                  AssetImages.teacher,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text("Mr.Ali Ahmed"),
                      SizedBox(height: 4),
                      Text("Science"),
                      SizedBox(height: 4),
                      Expanded(
                        child: Text(
                          "fsdjfsdjkfdskjfdfjkhfsdjfhsjdkfhsdkjfhdskjfhdfkjhfksdhfjskdhfsdkfhsdkfhfkjsdhfkjsdhfkjfhskjfhsdkfhkfhfhfsgrpjrgrpovjerpgjrpogjgpojs",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
