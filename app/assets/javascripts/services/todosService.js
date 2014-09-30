angular.module('todosService', ['ngResource'])
  .factory('Todos', function($resource) {
    return $resource('todos.json', {}, { 
      index: { method: 'GET', isArray: true},
      create: { method: 'POST' }
    });
  })
  .factory('Organizations', function($resource) {
    return $resource('orgns.json', {}, { 
      orgns: { method: 'GET', isArray: true}
    });
  })
  .factory('People', function($resource) {
    return $resource('persn.json', {}, { 
      persn: { method: 'GET', isArray: true}
    });
  })
  .factory('Organization', function($resource) {
    return $resource('orgns.json', {}, { 
      orgns: { method: 'GET', isArray: true}
    });
  })
  .factory('Person', function($resource) {
    return $resource('persn.json', {}, { 
      persn: { method: 'GET', isArray: true}
    });
  })
  .factory('Pple', function($resource) {
    return $resource('pple.json', {}, { 
      pple: { method: 'GET', isArray: true}
    });
  })
  .factory('Todo', function($resource){
    return $resource('todos/:todo_id.json', {}, {
      show: { method: 'GET' },
      update: { method: 'PUT' },
      destroy: { method: 'DELETE' }
    });
  });




