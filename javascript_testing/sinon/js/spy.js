var mySUT = {
  callCallback: function(cb) {
    cb();
  },

  callCallbackWithReturnValue: function(cb) {
    return cb();
  },

  callDependency: function(dep) {
    return dep.someMethod();
  }
};

function realCallback() {
  return 4;
}

var myDep = {
  someMethod: function() {
    return 10;
  }
};
