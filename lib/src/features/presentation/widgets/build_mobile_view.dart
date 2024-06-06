import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/src/config/service_locator.dart';
import 'package:flutter_exam/src/core/widgets/custom_footer_widget.dart';
import 'package:flutter_exam/src/features/application/person_cubit.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';
import 'package:flutter_exam/src/features/data/repository/person_remote_repository.dart';

class BuildMobileView extends StatefulWidget {
  final int displayedItemsCount;
  final bool noMoreItems;
  final VoidCallback loadMoreItems;
  final Future<void> Function() onRefresh;

  const BuildMobileView({
    super.key,
    required this.displayedItemsCount,
    required this.noMoreItems,
    required this.loadMoreItems,
    required this.onRefresh,
  });

  @override
  State<BuildMobileView> createState() => _BuildMobileViewState();
}

class _BuildMobileViewState extends State<BuildMobileView> {
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
      child: BlocConsumer<PersonCubit, PersonState>(
        builder: (context, state) {
          final bloc = context.read<PersonCubit>();
          final personList = bloc.personList;
          final itemCount = widget.displayedItemsCount <= personList.length
              ? widget.displayedItemsCount
              : personList.length;

          return RefreshIndicator(
            onRefresh: widget.onRefresh,
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification &&
                    scrollNotification.metrics.pixels ==
                        scrollNotification.metrics.maxScrollExtent) {
                  widget.loadMoreItems();
                  return true;
                }
                return false;
              },
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: itemCount + 1,
                itemBuilder: (context, index) {
                  if (index < itemCount) {
                    final persons = personList[index];
                    final position = index + 1;
                    return ListTile(
                      onTap: () {},
                      title: Text(
                          "$position. ${persons.firstname!} ${persons.lastname!}"),
                      subtitle: Text(persons.email!),
                      leading: FadeInImage.assetNetwork(
                        placeholder: "assets/images/image_placeholder.jpg",
                        image: persons.image!,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/images/error.png");
                        },
                      ),
                    );
                  } else {
                    return CustomFooterWidget(noMoreItems: widget.noMoreItems);
                  }
                },
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
