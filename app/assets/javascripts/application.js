// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require angular
//= require angular-resource
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

angular.module('TodoCommentRails', ['todosService', 'commentsService',])

  .config(['$httpProvider', function(provider){
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }])
  .config(['$routeProvider', function(router){
    router
      .when('/todos', {templateUrl:'/todo/index.html', controller:TodosCtrl})
      .when('/todos/add', {templateUrl:'/todo/add.html', controller: TodoAddCtrl})
      .when('/todos/:todo_id', {templateUrl:'/todo/show.html', controller:TodoShowCtrl})
      .when('/todos/:todo_id/edit', {templateUrl:'/todo/edit.html', controller: TodoEditCtrl})
      .otherwise({redirectTo: '/todos'});
}]);
$(document).on('ready page:load', function(){
  angular.bootstrap(document.body, ['TodoCommentRails']);
});