/** @jsx React.DOM */
React.createClass({
  render: function() {
    var myStyle = {
      backgroundColor: 'yellow',
      height: 10
    };
    return (
      <div style={myStyle} rendered="x" data-rendered="x">
        {/* This is a comment */}
        <a href="#" onClick={this.update}>this props</a>
        {i > 1 ? 'More than one' : 'One'}
        {i > 1 && 'More than one'}
      </div>
    )
  }
});
