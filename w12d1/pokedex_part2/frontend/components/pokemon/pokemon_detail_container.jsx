import {connect} from 'react-redux';
import { requestPokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => {
    return ({
        pokemon: state.pokemon[ownProps.match.params.pokeId]
    })
}

const mapDispatchToProps = (dispatch, ownProps) => {
    return ({
        requestPokemon: (pokeId) => dispatch(requestPokemon(pokeId))
    })
}

export default connect(
    mapStateToProps,
    mapDispatchToProps
  )(PokemonDetail);