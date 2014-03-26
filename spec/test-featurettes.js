// Generated by CoffeeScript 1.7.1
(function() {
  var Exclamation, ExclamationGenerator;

  Exclamation = (function() {
    function Exclamation(element) {
      element.innerHTML = element.innerHTML + "!";
    }

    return Exclamation;

  })();

  Featurette.register("exclamation", Exclamation);

  ExclamationGenerator = (function() {
    function ExclamationGenerator(element) {
      element.innerHTML = "<div data-featurette='exclamation'>Cool Beans</div>";
      Featurette.load();
    }

    return ExclamationGenerator;

  })();

  Featurette.register('exclamation-generator', ExclamationGenerator);

}).call(this);
