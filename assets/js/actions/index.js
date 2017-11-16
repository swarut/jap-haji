export const FETCH_VERB = 'FETCH_VERB';
export const CHECK_YOMI = 'CHECK_YOMI';
export const ADD_VERB = 'ADD_VERB';

// const fetchVerbsAction = () => {

export function fetchVerbsAction(verbs) {
  return { type: FETCH_VERB, payload: { verbs } };
}

export function addVerbAction(verb) {
  return { type: ADD_VERB, payload: { verbs: verb} };
}

export function checkYomiAction(verb, user_yomi) {
  return { type: CHECK_YOMI, payload: {verb: verb, user_yomi: user_yomi} };
}
