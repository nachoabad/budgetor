import React from 'react'

function Answer(props) {
  if (props.step == 0) {
    return (
      <div>
        <div className="col-12 text-center">
          <button className='btn btn-primary my-2'
                  onClick={() => props.handleClick(true)}>
            SÍ
          </button>
        </div>
        <div className="col-12 text-center">
          <button className='btn btn-primary my-2'
                  onClick={() => props.handleClick(false)}>
            NO
          </button>
        </div>
      </div>
    );
  } else {
    return (
      <form onSubmit={props.handleSubmit} className='form-width-400'>
        <input type="number" className='form-control mb-3'  value={props.input} onChange={props.handleInput} required />
        <input type="submit" className='btn btn-primary' value='Guardar' />
      </form>
    );
  }
}

export default Answer