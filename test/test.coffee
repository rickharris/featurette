# Testing method for firing off a test against a frame
frameTest = (path, callback) ->
  run = true
  $("#test-frame").load () ->
    if run
      callback(window.frames[0])
      $("#test-frame").unbind
      start()
    run = false

  $("#test-frame").attr("src", "fixtures/#{path}")

# Dumb featurette
class Dummy
  constructor: () ->
    "blah"

asyncTest "featurettes should be registered", ->
  frameTest "simple.html", (frame) ->
    ok(frame.Featurette.registered_features.exclamation)
    ok(frame.Featurette.registered_features.rainbowify)

asyncTest "duplicate featurettes shouldn't be able to be registered", ->
  frameTest "simple.html", (frame) ->
    equal(frame.Featurette.register("exclamation", Dummy), false)

asyncTest "loading a page loads and executes featurettes", ->
  frameTest "simple.html", (frame) ->
    equal(frame.jQuery("h1").text(), "¡Ay, caramba!")

test "executing a featurette load a second time on a page skips already loaded featurettes", ->
  ok(true, "TODO")

test "loading up featurette with a different match class works", ->
  ok(true, "TODO")

test "featurettes with no id are given an id", ->
  ok(true, "TODO")
