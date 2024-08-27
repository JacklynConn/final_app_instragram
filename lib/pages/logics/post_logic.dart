import 'package:flutter/foundation.dart';
import '../../models/post_model.dart';

class PostLogic extends ChangeNotifier{
  final List<PostModel> _favoriteList = [];
  List<PostModel> get favoriteList => _favoriteList;

  void addPostToFavorite(PostModel post){
    _favoriteList.add(post);
    notifyListeners();
  }

  void removePostFromFavorite(PostModel post){
    _favoriteList.remove(post);
    notifyListeners();
  }

  bool isFavorite(PostModel post){
   return _favoriteList.contains(post);
  }

  bool isFavoriteListEmpty(){
    return _favoriteList.isEmpty;
  }
}