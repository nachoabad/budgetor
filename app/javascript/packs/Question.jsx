import React from 'react'
import Choice from './Choice'

function Question(props) {
  const choices = props.question.choices
  if (choices.length > 0) {
    return (
      choices.map(choice => (
        <Choice key={choice.id}
                choice={choice}
                handleClick={props.handleClick} />
      ))
    );
  } 
  return (
    <form onSubmit={props.handleSubmit}>
      <input type="text"   value={props.input} onChange={props.handleInput} />
      <input type="submit" value="Submit" />
    </form>
  );
}

export default Question