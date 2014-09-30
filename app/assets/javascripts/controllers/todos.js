function TodosCtrl($scope, $location, Todos, Todo) {
    "use strict";
    $scope.todos = Todos.index();
    $scope.remove = function(id) {
        var title = 'Delete Todo?', msg = 'Are you sure you want to delete this todo?', btns = [{
            result : 'cancel',
            label : 'Cancel'
        }, {
            result : 'ok',
            label : 'OK',
            cssClass : 'btn-primary'
        }];

             var result1 =  confirm(msg);
                if (result1 === true ) {
                Todo.destroy({
                    todo_id : id
                }, function() {
                    $location.path('/todos');
                });
            }

        $scope.todos = Todos.index();
    };
    
    $scope.convertBoolean = function(val) {
        return val ? 'Yes' : 'No';
    };
}

function TodoShowCtrl($scope, $location, $routeParams, Todo) {"use strict";
    $scope.mytodo_id = "show"
    $scope.todo = Todo.show({
        todo_id : $routeParams.todo_id
    });

		$scope.remove = function(id) {
        var title = 'Delete Todo?', msg = 'Are you sure you want to delete this todo?', btns = [{
            result : 'cancel',
            label : 'Cancel'
        }, {
            result : 'ok',
            label : 'OK',
            cssClass : 'btn-primary'
        }];

			 var result1 =	confirm(msg);
				if (result1 === true ) {
                Todo.destroy({
                    todo_id : id
                }, function() {
                    $location.path('/todos');
                });
            }

        
    };
    
    $scope.convertBoolean = function(val) {
        return val ? 'Yes' : 'No';
    };


}

function TodoAddCtrl($scope, $location, Todos, Todo, Organizations, People) {
    "use strict";
    $scope.todo = {};
    $scope.organizations = Organizations.orgns();
    $scope.change = function() {
        $scope.people = People.persn({
                organization_id : $scope.todo.organization_id
        });
        
    }
    $scope.create = function(todo) {
				//alert("success");
        var todoService = new Todos(todo);
				//alert("success1");
        todoService.$create(function(todo) {
						//alert("success2");
						$location.path('/todos');
        });
    }
}

function TodoEditCtrl($scope, $routeParams, $location, Todo, Organizations, People, Pple) {
    "use strict";
    
    $scope.master = {};
    var todo_id = $routeParams.todo_id;

    $scope.todo = Todo.show({
        todo_id : todo_id
    }, function(resource) {
        $scope.master = angular.copy(resource);
    });
    
    $scope.check = function() {
        $scope.organizations = Organizations.orgns();
        $scope.pple = Pple.pple({
            todo_id : todo_id
        });
    }
    $scope.change = function() {
        $scope.todo.person_id= null;
        $scope.pple = People.persn({
                organization_id : $scope.todo.organization_id
        });
        
    }

    $scope.update = function(todo) {
        todo.$update({
            todo_id : todo_id
        }, function(updatedTodo) {
            $location.path('/Todos/' + updatedTodo.id);
        });
    }

}


