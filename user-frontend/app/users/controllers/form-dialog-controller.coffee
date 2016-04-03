'use strict'


class FormDialogCtrl
  ### @ngInject ###
  constructor: (
    title,
    fields,
    $mdDialog,
    entity
  ) ->
    @title = title
    @fields = fields

    @model = entity

    @cancel = ->
      $mdDialog.cancel()

    @submit = ->
      $mdDialog.hide(@model)

angular
  .module('users')
  .controller 'FormDialogCtrl', FormDialogCtrl
