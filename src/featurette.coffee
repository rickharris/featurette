class Featurette
  @version = "1.2.0"

  @registered_features = {}
  @featurettes_counter = 0

  # Registers a new featurette.
  @register: (name, klass) ->
    @registered_features[name] = klass

  @load: ->
    elements = document.querySelectorAll("[data-featurette]")

    element.featuretteLoading = true for element in elements

    for element in elements
      featurette = element.getAttribute("data-featurette")

      klass = @registered_features[featurette]

      if klass
        id = element.id
        if not element.featurette and not element.featuretteLoading

          # Set up the automatic id for the element
          if not id? or id is ""
            id = "featurette-#{@featurettes_counter}"
            element.id = id

          obj = new klass(element)

          element.featurette = obj
          @featurettes_counter += 1
      else
        if window.console
            console.log "Unknown featurette #{featurette}"

  # Returns the featurette object attached to this element
  @get: (id) ->
    document.getElementById(id)?.featurette

window.Featurette = Featurette
