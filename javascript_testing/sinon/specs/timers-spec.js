var myClass = {
  doTimeout: function(cb) {
    setTimeout(cb, 1000);
  },

  hide: function() {
    $('#hideMe').fadeOut();
  }
};

module("timers");

var spy;
var cb = function() {
  console.log("cb called");
};

test("should be able to handle timeouts", function() {
  var clock = sinon.useFakeTimers();
  spy = sinon.spy(cb);

  myClass.doTimeout(spy);
  clock.tick(1010);
  ok(spy.called);
  clock.restore();
});

test("should be able to handle ui animations", function() {
  var clock = sinon.useFakeTimers();

  myClass.hide();
  clock.tick(1010);

  ok($("#hideMe:visible").length === 0);
  clock.restore();
});

test("should be able to fake dates", function() {
  var initialDate = 1357423755011;

  var clock = sinon.useFakeTimers(initialDate);

  var date1 = Date.now();
  console.log(date1);
  clock.tick(1000);
  var date2 = Date.now();
  console.log(date2);

  ok(date2 === (initialDate + 1000));

  clock.restore();
});
