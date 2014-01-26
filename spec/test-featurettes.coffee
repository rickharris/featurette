# Adds cool exclamation marks to whatever element it's on.
class Exclamation
  constructor: (element) ->
    element.innerHTML = element.innerHTML + "!"

Featurette.register("exclamation", Exclamation)