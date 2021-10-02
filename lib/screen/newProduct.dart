import 'package:flutter/material.dart';

class NewProduct extends StatefulWidget {
  static const routeName = 'new';
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  final _priceFocusNode = FocusNode();
  final _titleFocusNode = FocusNode();
  final _descFocusNode = FocusNode();
  final _urlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _urlFocusNode.addListener((updateURL));
    super.initState();
  }

  void updateURL() {
    if (!_urlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _urlFocusNode.removeListener(updateURL);
    _priceFocusNode.dispose();
    _titleFocusNode.dispose();
    _descFocusNode.dispose();
    _urlFocusNode.dispose();
    _imageUrlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              focusNode: _titleFocusNode,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descFocusNode);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              textInputAction: TextInputAction.next,
              focusNode: _descFocusNode,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_titleFocusNode);
              },
            ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Image URL'),
            //   textInputAction: TextInputAction.next,
            //   focusNode: _urlFocusNode,
            //   onFieldSubmitted: (_) {
            //     FocusScope.of(context).requestFocus(_titleFocusNode);
            //   },
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 8, right: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 5, color: Colors.grey)),
                  child: _imageUrlController.text.isEmpty
                      ? Text('Enter a URL')
                      : FittedBox(
                          child: Image.network(_imageUrlController.text),
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Image Url'),
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    controller: _imageUrlController,
                    focusNode: _urlFocusNode,
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
