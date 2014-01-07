var myXhrWrapper = {
  get: function() { console.log("--get function"); },
  save: function() { console.log("--save function"); }
};

module("sandbox", {
  setup: function() {
  },
  teardown: function() {
    console.log("sandbox restored");
    myXhrWrapper.get();
    myXhrWrapper.save();
  }
});

test("should be able to sandbox", function() {
  expect(0);
  var sandbox = sinon.sandbox.create();

  console.log("in sandboxed test");
  sandbox.stub(myXhrWrapper);
  myXhrWrapper.get();
  myXhrWrapper.save();

  sandbox.restore();
});

test("should be able to sandbox 2", sinon.test(function() {
  expect(0);

  console.log("in sandboxed test");
  this.stub(myXhrWrapper);
  myXhrWrapper.get();
  myXhrWrapper.save();
}));
