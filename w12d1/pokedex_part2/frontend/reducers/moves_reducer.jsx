import { RECEIVE_POKEMON } from './../actions/pokemon_actions';


const movesReducer = (state = {}, action) => {
  Object.freeze(state);
  let nextState = Object.assign({}, state);
  switch (action.type){
  case RECEIVE_POKEMON:
    nextState.moves = action.pokemon.moves;
    return nextState;
  default:
    return state;
  }
}
  
export default movesReducer;
