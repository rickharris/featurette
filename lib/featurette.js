(function() {
  var Featurette;

  Featurette = (function() {

    function Featurette() {}

    Featurette.version = "1.2.0";

    Featurette.registered_features = {};

    Featurette.featurettes = {};

    Featurette.featurettes_counter = 0;

    Featurette.register = function(name, klass) {
      if (this.registered_features[name] != null) {
        return false;
      } else {
        this.registered_features[name] = klass;
        return true;
      }
    };

    Featurette.load = function(matchClass) {
      var element, featurette, id, klass, obj, _i, _len, _ref, _results;
      if (matchClass == null) matchClass = "featurette";
      _ref = $("." + matchClass);
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        element = _ref[_i];
        featurette = element.getAttribute("data-featurette");
        klass = this.registered_features[featurette];
        if (!klass) throw "Unknown featurette " + featurette;
        id = element.id;
        if (this.featurettes[id] == null) {
          if (!(id != null) || id === "") {
            id = "featurette-" + this.featurettes_counter;
            element.id = id;
          }
          obj = new klass(element);
          this.featurettes[id] = obj;
          _results.push(this.featurettes_counter += 1);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    Featurette.get = function(id) {
      return this.featurettes[id];
    };

    return Featurette;

  })();

  window.Featurette = Featurette;

}).call(this);
