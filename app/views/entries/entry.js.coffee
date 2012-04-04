class Raffler.Views.Entry extends Backbone.View
  template: JST['entries/entry']
  
  render: ->
    $(@el).html(@template())
    this
