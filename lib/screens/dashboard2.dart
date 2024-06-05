import 'package:flutter/material.dart';
import 'package:somaapp/model/user_model.dart';
import 'package:somaapp/services/api_services.dart';

class MainPage extends StatelessWidget {
  late List<UserModel>? _userModel = [];

 
  final List<Category> categories = [
    Category(name: 'Maths', imagePath: 'assets/pic1.png'),
    Category(name: 'English', imagePath: 'assets/pic2.png'),
    Category(name: 'Kiswahili', imagePath: 'assets/pic3.png'),
    Category(name: 'Agriculture', imagePath: 'assets/pic4.png'),
    Category(name: 'C.R.E', imagePath: 'assets/pic1.png'),
    Category(name: 'I.R.E', imagePath: 'assets/pic1.png'),
    Category(name: 'Business Studies', imagePath: 'assets/pic1.png'),
    Category(name: 'Home Science', imagePath: 'assets/pic1.png'),
  ];
   

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00BFFF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and Profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 
                Image.asset(
                  'assets/pic1.png',
                  width: 60,
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the next page
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/pic5.png'),
                    radius: 30,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'SomaApp',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 4, 75, 6),
                fontFamily: 'Poppins'
              ),
            ),
            
            const SizedBox(height: 10),
            const Text(
              'What would you like to study?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            // Categories Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(category: categories[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  

  final Category category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.imagePath,
            width: 80,
            height: 80,
          ),
          const SizedBox(height: 10),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class Category {
  final String name;
  final String imagePath;

  Category({
    required this.name,
    required this.imagePath,
  });
}
