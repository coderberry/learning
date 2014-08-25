/** @jsx React.DOM */
var PersonTable = React.createClass({
  getInitialState: function() {
    return {
      data: [
        {
          "id": 1,
          "fname": "Marquita",
          "lname": "Key"
        },
        {
          "id": 2,
          "fname": "Allie",
          "lname": "Wall"
        },
        {
          "id": 3,
          "fname": "Houston",
          "lname": "Duran"
        },
        {
          "id": 4,
          "fname": "Jenifer",
          "lname": "Norris"
        },
        {
          "id": 5,
          "fname": "Pearson",
          "lname": "Roman"
        },
        {
          "id": 6,
          "fname": "Ora",
          "lname": "Perkins"
        },
        {
          "id": 7,
          "fname": "Bryan",
          "lname": "Ewing"
        },
        {
          "id": 8,
          "fname": "Barrett",
          "lname": "Murphy"
        },
        {
          "id": 9,
          "fname": "Claudia",
          "lname": "Griffith"
        },
        {
          "id": 10,
          "fname": "Livingston",
          "lname": "Kaufman"
        },
        {
          "id": 11,
          "fname": "Newton",
          "lname": "Flynn"
        },
        {
          "id": 12,
          "fname": "Morton",
          "lname": "Boyle"
        },
        {
          "id": 13,
          "fname": "Smith",
          "lname": "Romero"
        },
        {
          "id": 14,
          "fname": "Small",
          "lname": "Russo"
        },
        {
          "id": 15,
          "fname": "Lindsey",
          "lname": "Chan"
        },
        {
          "id": 16,
          "fname": "Heidi",
          "lname": "Matthews"
        }
      ]
    }
  },
  render: function() {
    return (
      <table>
      {this.state.data.map(function(person, i) {
        return <PersonRow key={i} data={person} />
      })}
      </table>
    )
  }
});

var PersonRow = React.createClass({
  render: function() {
    return (
      <tr>
        <td>{this.props.data.id}</td>
        <td>{this.props.data.fname}</td>
        <td>{this.props.data.lname}</td>
      </tr>
    )
  }
});
