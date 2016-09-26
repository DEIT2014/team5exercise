<<<<<<< HEAD
// Copyright (c) 2016, icecreamtoo. All rights reserved. Use of this source code
=======
// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
>>>>>>> origin/small_program
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

InputElement toDoInput;
UListElement toDoList;

void main() {
toDoInput = querySelector('#to-do-input');
toDoList = querySelector('#to-do-list');
toDoInput.onChange.listen(addToDoItem);
}

void addToDoItem(Event e) {
var newToDo = new LIElement();
newToDo.text = toDoInput.value;
toDoInput.value = '';
toDoList.children.add(newToDo);
}
