import React, {useState} from 'react'
import Answers from './Answers'

function MultiLineConfirmation(props) {
  return (
    <div className="col-12 text-center">
      <form className='form-width-400' action='/line_items' method='post'>
        <Answers answers={props.answers} />
        <input type='hidden' name='authenticity_token' value={props.csrf_token}></input>
        <input type='hidden' name='line_itemable[work_type_id]' value={props.work_type_id} />
        <input type='hidden' name='line_itemable[id]' value={props.line_itemable_id} />
        <input type='hidden' name='line_itemable[type]' value={props.line_itemable_type} />
        <input type="submit" className='btn btn-primary ' value='Guardar' />
      </form>
    </div>
  );
}

export default MultiLineConfirmation