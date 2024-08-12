import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/data_user.dart';
import '../../provider/provider.dart';
import '../../utils/api_endpoints.dart';

class ThirdScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  Future<List<User>> _fetchUsers(int page, int perPage) async {
    return await apiService.fetchUsers(page: page, perPage: perPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.blue,
          ),
          title: Center(
            child: Text(
              'Third Screen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<User>>(
        future: _fetchUsers(1, 10), // Fetch initial page
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No users found'));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                  onTap: () {
                    final model =
                        Provider.of<PalindromeModel>(context, listen: false);
                    model.selectedUserName =
                        '${user.firstName} ${user.lastName}';
                    Navigator.pop(context);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
