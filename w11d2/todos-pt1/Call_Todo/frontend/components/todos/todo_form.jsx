import React from 'react';
import { uniqueId } from './id_generator'

class TodoForm extends React.Component {
    constructor(props) {
        // debugger;
        super(props);
        this.state = {
            // id: Math.floor(Math.random() * 1000000),
            title: '', 
            body: '',
            done: false
        }

        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(property) {
        return e => this.setState({[property]: e.target.value});
      }

    handleSubmit(e) {
        // debugger;
        e.preventDefault();
        const todo = Object.assign({}, this.state, { id: uniqueId()});
        this.props.receiveTodo(todo);
        // debugger;
        this.setState({
            // id: Math.floor(Math.random() * 1000000),
            title: '', 
            body: ''
        });
    }

    render() {
        // debugger;
        return (
            <form onSubmit={this.handleSubmit}>
                <h3>To DO</h3>
                <label>Title:
                    <input
                        type="text"
                        value={this.state.title}
                        onChange={this.update('title')}
                    />
                </label>
                <br />
                <label>Body:
                    <input
                        type="text"
                        value={this.state.body}
                        onChange={this.update("body")}
                    />
                </label>
                <br />
                <input type="submit" value="To Do" />
            </form>
        )
    }
}

export default TodoForm;