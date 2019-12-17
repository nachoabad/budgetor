import React from 'react'

function Answers(props) {
  return (
    props.answers.map((answer, index) => (
      <input key={index} type='hidden' name="budget[answers][]" value={answer} />
    ))
  );
}

export default Answers