import React from 'react'

function Question(props) {
  if (props.step == 0) {
    return (<h4>{props.question.main_sentence}</h4>);
  } else if (props.step == 1) {
    return (<h4>{props.question.quantity_sentence}</h4>);
  } else if (props.step == 2) {
    return (<h4>{props.question.price_sentence}</h4>);
  }
}

export default Question