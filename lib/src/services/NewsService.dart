import 'package:flutter/material.dart';
import 'package:newsapp/src/models/ArticleModel.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/src/models/CategoryModel.dart';
import 'package:newsapp/src/models/NewsModels.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


final _URL_NEWS = 'https://newsapi.org/v2/';
final _API_KEYS = '96aec486cf064dcc86e8ebc17804e9dc';

class NewService with ChangeNotifier{



  List<Article> headlines = [];
  String _selectedCategory = 'business';
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String,List<Article>> categoryArticle = {};

    NewService(){
      this.getTopHeadLines();
      categories.forEach((element) {
        this.categoryArticle[element.name] = new List();
      });

    }

    //getter y seetter
    get selectedCategory => this._selectedCategory;
    set selectedCategory(String valor){
      this._selectedCategory = valor;
      this.getArticlesByCategory(valor);
      notifyListeners();
    }

    List<Article> get getArticuloscategoriaSeleccionada => this.categoryArticle[this.selectedCategory];

    getTopHeadLines()async{
      final url = '${_URL_NEWS}top-headlines?apiKey=$_API_KEYS&country=us';
      final resp = await http.get(url);
      final newsResponse = newsResponseFromJson(resp.body);
      this.headlines.addAll(newsResponse.articles);
      notifyListeners();
    }

    getArticlesByCategory(String category)async{

      if(this.categoryArticle[category].length >0 ){
        return this.categoryArticle[category];
      }

      final url = '${_URL_NEWS}top-headlines?apiKey=$_API_KEYS&country=us&category=$category';
      final resp = await http.get(url);
      final newsResponse = newsResponseFromJson(resp.body);
      this.categoryArticle[category].addAll(newsResponse.articles);



      // this.headlines.addAll(newsResponse.articles);
      notifyListeners();
    }

}