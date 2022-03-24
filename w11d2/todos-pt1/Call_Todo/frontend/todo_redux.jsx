import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
import { receiveTodo, receiveTodos } from './actions/todo_actions';
import { allTodos } from './reducers/selectors';
// import { To}

document.addEventListener("DOMContentLoaded", () => {
  console.log("Todos App Abbey")

  const store = configureStore();
  const root = document.getElementById("root");
  console.log(root);
  window.store = store;
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  window.allTodos = allTodos;

  ReactDOM.render(<Root store={store} />, root)
})