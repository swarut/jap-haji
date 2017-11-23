import { FETCH_VERB, CHECK_YOMI } from '../actions/index';

// const initialState = {
//   verbs: []
// }

function verbReducer(state = [], action) {
  switch (action.type) {
    case FETCH_VERB:
      return [
        // ...state,
        ...(action.payload.verbs)
      ];
      break;
    case CHECK_YOMI:
      return [].concat(action.payload.verbs)
      break;
    default:
      return state;
      break;
  };
};

export default verbReducer;
