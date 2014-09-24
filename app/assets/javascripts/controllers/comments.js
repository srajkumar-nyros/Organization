function CommentsCtrl($scope, $routeParams, Comments) {
    "use strict";
    $scope.comments = Comments.index({
        id : $routeParams.todo_id
    });
}

function CommentShowCtrl($scope, $location, $routeParams, Comment) {"use strict";
    $scope.comment = Comment.show({
        comment_todo_id : $routeParams.todo_id
    });

    
}

function CommentAddCtrl($scope, $location, Comments, Comment, Todos, Todo, $routeParams, $route) {
    "use strict";

		//alert($routeParams.todo_id)
    $scope.comment = {};
    $scope.comment.todo_id = $routeParams.todo_id;
    $scope.create = function(comment) {
        var commentService = new Comments(comment);
        commentService.$create(function(comment) {
            $route.reload();
        });
    }
}

function CommentEditCtrl($scope, $routeParams, $location, Comment) {
    "use strict";
    
    $scope.master = {};
    var comment_id = $routeParams.comment_id;
    $scope.comment = Comment.show({
        comment_id : comment_id
    }, function(resource) {
        $scope.master = angular.copy(resource);
    });

    $scope.update = function(comment) {
        comment.$update({
            comment_id : comment_id
        }, function(updatedComment) {
            $location.path('/todo/' + updatedComment.id);
        });
    }
}

