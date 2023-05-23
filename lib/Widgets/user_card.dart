import 'package:flutter/material.dart';
import 'package:people_cards_test/Models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(16),
      ),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.network(user.photo.photoUrl, fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              width: double.infinity,
              color: const Color(0xFFEBEBEB),
              height: 44,
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(user.name.firstName, style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        )),
                        const Spacer(),
                        Text(user.dob.age.toString(), style: const TextStyle(
                          fontWeight: FontWeight.w900,
                        )),
                      ],
                    ),
                    Text(user.name.lastName, style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ))
                  ]
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
  }
}

