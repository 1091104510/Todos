class Todos.Views.EntriesEdit extends Backbone.View
  template: JST['entries/edit']
  events:
    'submit #edit-entry'     : 'editEntry'

  render: ->
    $(@el).html(@template({model: @model}))
    @

  editEntry: (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.set({task: $('#edit-todo').val(), duedate: $("#edit-due").val()})
    @model.save()
    window.location.hash ="index"

    
    
