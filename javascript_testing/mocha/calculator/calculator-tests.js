describe("Calculator", function() {
	var calculator;

	before(function() {
		console.log("before");
		calculator = new Calculator();
	});

	beforeEach( function() {
		console.log("beforeEach");
	});

	describe("Add", function() {
		it("should add up two numbers correctly", function() {
			expect(calculator.add(1, 1)).to.be.equal(2);
		});

		it("should return NaN if passed 0 arguments");

		it("should expose a global variable by accident", function() {
			var sum = calculator.add(1, 1);
			expect(sum).to.be(2);
		});

		it("should be really really really slow", function() {
			var loops = 100000000;
			for (var i = 0; i < loops; i++) { i = i; }
			expect(i).to.be.equal(loops);
		})
	});

	afterEach(function() {
		console.log("afterEach");
	});

	after(function() {
		console.log("after");
	});
});