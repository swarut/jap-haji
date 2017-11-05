// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

import React from "react"
import ReactDom from "react-dom"
import { createStore } from 'redux'
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider'

import MainComponent from "./components/main_component"
import { Socket } from 'phoenix'

import verbReducer from './reducers/index'

const socket = new Socket('ws://127.0.0.1:4000/socket');
socket.connect();
const channel = socket.channel('verb:lobby');
console.log(channel);
console.log(socket);
let verbs = [];

const store = createStore(verbReducer);


const App = () => (
  <MuiThemeProvider>
    <MainComponent verbs={verbs}/>
  </MuiThemeProvider>
);
const render = () => {
  console.log("-------render", verbs);
  ReactDom.render(<App />, document.getElementById("page"));
}

store.subscribe(render);

channel.join()
  .receive('ok', messages => {
    console.log('join success', messages);
    verbs = messages.verbs.data;
    store.dispatch({ type: 'fetch' })
  })
  .receive('error', reason => {
    console.log('failed join', reason);

  });
