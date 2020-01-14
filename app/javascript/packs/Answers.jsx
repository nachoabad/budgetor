import React from 'react'

function Answers(props) {
  return (
    props.answers.map((answer, index) => (
      <input key={index} type='hidden' name="line_itemable[answers][]" value={answer} />
    ))
  );
}

export default Answers