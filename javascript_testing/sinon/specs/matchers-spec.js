module("matchers");

test("should work with matchers", function() {
  var spy = sinon.spy();

  spy('1234');
  ok(spy.calledWithMatch(sinon.match.string));

  var o = {myProp:1};
  spy(o);
  ok(spy.calledWithMatch(sinon.match.same(o)));

  spy({myProp:42, myProp2: 29});
  ok(spy.calledWithMatch(sinon.match.has("myProp", 42)));
});

