module("assertions");

test("should use a built-in assert", function() {
  var spy = sinon.spy();
  ok(spy.called, "intentionally failing spec");
});

// This will give better output on failed test
test("should use a sinon assert", function() {
  var spy = sinon.spy();
  sinon.assert.called(spy);
});
