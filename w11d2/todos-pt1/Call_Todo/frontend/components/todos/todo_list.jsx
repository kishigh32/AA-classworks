import React from 'react';
import TodoForm from './todo_form';

export const TodoList = (props) => {
    return (
        <div>
            <h2>Todos List of Kia</h2>
            <ul>
                {
                    props.todos.map(todo => <li key={todo.id}>Title: {todo.title}, Body: {todo.body}</li>)
                }
            </ul>
            <TodoForm receiveTodo={props.receiveTodo}/>
        </div>
    )
}

export default TodoList;