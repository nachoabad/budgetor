import React from 'react'
import Choice from './Choice'

function Choices(props) {
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
    <form onSubmit={props.handleSubmit} className='form-width-400'>
      <input type="text" className='form-control mb-3'  value={props.input} onChange={props.handleInput} required />
      <input type="submit" className='btn btn-primary' value='Guardar' />
    </form>
  );
}

export default Choices