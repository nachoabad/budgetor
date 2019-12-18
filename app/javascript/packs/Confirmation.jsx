import React from 'react'
import Answers from './Answers'

function Confirmation(props) {

  return (
    <div className="col-12 text-center">
      <form className='form-width-400' action='/budgets' method='post'>
        <Answers answers={props.answers} />
        <input type='hidden' name='authenticity_token' value={props.csrf_token}></input>
        <input type='hidden' name='budget[client_id]' value={props.client_id} />
        <input type="submit" className='btn btn-primary btn-lg' value='Ver Presupuesto' />
      </form>
    </div>
  );
}

export default Confirmation