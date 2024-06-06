import 'package:flutter/material.dart';
import 'package:somaapp/model/user_model.dart';
import 'package:somaapp/screens/DetailPage.dart';
import 'package:somaapp/services/api_services.dart';
 // Import the detail page

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<UserModel>? _userModels = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final apiService = ApiService();
      final userModels = await apiService.getUsers();
      setState(() {
        _userModels = userModels;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

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
                fontFamily: 'Poppins',
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
              child: _userModels?.isNotEmpty ?? false
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: _userModels?.length ?? 0,
                      itemBuilder: (context, index) {
                        final userModel = _userModels?[index];
                        return GestureDetector(
                          onTap: () {
                            // Navigate to the detail page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  userModel: userModel!,
                                ),
                              ),
                            );
                          },
                          child: UserCard(
                            username: userModel?.username ?? '',
                            phone: userModel?.phone ?? '',
                            name: userModel?.name ?? '',
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'Sorry, there is no subjects available at the moment.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 206, 49, 49),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final String username;
  final String phone;
  final String name;

  UserCard({
    required this.username,
    required this.phone,
    required this.name,
  });

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
          Text(
            username,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 42, 10, 102),
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 10),
          Text(
            phone,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}