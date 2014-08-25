/** @jsx React.DOM */
var APP = React.createClass({displayName: 'APP',
  render: function() {
    return (
      React.DOM.table(null, 
        React.DOM.thead(null, 
          React.DOM.tr(null, 
            React.DOM.th(null, "heading"), 
            React.DOM.th(null, "heading"), 
            React.DOM.th(null, "heading")
          )
        ), 
        React.DOM.tbody(null, 
          React.DOM.tr({className: "tr"}, 
            React.DOM.td(null, 
              React.DOM.form({action: "#"}, 
                React.DOM.input({type: "text"})
              )
            )
          )
        )
      )
    )
  }
});

React.renderComponent(APP(null), document.body);
