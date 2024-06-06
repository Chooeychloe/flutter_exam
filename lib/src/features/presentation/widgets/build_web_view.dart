import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/src/config/service_locator.dart';
import 'package:flutter_exam/src/core/widgets/custom_footer_widget.dart';
import 'package:flutter_exam/src/features/application/person_cubit.dart';
import 'package:flutter_exam/src/features/data/model/person_model.dart';
import 'package:flutter_exam/src/features/data/repository/i_person_repository.dart';
import 'package:flutter_exam/src/features/data/repository/person_remote_repository.dart';

class BuildWebView extends StatefulWidget {
  final int displayedItemsCount;
  final bool noMoreItems;
  final VoidCallback loadMoreItems;

  const BuildWebView({
    super.key,
    required this.displayedItemsCount,
    required this.noMoreItems,
    required this.loadMoreItems,
  });

  @override
  State<BuildWebView> createState() => _BuildWebViewState();
}

class _BuildWebViewState extends State<BuildWebView> {
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
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: itemCount + 1,
                    itemBuilder: (context, index) {
                      if (index < itemCount) {
                        final persons = personList[index];
                        final position = index + 1;
                        return ListTile(
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
                        return CustomFooterWidget(
                            noMoreItems: widget.noMoreItems);
                      }
                    },
                  ),
                ),
                if (!widget.noMoreItems &&
                    widget.displayedItemsCount < personList.length)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: widget.loadMoreItems,
                      child: Text('Load More'),
                    ),
                  ),
              ],
            );
          },
          listener: (context, state) {},
        ));
  }
}
