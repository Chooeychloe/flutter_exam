import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/src/config/service_locator.dart';
import 'package:flutter_exam/src/features/application/person_cubit.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';
import 'package:flutter_exam/src/features/data/repository/person_remote_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    if (getIt.isRegistered<IPersonRepository>()) {
      getIt.unregister<IPersonRepository>();
    }
    if (getIt.isRegistered<PersonCubit>()) {
      getIt.unregister<PersonCubit>();
    }
    super.dispose();
  }

  @override
  void initState() {
    if (!getIt.isRegistered<IPersonRepository>()) {
      getIt.registerFactory<IPersonRepository>(() => PersonRemoteRepository());
    }
    if (!getIt.isRegistered<PersonCubit>()) {
      getIt.registerFactory<PersonCubit>(
          () => PersonCubit(getIt<IPersonRepository>()));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<PersonCubit>(
      create: (context) => getIt<PersonCubit>()..initialize(),
      child: BlocConsumer<PersonCubit, PersonState>(
        builder: (context, state) {
          final bloc = context.read<PersonCubit>();
          final personList = bloc.personList;
          return Center(
              child: ListView(
            children: [
              ...personList.map((e) => Column(
                    children: [
                      Text(e.firstname!),
                      Text("address:${e.address!.streetName!}")
                    ],
                  )),
            ],
          ));
        },
        listener: (context, state) {},
      ),
    ));
  }
}
