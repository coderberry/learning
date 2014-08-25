describe("Stuff", function() {
	it ("should update in 500 ms", function(done) {
		poll.ping(function(message) {
			expect(message).to.be("Pong!");
			done();
		});
	});
});

describe("View", function() {
	it ("should show in 250ms", function(done) {
		view.show().then(function() {
			expect(view.$el.css("display")).to.be("block");
			done();
		});
	});
});