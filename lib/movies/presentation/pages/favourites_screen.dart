
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utills/app_constance.dart';
import '../controller/favourites/favourites_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                centerTitle: true,
                iconTheme: const IconThemeData(color: Colors.white),
                title: const Text(
                  "My favourites",
                  style: TextStyle(color: Colors.white),
                )),
            body: BlocBuilder<FavouritesBloc, FavouritesState>(
                buildWhen: (previous, current) => previous != current,
                builder: ((context, state) {
                  print(state.hashCode);
              if (state is LoadingGetAllFavouritesState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
                  } else if (state is LoadedGetAllFavouritesState && state.show.isNotEmpty ) {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: .7),
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl:
                          AppConstance.imageUrl(state.show[index]!.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                      itemCount: state.show.length,
                    );
                  }else if (state is LoadedGetToggleFavouritesState && state.show.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: .7),
                      itemBuilder: (context, index)
                      {

                  return  CachedNetworkImage(
                    width: 120.0,
                    fit: BoxFit.cover,
                    imageUrl:
                    AppConstance.imageUrl(state.show[index]!.backdropPath),
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[850]!,
                      highlightColor: Colors.grey[800]!,
                      child: Container(
                        height: 170.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  );
                  },
                      itemCount: state.show.length,
                    );
                  }
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 65,
                          ),
                          const SizedBox(height: 16),
                          const Text('No favourites yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 16),
                          const Text(
                            'Tap on the heart icon to add the product to your favorites list.',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
