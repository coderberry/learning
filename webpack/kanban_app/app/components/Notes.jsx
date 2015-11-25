import React from 'react';
import Note from './Note.jsx';

export default class Notees extends React.Component {
  render() {
    const notes = this.props.items;

    this.renderNote = this.renderNote.bind(this);

    return <ul className="notes">{notes.map(this.renderNote)}</ul>;
  }
  renderNote(note) {
    return (
      <li className="note" key={note.id}>
        <Note
          task={note.task}
          onEdit={this.props.onEdit.bind(null, note.id)}
          onDelete={this.props.onDelete.bind(null, note.id)} />
      </li>
    )
  }
};
