import 'package:flutter/material.dart';

import '../../../../core/data/static_data.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/post.dart';
import '../bloc/post_bloc.dart';
import 'user_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  final _bloc = sl<PostBloc>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            child: TextField(
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide()),
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.sort_by_alpha_outlined),
                  onPressed: () {},
                ),
                hintText: "Search food",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
            ),
          ),
          StreamBuilder<List<Post>>(
              stream: _bloc.posts(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.length > 0)
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Post post = snapshot.data![index];
                          return GestureDetector(
                            onTap: () => showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: UserDetailsPage(user: post.user))),
                            child: Card(
                              child: Column(
                                children: [
                                  Container(
                                    child: FadeInImage(
                                      image: NetworkImage(post.image),
                                      placeholder:
                                          AssetImage(Images.placeholder),
                                      imageErrorBuilder:
                                          (context, error, stackTrace) => Icon(
                                        Icons.error,
                                        size: 40,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  ListTile(
                                    trailing: Container(
                                      child: Text("${post.likes}\u2605"),
                                    ),
                                    title: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Text(post.text)),
                                    subtitle: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(post.publishDate),
                                            Wrap(
                                                children: []
                                                  ..addAll(List.generate(
                                                      post.tags.length,
                                                      (index) => Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 3),
                                                            child: Chip(
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFFBBB3D),
                                                              label: Text(
                                                                  post.tags[
                                                                      index],
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                            ),
                                                          ))))
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                else if (snapshot.hasData && snapshot.data!.length == 0)
                  return Column(
                    children: [
                      Container(
                        child: Icon(Icons.error),
                      ),
                      Container(
                        child: Text("No Data is available"),
                      )
                    ],
                  );
                return Center(child: CircularProgressIndicator.adaptive());
              }),
        ],
      ),
    );
  }
}
