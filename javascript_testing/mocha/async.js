var poll = {
	ping: function(pong) {
		setTimeout(function() { pong("Pong!"); }, 500);
	}
};

var view = {
	$el: $("#main"),
	show: function() {
		return this.$el.fadeIn(250).promise();
	}
};