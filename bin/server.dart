import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main() {

  var myRouter = router()
    ..get('/', responseRoot)
    ..get('/stu', forstu);

  io.serve(myRouter.handler, '127.0.0.1', 8080);
}

forstu(request){

  return new Response.ok("Hello of age ");
}

responseRoot(request){
  return new Response.ok("Hello World");
}

