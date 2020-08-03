import 'package:flutter/material.dart';
import 'package:newsapp/src/models/CategoryModel.dart';
import 'package:newsapp/src/services/NewsService.dart';
import 'package:newsapp/src/widgets/ListaNoticias.dart';
import 'package:provider/provider.dart';

import '../theme/tema.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newService = Provider.of<NewService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Expanded(child: _ListaCategorias()),
            _ListaCategorias(),
            Expanded(
              child: ListaNoticias(
                newService.getArticuloscategoriaSeleccionada
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
          child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categories[index].name;

          return Container(
            // width: 110,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryButton(categories[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
            final newService = Provider.of<NewService>(context, listen: false);
    return GestureDetector(
      onTap: () {
        newService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: (newService.selectedCategory == categoria.name) ? miTema.accentColor : Colors.black54

        ),
      ),
    );
  }
}
