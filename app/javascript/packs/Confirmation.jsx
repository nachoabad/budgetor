import React, {useState} from 'react'
import Answers from './Answers'

function Confirmation(props) {
  const [price, setPrice] = useState('');

  const handlePrice = event => {
    setPrice(event.target.value)
  };

  return (
    <div className="col-12 text-center">
      <form className='form-width-400' action='/line_items' method='post'>
        <Answers answers={props.answers} />
        <input type='hidden' name='authenticity_token' value={props.csrf_token}></input>
        <input type='hidden' name='budget[client_id]' value={props.client_id} />
        <input type='hidden' name='budget[id]' value={props.budget_id} />
        <div className='form-group'>
          <input  type='text' 
                  name='line_item[price]'
                  value={price}
                  className='form-control'
                  placeholder='Introduzca el precio'
                  onChange={handlePrice} 
                  required/>
        </div>
        <input type="submit" className='btn btn-primary ' value='Agregar Línea de Presupuesto' />
      </form>
    </div>
  );
}

export default Confirmation