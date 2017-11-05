function verbReducer(state = [], action) {
  switch (action.type) {
    case "fetch":
      console.log("fetch")
      return [].concat(action.verbs)
      break;
    default:
      console.log("default")
      break;
  };
};

export default verbReducer;
