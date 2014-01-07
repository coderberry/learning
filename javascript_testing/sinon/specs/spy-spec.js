module("spies");

test("should spy on a callback", function() {
  var spy = sinon.spy();
  mySUT.callCallback(spy);
  ok(spy.called);
});

test("should call a real implementation if given a real function to spy on", function() {
  var spy = sinon.spy(realCallback);
  var returnValue = mySUT.callCallbackWithReturnValue(spy);
  ok(spy.called);
  ok(returnValue === 4);
});

test("should spy on a method of an object", function() {
  var spy = sinon.spy(myDep, "someMethod");
  var returnValue = mySUT.callDependency(myDep);
  ok(spy.called);
  ok(returnValue === 10);
});


