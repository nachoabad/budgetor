import React from 'react'

function Choice(props) {
  return (
    <div className="col-12 text-center">
      <button className={`btn btn-lg`}
              onClick={() => props.handleClick(props.choice.id)}>
        {props.choice.name}
      </button>
    </div>
  );
}

export default Choice