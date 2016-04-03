'use strict'

###*
 # @ngdoc object
 # @name users.controller:UsersCtrl

 # @description

###
class UsersCtrl
  ### @ngInject ###
  constructor: (
    $mdDialog,
    UsersManager,
    $scope
  ) ->
    init = () =>

      @items = []
      @selected = {}
      @query = UsersManager.query
      @load = load

      @onPaginate = onPaginate

      @openAddDialog = openAddDialog
      @openEditDialog = openEditDialog

      @load()

    ###########

    #   list
    load = =>
      UsersManager.getList(@query).then (data) =>
        @items = data
        @query.total = @items?.metadata?['hydra:totalItems']

    onPaginate = (page) =>
      @query.page = page
      load()


    #   CRUD
    openAddDialog = ->
      $mdDialog.show(
        templateUrl: 'users/views/user-form.modal.tpl.html'
        controller: 'FormDialogCtrl'
        controllerAs: 'formDialogCtrl'
        locals:
          title: 'Add user'
          fields: UsersManager.newForm
          entity: {}

      ).then (submittedData) ->
        UsersManager.new(submittedData).then ->
          load()

    openEditDialog = (user) ->
      $mdDialog.show(
        templateUrl: 'users/views/user-form.modal.tpl.html'
        controller: 'FormDialogCtrl'
        controllerAs: 'formDialogCtrl'
        locals:
          title: 'Edit user'
          fields: UsersManager.editForm
          entity: user
      ).then (submittedData) ->
        UsersManager.update(user['@id'], submittedData).then ->
          load()
        , ->
          load()

    init()

angular
  .module('users')
  .controller 'UsersCtrl', UsersCtrl
