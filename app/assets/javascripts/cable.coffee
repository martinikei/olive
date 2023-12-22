#= require cable
#= require_tree ./channels

@App ||= {}
App.cable = ActionCable.createConsumer()