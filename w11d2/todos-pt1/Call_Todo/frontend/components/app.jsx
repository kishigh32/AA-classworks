import React from 'react';
import TodoListContainer from './todos/todo_list_container';

const App = () => {
    return (
        <div>
            <TodoListContainer/> 
            {/* connect(mapStateToProps, mapDispatchToProps)(TodoList) */}
        </div>
    )
}

export default App;