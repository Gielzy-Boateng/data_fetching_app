import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_provider/bloc/user_bloc.dart';
import 'package:repository_provider/bloc/user_event.dart';
import 'package:repository_provider/bloc/user_state.dart';
import 'package:repository_provider/data/model/user_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 12, 136, 194),
        title: const Text(
          'Staff Information',
          style: TextStyle(
              color: Color.fromARGB(255, 252, 242, 242),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserErrorState) {
            return const Center(child: Text('Error fetching data'));
          }
          if (state is UserSuccessState) {
            // Assuming state.userModel.data is now guaranteed to be non-null
            List<Datum> userList =
                state.userModel.data ?? []; // Default to an empty list if null

            // No need to check for null anymore since data is non-nullable
            if (userList.isEmpty) {
              return const Center(child: Text('No data found'));
            }

            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Card(
                    child: ListTile(
                        title: Text(
                          '${userList[index].firstName} ${userList[index].lastName}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        subtitle: Text('${userList[index].email}'),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(userList[index].avatar.toString()),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.blue[900],
                          child: Text(
                            '${userList[index].id}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                );
              },
            );
          }
          return const Center(
              child: Text(
            'Tap on the refresh button to load data',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 33, 4, 248)),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<UserBloc>().add(LoadUserEvent());
        },
        child: const Icon(Icons.refresh_outlined),
      ),
    );
  }
}
