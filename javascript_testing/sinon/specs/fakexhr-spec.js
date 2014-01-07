module("fake xhr");

test("should be able to handle responses - fakexhr", function() {
  var xhr = sinon.useFakeXMLHttpRequest();
  var requests = [];

  xhr.onCreate = function(request) {
    requests.push(request);
  };

  var responseData = '{"myData":3}';
  $.getJSON("some/url", function(data) { console.log(data); });
  requests[0].respond(200, {"Content-Type":"application/json"}, responseData);
  ok(requests[0].url === "some/url");

  xhr.restore();
});

test("should respond with data", function() {
  var server = sinon.fakeServer.create();
  server.respondWith([200, {"Content-Type":"application/json"}, '{"myData":35}']);

  var spy = sinon.spy();
  $.getJSON("some/url", spy);
  server.respond();
  ok(spy.calledWith({ myData: 35 }));

  server.restore();
});
