import { Route } from "react-router-dom";
import React from 'react';
import PokemonIndexContainer from './../components/pokemon/pokemon_index_container';
import PokemonDetailContainer from './../components/pokemon/pokemon_detail_container';
import { Switch } from 'react-router-dom'

const App = () => (
  <Switch>
    <Route path="/pokemons/:pokeId" component={PokemonDetailContainer} />
    <Route path="/" component={PokemonIndexContainer} />
  </Switch>
)

export default App;