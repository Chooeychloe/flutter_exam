import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/src/config/service_locator.dart';
import 'package:flutter_exam/src/features/application/person_cubit.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';
import 'package:flutter_exam/src/features/data/repository/person_remote_repository.dart';
import 'package:flutter_exam/src/features/presentation/widgets/build_mobile_view.dart';
import 'package:flutter_exam/src/features/presentation/widgets/build_web_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int itemsPerPage = 10;
  int displayedItemsCount = 10;
  bool noMoreItems = false;
  void _loadMoreItems(int totalItems) {
    setState(() {
      if (displayedItemsCount < totalItems) {
        displayedItemsCount += itemsPerPage;
        if (displayedItemsCount >= totalItems) {
          displayedItemsCount = totalItems;
          noMoreItems = true;
        }
      } else {
        noMoreItems = true;
      }
    });
  }

  Future<void> _refreshItems(BuildContext context) async {
    setState(() {
      displayedItemsCount = itemsPerPage;
      noMoreItems = false;
    });
    context.read<PersonCubit>().initialize();
  }

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
    return BlocProvider<PersonCubit>(
      create: (context) => getIt<PersonCubit>()..initialize(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Person List'),
          ),
          body: kIsWeb
              ? BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return BuildWebView(
                      displayedItemsCount: displayedItemsCount,
                      noMoreItems: noMoreItems,
                      loadMoreItems: () {
                        _loadMoreItems(
                            context.read<PersonCubit>().personList.length);
                      },
                      onRefresh: () => _refreshItems(context),
                    );
                  },
                )
              : BlocBuilder<PersonCubit, PersonState>(
                  builder: (context, state) {
                    return BuildMobileView(
                      displayedItemsCount: displayedItemsCount,
                      noMoreItems: noMoreItems,
                      loadMoreItems: () {
                        _loadMoreItems(
                            context.read<PersonCubit>().personList.length);
                      },
                      onRefresh: () => _refreshItems(context),
                    );
                  },
                )),
    );
  }
}
