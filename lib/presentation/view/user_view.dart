import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/bloc/user/user_bloc.dart';
import 'package:test_flutter/core/data/model/user.dart';
import 'package:test_flutter/injection_container.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final UserBloc userBloc = sl();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => userBloc..add(const GetUser()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "User View",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                switch (state) {
                  case UserSuccess():
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.data!.user!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var user = state.data!.user![index];
                        return itemUser(user);
                      },
                    );
                  case UserError():
                    return Container();
                  default:
                    return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget itemUser(User user) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    user.avatar!,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${user.firstName} ${user.lastName}",
                        style: const TextStyle(fontSize: 16)),
                    Text(user.email!, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
