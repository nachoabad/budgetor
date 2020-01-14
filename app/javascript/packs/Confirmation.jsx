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
        <input type='hidden' name='line_itemable[client_id]' value={props.client_id} />
        <input type='hidden' name='line_itemable[work_type_id]' value={props.work_type_id} />
        <input type='hidden' name='line_itemable[address]' value={props.address} />
        <input type='hidden' name='line_itemable[id]' value={props.line_itemable_id} />
        <input type='hidden' name='line_itemable[type]' value={props.line_itemable_type} />
        <div className='form-group'>
          <input  type='text' 
                  name='line_item[price]'
                  value={price}
                  className='form-control'
                  placeholder='Introduzca el precio'
                  onChange={handlePrice} 
                  required/>
        </div>
        <input type="submit" className='btn btn-primary ' value='Agregar Línea de Estimado' />
      </form>
    </div>
  );
}

export default Confirmation