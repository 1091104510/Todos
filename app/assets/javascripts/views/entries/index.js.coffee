class Todos.Views.EntriesIndex extends Backbone.View
  template: JST['entries/index']
  events:
    'submit #new_entry'     : 'createEntry'
    'click .delete'         : 'deleteEntry'
    'click .delete_all'     : 'delete_all_entries'
  
  render: ->
    $(@el).html(@template({todos: @options.todos}))
    @

  initialize: ->
    @todos = @options.todos
  
  createEntry: (event) ->
    event.preventDefault()

    entry = new Todos.Models.Entry
    entry.set({task: $('#new-todo').val(), duedate: $("#new-due").val()})

    @todos.create(entry.toJSON(), 
      success: (a) ->
        entry = a
        $('#new_entry')[0].reset()        
        $("#task-list").append("<div id=\"task_#{entry.get('id')}\">#{entry.get('task')}<br/>#{entry.get('duedate')}<button class=\"delete\" data-id=\"#{entry.get('id')}\">Delete</button><a href =\"#/entries/#{entry.get('id')}/edit\">Edit</a><hr/></div>")        
        )
 
  deleteEntry: (e) ->
    e.preventDefault()
    e.stopPropagation()
    id = $(e.currentTarget).data("id")  
    delete_entry =  @todos.get(id)
    delete_entry.destroy()
    $("#task_#{id}").remove()

  delete_all_entries:(e) ->
  
    for a in _.toArray(@todos)
      do (a) ->
        $("#task_#{a.get('id')}").remove()
        a.destroy()
   


